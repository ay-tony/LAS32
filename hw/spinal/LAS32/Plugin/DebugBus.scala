package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

class DebugBus(stageIndex: Int) extends Plugin {
    val debugBus = new Bundle {
        val pc = out UInt (32 bits)
        val regfileWriteEnable = out Bool ()
        val regfileWriteAddr = out UInt (5 bits)
        val regfileWriteVal = out Bits (32 bits)
    }

    override def register(pipeline: Pipeline): Unit = {}

    override def build(pipeline: Pipeline): Unit = {
        val fetcher = pipeline.getPlugin(classOf[Fetcher])
        import fetcher.PC

        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile.{REGFILE_RD_ENABLE, REGFILE_RD_ADDR, REGFILE_RD}

        val stage = pipeline.stages(stageIndex)
        new stage.Area {
            debugBus.pc := PC
            debugBus.regfileWriteEnable := REGFILE_RD_ENABLE
            debugBus.regfileWriteAddr := REGFILE_RD_ADDR
            debugBus.regfileWriteVal := REGFILE_RD
        }
    }
}
