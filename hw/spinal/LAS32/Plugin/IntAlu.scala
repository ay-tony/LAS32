package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

class IntAlu(stageIndex: Int) extends Plugin {

    object AluOp extends SpinalEnum {
        val add, sub, src2 = newElement()
    }
    val ALU_OP = Payload(AluOp()) // control signal
    object AluSrc2 extends SpinalEnum {
        val rk, si12, si20 = newElement()
    }
    val ALU_SRC2 = Payload(AluSrc2()) // control signal
    val ALU_OUT = Payload(Bits(32 bits))

    override def register(pipeline: Pipeline) = {
        val decoderService = pipeline.getService(classOf[DecoderService])

        decoderService.addSignal(ALU_OP, AluOp.add())
        decoderService.addSignal(ALU_SRC2, AluSrc2.rk())

        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile.{REGFILE_RJ_ENABLE, REGFILE_RK_ENABLE, REGFILE_RD_ENABLE}

        // ADD.W
        decoderService.addInstruction(
            M"00000000000100000---------------",
            List(
                REGFILE_RJ_ENABLE -> True,
                REGFILE_RK_ENABLE -> True,
                REGFILE_RD_ENABLE -> True
            )
        )

        // TODO: test instructions below

        // SUB.W
        decoderService.addInstruction(
            M"00000000000100010---------------",
            List(
                ALU_OP -> AluOp.sub(),
                REGFILE_RJ_ENABLE -> True,
                REGFILE_RK_ENABLE -> True,
                REGFILE_RD_ENABLE -> True
            )
        )

        // ADDI.W
        decoderService.addInstruction(
            M"0000001010----------------------",
            List(
                ALU_SRC2 -> AluSrc2.si12(),
                REGFILE_RJ_ENABLE -> True,
                REGFILE_RD_ENABLE -> True
            )
        )

        // LU12I.W
        decoderService.addInstruction(
            M"0001010-------------------------",
            List(
                ALU_OP -> AluOp.src2(),
                ALU_SRC2 -> AluSrc2.si20(),
                REGFILE_RD_ENABLE -> True
            )
        )
    }

    override def build(pipeline: Pipeline) = {
        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile._

        val fetcher = pipeline.getPlugin(classOf[Fetcher])
        import fetcher.INSTRUCTION

        val stage = pipeline.stages(stageIndex)
        new stage.Area {
            val src1 = REGFILE_RJ
            val src2 = Bits(32 bits)
            src2 := ALU_SRC2.mux(
                AluSrc2.rk -> B(REGFILE_RK),
                AluSrc2.si12 -> B(S(INSTRUCTION(21 downto 10), 32 bits)),
                AluSrc2.si20 -> B(S(INSTRUCTION(24 downto 5), 32 bits))
            )

            ALU_OUT := ALU_OP.mux(
                AluOp.add -> B(U(src1) + U(src2)),
                AluOp.sub -> B(U(src1) - U(src2)),
                AluOp.src2 -> B(S(src2))
            )
            REGFILE_RD := ALU_OUT
        }
    }
}
