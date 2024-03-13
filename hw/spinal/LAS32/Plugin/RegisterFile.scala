package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

class RegisterFile(readStageIndex: Int, writeStageIndex: Int) extends Plugin {

    // regfile read
    val REGFILE_RJ_ENABLE, REGFILE_RK_ENABLE = Payload(Bool()) // control signal
    val REGFILE_RJ_ADDR, REGFILE_RK_ADDR = Payload(UInt(5 bits)) // control signal
    val REGFILE_RJ, REGFILE_RK = Payload(Bits(32 bits))

    // regfile write
    val REGFILE_RD_ENABLE = Payload(Bool()) // control signal
    val REGFILE_RD_ADDR = Payload(UInt(5 bits)) // control signal
    val REGFILE_RD = Payload(Bits(32 bits))

    val regfile = Mem(Bits(32 bits), 32)

    override def register(pipeline: Pipeline): Unit = {
        val decoderService = pipeline.getService(classOf[DecoderService])

        decoderService.addSignal(REGFILE_RJ_ENABLE, False)
        decoderService.addSignal(REGFILE_RK_ENABLE, False)
        decoderService.addSignal(REGFILE_RJ_ADDR, (INSTRUCTION: Bits) => U(INSTRUCTION(9 downto 5)))
        decoderService.addSignal(REGFILE_RK_ADDR, (INSTRUCTION: Bits) => U(INSTRUCTION(14 downto 10)))
        decoderService.addSignal(REGFILE_RD_ENABLE, False)
        decoderService.addSignal(REGFILE_RD_ADDR, (INSTRUCTION: Bits) => U(INSTRUCTION(4 downto 0)))
    }

    override def build(pipeline: Pipeline): Unit = {
        val writeStage = pipeline.stages(writeStageIndex)
        new writeStage.Area {
            // TODO: recheck the condition
            when(REGFILE_RD_ENABLE && REGFILE_RD_ADDR =/= 0 && up.isFiring && isValid) {
                regfile(REGFILE_RD_ADDR) := REGFILE_RD
            }
        }

        val readStage = pipeline.stages(readStageIndex)
        new readStage.Area {
            // inner regfile forward
            REGFILE_RJ := (REGFILE_RJ_ADDR =/= 0) ?
                ((REGFILE_RJ_ADDR === writeStage(REGFILE_RD_ADDR)) ?
                    writeStage(REGFILE_RD) |
                    regfile(REGFILE_RJ_ADDR)) |
                B(0, 32 bits)
            REGFILE_RK := (REGFILE_RK_ADDR =/= 0) ?
                ((REGFILE_RK_ADDR === writeStage(REGFILE_RD_ADDR)) ?
                    writeStage(REGFILE_RD) |
                    regfile(REGFILE_RK_ADDR)) |
                B(0, 32 bits)
        }
    }
}
