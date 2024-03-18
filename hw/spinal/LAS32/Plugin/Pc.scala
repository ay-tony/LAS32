package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

class Pc(pcStageIndex: Int, npcStageIndex: Int) extends Plugin {
    val PC = Payload(UInt(32 bits))

    object NpcOp extends SpinalEnum {
        val pc4, offs16 = newElement()
    }
    val NPC_OP = Payload(NpcOp()) // control signal
    val NPC = Payload(UInt(32 bits))

    val pc = Reg(PC) init (0x3000)

    override def register(pipeline: Pipeline): Unit = {
        val decoderService = pipeline.getService(classOf[DecoderService])

        decoderService.addSignal(NPC_OP, NpcOp.pc4())
    }

    override def build(pipeline: Pipeline): Unit = {
        val pcStage = pipeline.stages(pcStageIndex)
        val npcStage = pipeline.stages(npcStageIndex)

        new pcStage.Area {
            pc := npcStage(NPC)
            PC := pc
        }

        val fetcher = pipeline.getPlugin(classOf[Fetcher])
        import fetcher._

        new npcStage.Area {
            NPC := NPC_OP.mux(
                NpcOp.pc4 -> (pcStage(PC) + 4),
                NpcOp.offs16 -> U(S(PC) + S(INSTRUCTION(25 downto 10) << 2).resized)
            )
        }
    }
}
