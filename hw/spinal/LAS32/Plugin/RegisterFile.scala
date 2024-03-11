package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

class RegisterFile(readStageIndex: Int, writeStageIndex: Int) extends Plugin {

    // regfile read
    val REGFILE_ADDR1, REGFILE_ADDR2 = Payload(UInt(5 bits)) // control signal
    val REGFILE_VAL1_ENABLE, REGFILE_VAL2_ENABLE = Payload(Bool()) // control signal
    val REGFILE_VAL1, REGFILE_VAL2 = Payload(Bits(32 bits))

    // regfile write
    val REGFILE_WRITE_ENABLE = Payload(Bool()) // control signal
    val REGFILE_WRITE_ADDR = Payload(UInt(5 bits)) // control signal
    val REGFILE_WRITE_VAL = Payload(Bits(32 bits))

    override def register(pipeline: Pipeline): Unit = {
        val decoderService = pipeline.getService(classOf[DecoderService])

        decoderService.addSignal(REGFILE_ADDR1, (INSTRUCTION: Bits) => U(INSTRUCTION(9 downto 5)))
        decoderService.addSignal(REGFILE_ADDR2, (INSTRUCTION: Bits) => U(INSTRUCTION(14 downto 10)))
        decoderService.addSignal(REGFILE_VAL1_ENABLE, False)
        decoderService.addSignal(REGFILE_VAL2_ENABLE, False)
        decoderService.addSignal(REGFILE_WRITE_ENABLE, False)
        decoderService.addSignal(REGFILE_WRITE_ADDR, (INSTRUCTION: Bits) => U(INSTRUCTION(4 downto 0)))
    }

    override def build(pipeline: Pipeline): Unit = {
        val regfile = Mem(Bits(32 bits), 32)

        val writeStage = pipeline.stages(writeStageIndex)
        new writeStage.Area {
            when(REGFILE_WRITE_ENABLE && REGFILE_WRITE_ADDR =/= 0 && up.isFiring && isValid) {
                regfile(REGFILE_WRITE_ADDR) := REGFILE_WRITE_VAL
            }
        }

        val readStage = pipeline.stages(readStageIndex)
        new readStage.Area {
            // inner regfile forward
            REGFILE_VAL1 := (REGFILE_ADDR1 =/= 0) ?
                ((REGFILE_ADDR1 === writeStage(REGFILE_WRITE_ADDR)) ?
                    writeStage(REGFILE_WRITE_VAL) |
                    regfile(REGFILE_ADDR1)) |
                B(0, 32 bits)
            REGFILE_VAL2 := (REGFILE_ADDR2 =/= 0) ?
                ((REGFILE_ADDR2 === writeStage(REGFILE_WRITE_ADDR)) ?
                    writeStage(REGFILE_WRITE_VAL) |
                    regfile(REGFILE_ADDR2)) |
                B(0, 32 bits)
        }
    }
}
