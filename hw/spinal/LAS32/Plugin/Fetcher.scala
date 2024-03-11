package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

class Fetcher(stageIndex: Int) extends Plugin {

    val PC = Payload(UInt(32 bits))
    val INSTRUCTION = Payload(Bits(32 bits))

    override def register(pipeline: Pipeline): Unit = {}

    override def build(pipeline: Pipeline): Unit = {
        val stage = pipeline.stages(stageIndex)
        new stage.Area {
            val pc = Reg(PC) init (0x3000)
            pc := pc + 4
            PC := pc

            val icache = Mem(Bits(32 bits), 0x8000)
            INSTRUCTION := icache(PC(16 downto 2))
        }
    }
}
