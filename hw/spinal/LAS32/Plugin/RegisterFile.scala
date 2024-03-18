package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

class RegisterFile(readStageIndex: Int, writeStageIndex: Int) extends Plugin {

    // regfile read
    val REGFILE_VAL1_ENABLE, REGFILE_VAL2_ENABLE = Payload(Bool()) // control signal
    val REGFILE_VAL1_ADDR, REGFILE_VAL2_ADDR = Payload(UInt(5 bits)) // control signal
    val REGFILE_VAL1, REGFILE_VAL2 = Payload(Bits(32 bits))

    // regfile write
    val REGFILE_WRITE_VAL_ENABLE = Payload(Bool()) // control signal
    val REGFILE_WRITE_VAL_ADDR = Payload(UInt(5 bits)) // control signal
    val REGFILE_WRITE_VAL = Payload(Bits(32 bits))

    val regfile = Mem(Bits(32 bits), 32)

    override def register(pipeline: Pipeline): Unit = {
        val decoderService = pipeline.getService(classOf[DecoderService])

        decoderService.addSignal(REGFILE_VAL1_ENABLE, False)
        decoderService.addSignal(REGFILE_VAL2_ENABLE, False)
        decoderService.addSignal(REGFILE_VAL1_ADDR, (INSTRUCTION: Bits) => U(INSTRUCTION(9 downto 5)))
        decoderService.addSignal(REGFILE_VAL2_ADDR, (INSTRUCTION: Bits) => U(INSTRUCTION(14 downto 10)))
        decoderService.addSignal(REGFILE_WRITE_VAL_ENABLE, False)
        decoderService.addSignal(REGFILE_WRITE_VAL_ADDR, (INSTRUCTION: Bits) => U(INSTRUCTION(4 downto 0)))
    }

    override def build(pipeline: Pipeline): Unit = {
        val writeStage = pipeline.stages(writeStageIndex)
        new writeStage.Area {
            // TODO: recheck the condition
            when(REGFILE_WRITE_VAL_ENABLE && REGFILE_WRITE_VAL_ADDR =/= 0 && up.isFiring && isValid) {
                regfile(REGFILE_WRITE_VAL_ADDR) := REGFILE_WRITE_VAL
            }
        }

        val readStage = pipeline.stages(readStageIndex)
        new readStage.Area {
            // inner regfile forward
            up(REGFILE_VAL1) := (REGFILE_VAL1_ADDR =/= 0) ?
                ((REGFILE_VAL1_ADDR === writeStage(REGFILE_WRITE_VAL_ADDR)) ?
                    writeStage(REGFILE_WRITE_VAL) |
                    regfile(REGFILE_VAL1_ADDR)) |
                B(0, 32 bits)
            up(REGFILE_VAL2) := (REGFILE_VAL2_ADDR =/= 0) ?
                ((REGFILE_VAL2_ADDR === writeStage(REGFILE_WRITE_VAL_ADDR)) ?
                    writeStage(REGFILE_WRITE_VAL) |
                    regfile(REGFILE_VAL2_ADDR)) |
                B(0, 32 bits)

            // REGFILE_WRITE_VAL may be written by other components
            // hence init in up stage
            up(REGFILE_WRITE_VAL) := (REGFILE_WRITE_VAL_ADDR =/= 0) ?
                ((REGFILE_WRITE_VAL_ADDR === writeStage(REGFILE_WRITE_VAL_ADDR)) ?
                    writeStage(REGFILE_WRITE_VAL) |
                    regfile(REGFILE_WRITE_VAL_ADDR)) |
                B(0, 32 bits)
        }
    }
}
