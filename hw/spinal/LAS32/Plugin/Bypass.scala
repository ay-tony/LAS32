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

        // TODO: fix the bug, iterate reversed
        for (curStage <- stages.filter(o => stages.indexOf(o) > beginBypassStageIndex)) {
            when(curStage(REGFILE_VAL1_ENABLE)) {
                for (bypassStage <- stages.filter(o => stages.indexOf(o) > stages.indexOf(curStage))) {
                    when(curStage(REGFILE_VAL1_ADDR) === bypassStage(REGFILE_WRITE_VAL_ADDR)) {
                        when(bypassStage(REGFILE_WRITE_VAL_ENABLE)) {
                            curStage.bypass(REGFILE_VAL1) := bypassStage(REGFILE_WRITE_VAL)
                        }.otherwise {
                            curStage.haltIt()
                        }
                    }
                }
            }
            for (curStage <- stages.filter(o => stages.indexOf(o) > beginBypassStageIndex)) {
                for (bypassStage <- stages.filter(o => stages.indexOf(o) > stages.indexOf(curStage))) {
                    when(curStage(REGFILE_VAL2_ADDR) === bypassStage(REGFILE_WRITE_VAL_ADDR)) {
                        when(bypassStage(REGFILE_WRITE_VAL_ENABLE)) {
                            curStage.bypass(REGFILE_VAL2) := bypassStage(REGFILE_WRITE_VAL)
                        }.otherwise {
                            curStage.haltIt()
                        }
                    }
                }
            }
        }
    }
}
