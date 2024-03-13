package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

// TODO: test the class
class Bypass(beginBypassStageIndex: Int, stageCountBits: Int) extends Plugin {
    val BYPASS_ENABLE_STAGE = Payload(UInt(stageCountBits bits)) // control signal

    override def register(pipeline: Pipeline): Unit = {
        val decoderService = pipeline.getService(classOf[DecoderService])

        decoderService.addSignal(BYPASS_ENABLE_STAGE, U(0))
    }

    override def build(pipeline: Pipeline): Unit = {
        import pipeline.stages

        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile._

        stages(beginBypassStageIndex).up(REGFILE_RD) := B(0) // bypass begin signal, prevent latch

        for (curStage <- stages.filter(o => stages.indexOf(o) > beginBypassStageIndex)) {
            when(curStage(REGFILE_RJ_ENABLE)) {
                for (bypassStage <- stages.filter(o => stages.indexOf(o) > stages.indexOf(curStage))) {
                    when(curStage(REGFILE_RJ_ADDR) === bypassStage(REGFILE_RD_ADDR)) {
                        when(bypassStage(REGFILE_RD_ENABLE)) {
                            curStage.bypass(REGFILE_RJ) := bypassStage(REGFILE_RD)
                        }.otherwise {
                            curStage.haltIt()
                        }
                    }
                }
            }
            for (curStage <- stages.filter(o => stages.indexOf(o) > beginBypassStageIndex)) {
                for (bypassStage <- stages.filter(o => stages.indexOf(o) > stages.indexOf(curStage))) {
                    when(curStage(REGFILE_RK_ADDR) === bypassStage(REGFILE_RD_ADDR)) {
                        when(bypassStage(REGFILE_RD_ENABLE)) {
                            curStage.bypass(REGFILE_RK) := bypassStage(REGFILE_RD)
                        }.otherwise {
                            curStage.haltIt()
                        }
                    }
                }
            }
        }
    }
}
