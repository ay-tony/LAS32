package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

class IntAlu(lucStageIndex: Int, aluStageIndex: Int) extends Plugin {

    object LucOp extends SpinalEnum {
        val si12, si20, ui12 = newElement()
    }
    val LUC_OP = Payload(LucOp()) // control signal
    val LUC_OUT = Payload(Bits(32 bits))
    val WRITE_AT_LUC = Payload(Bool()) // control signal

    object AluOp extends SpinalEnum {
        val add, sub, slt, sltu, and, or, nor, xor = newElement()
    }
    val ALU_OP = Payload(AluOp()) // control signal
    object AluSrc1 extends SpinalEnum {
        val rj, pc = newElement()
    }
    val ALU_SRC1 = Payload(AluSrc1()) // control signal
    object AluSrc2 extends SpinalEnum {
        val rk, luc = newElement()
    }
    val ALU_SRC2 = Payload(AluSrc2()) // control signal
    val ALU_OUT = Payload(Bits(32 bits))
    val WRITE_AT_ALU = Payload(Bool()) // control signal

    override def register(pipeline: Pipeline) = {
        val decoderService = pipeline.getService(classOf[DecoderService])

        decoderService.addSignal(ALU_OP, AluOp.add())
        decoderService.addSignal(ALU_SRC1, AluSrc1.rj())
        decoderService.addSignal(ALU_SRC2, AluSrc2.rk())
        decoderService.addSignal(LUC_OP, LucOp.si12())
        decoderService.addSignal(WRITE_AT_LUC, False)
        decoderService.addSignal(WRITE_AT_ALU, False)

        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile.{REGFILE_RJ_ENABLE, REGFILE_RK_ENABLE, REGFILE_RD_ENABLE}

        val commonAluSignals = List(
            REGFILE_RJ_ENABLE -> True,
            REGFILE_RK_ENABLE -> True,
            REGFILE_RD_ENABLE -> True,
            WRITE_AT_ALU -> True
        )

        val commonAluSi12Signals = List(
            LUC_OP -> LucOp.si12(),
            ALU_SRC2 -> AluSrc2.luc(),
            REGFILE_RJ_ENABLE -> True,
            REGFILE_RD_ENABLE -> True,
            WRITE_AT_ALU -> True
        )

        val commonAluUi12Signals = List(
            LUC_OP -> LucOp.ui12(),
            ALU_SRC2 -> AluSrc2.luc(),
            REGFILE_RJ_ENABLE -> True,
            REGFILE_RD_ENABLE -> True,
            WRITE_AT_ALU -> True
        )

        // ADD.W
        decoderService.addInstruction(
            M"00000000000100000---------------",
            commonAluSignals
        )

        // TODO: test instructions below

        // SUB.W
        decoderService.addInstruction(
            M"00000000000100010---------------",
            commonAluSignals :+ (ALU_OP -> AluOp.sub())
        )

        // ADDI.W
        decoderService.addInstruction(
            M"0000001010----------------------",
            commonAluSi12Signals
        )

        // LU12I.W
        decoderService.addInstruction(
            M"0001010-------------------------",
            List(
                LUC_OP -> LucOp.si20(),
                REGFILE_RD_ENABLE -> True,
                WRITE_AT_LUC -> True
            )
        )

        // SLT
        decoderService.addInstruction(
            M"00000000000100100---------------",
            commonAluSignals :+ (ALU_OP -> AluOp.slt())
        )

        // SLTU
        decoderService.addInstruction(
            M"00000000000100101---------------",
            commonAluSignals :+ (ALU_OP -> AluOp.sltu())
        )

        // SLTI
        decoderService.addInstruction(
            M"0000001000----------------------",
            commonAluSi12Signals :+ (ALU_OP -> AluOp.slt())
        )

        // SLTUI
        decoderService.addInstruction(
            M"0000001001----------------------",
            commonAluSi12Signals :+ (ALU_OP -> AluOp.sltu())
        )

        // PCADDU12I
        decoderService.addInstruction(
            M"0001110-------------------------",
            List(
                LUC_OP -> LucOp.si20(),
                ALU_SRC1 -> AluSrc1.pc(),
                ALU_SRC2 -> AluSrc2.luc(),
                REGFILE_RD_ENABLE -> True,
                WRITE_AT_ALU -> True
            )
        )

        // AND
        decoderService.addInstruction(
            M"00000000000101001---------------",
            commonAluSignals :+ (ALU_OP -> AluOp.and())
        )

        // OR
        decoderService.addInstruction(
            M"00000000000101010---------------",
            commonAluSignals :+ (ALU_OP -> AluOp.or())
        )

        // NOR
        decoderService.addInstruction(
            M"00000000000101000---------------",
            commonAluSignals :+ (ALU_OP -> AluOp.nor())
        )

        // XOR
        decoderService.addInstruction(
            M"00000000000101011---------------",
            commonAluSignals :+ (ALU_OP -> AluOp.xor())
        )

        // ANDI
        decoderService.addInstruction(
            M"0000001101----------------------",
            commonAluUi12Signals :+ (ALU_OP -> AluOp.and())
        )

        // ORI
        decoderService.addInstruction(
            M"0000001110----------------------",
            commonAluUi12Signals :+ (ALU_OP -> AluOp.or())
        )

        // XORI
        decoderService.addInstruction(
            M"0000001111----------------------",
            commonAluUi12Signals :+ (ALU_OP -> AluOp.xor())
        )
    }

    override def build(pipeline: Pipeline) = {
        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile._

        val fetcher = pipeline.getPlugin(classOf[Fetcher])
        import fetcher._

        val lucStage = pipeline.stages(lucStageIndex)
        new lucStage.Area {
            LUC_OUT := LUC_OP.mux(
                LucOp.si12 -> B(S(INSTRUCTION(21 downto 10), 32 bits)),
                LucOp.si20 -> B(INSTRUCTION(24 downto 5) ## B(0, 12 bits)),
                LucOp.ui12 -> B(U(INSTRUCTION(21 downto 10), 32 bits))
            )

            when(WRITE_AT_LUC) {
                lucStage.bypass(REGFILE_RD) := LUC_OUT
            }
        }

        val aluStage = pipeline.stages(aluStageIndex)
        new aluStage.Area {
            val src1, src2 = Bits(32 bits)
            src1 := ALU_SRC1.mux(
                AluSrc1.rj -> B(REGFILE_RJ),
                AluSrc1.pc -> B(PC)
            )
            src2 := ALU_SRC2.mux(
                AluSrc2.rk -> B(REGFILE_RK),
                AluSrc2.luc -> B(LUC_OUT)
            )

            ALU_OUT := ALU_OP.mux(
                AluOp.add -> B(U(src1) + U(src2)),
                AluOp.sub -> B(U(src1) - U(src2)),
                AluOp.slt -> B((S(src1) < S(src2)) ? U(1, 32 bits) | U(0, 32 bits)),
                AluOp.sltu -> B((U(src1) < U(src2)) ? U(1, 32 bits) | U(0, 32 bits)),
                AluOp.and -> (src1 & src2),
                AluOp.or -> (src1 | src2),
                AluOp.nor -> ~(src1 | src2),
                AluOp.xor -> (src1 ^ src2)
            )

            when(WRITE_AT_ALU) {
                aluStage.bypass(REGFILE_RD) := ALU_OUT
            }
        }
    }
}
