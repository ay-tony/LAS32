package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

class Fetcher(stageIndex: Int) extends Plugin {
    val INSTRUCTION = Payload(Bits(32 bits))

    val icache = Mem(Bits(32 bits), 0x8000)

    override def register(pipeline: Pipeline): Unit = {}

    override def build(pipeline: Pipeline): Unit = {
        val pc = pipeline.getPlugin(classOf[Pc])
        import pc.PC

        val stage = pipeline.stages(stageIndex)
        new stage.Area {
            INSTRUCTION := icache(PC(16 downto 2))
        }
    }
}
