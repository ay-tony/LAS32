package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

class IntAlu(stageIndex: Int) extends Plugin {

    object AluOp extends SpinalEnum {
        val add, sub, or = newElement()
    }
    val ALU_OP = Payload(AluOp()) // control signal
    val ALU_OUT = Payload(Bits(32 bits))

    override def register(pipeline: Pipeline) = {
        val decoderService = pipeline.getService(classOf[DecoderService])

        decoderService.addSignal(ALU_OP, AluOp.add())

        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile.{REGFILE_VAL1_ENABLE, REGFILE_VAL2_ENABLE, REGFILE_WRITE_ENABLE}

        // ADD.W
        decoderService.addInstruction(
            M"00000000000100000---------------",
            List(
                ALU_OP -> AluOp.add(),
                REGFILE_VAL1_ENABLE -> True,
                REGFILE_VAL2_ENABLE -> True,
                REGFILE_WRITE_ENABLE -> True
            )
        )
    }

    override def build(pipeline: Pipeline) = {
        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile._

        val in1 = REGFILE_VAL1
        val in2 = REGFILE_VAL2

        val stage = pipeline.stages(stageIndex)
        new stage.Area {
            ALU_OUT := ALU_OP.mux(
                AluOp.add -> B(U(in1) + U(in2)),
                default -> B(0)
            )
            REGFILE_WRITE_VAL := ALU_OUT
        }
    }
}
