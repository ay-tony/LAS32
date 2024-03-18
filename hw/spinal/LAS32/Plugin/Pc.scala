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
    val IS_BRANCH_SIGNAL = Payload(Bool()) // control signal

    val pc = Reg(PC) init (0x3000)

    override def register(pipeline: Pipeline): Unit = {
        val decoderService = pipeline.getService(classOf[DecoderService])

        decoderService.addSignal(NPC_OP, NpcOp.pc4())
        decoderService.addSignal(IS_BRANCH_SIGNAL, False)

        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile._

        val signal = List(
            REGFILE_VAL1_ENABLE -> True,
            REGFILE_VAL2_ENABLE -> True,
            REGFILE_VAL2_ADDR -> ((INSTRUCTION: Bits) => U(INSTRUCTION(4 downto 0))),
            IS_BRANCH_SIGNAL -> True
        )

        val comparer = pipeline.getPlugin(classOf[Comparer])
        import comparer._

        // BEQ
        decoderService.addInstruction(
            M"010110--------------------------",
            signal :+ (COMPARER_OP -> ComparerOp.eq())
        )

        // BNE
        decoderService.addInstruction(
            M"010111--------------------------",
            signal :+ (COMPARER_OP -> ComparerOp.ne())
        )

        // BLT
        decoderService.addInstruction(
            M"011000--------------------------",
            signal :+ (COMPARER_OP -> ComparerOp.lt())
        )

        // BGE
        decoderService.addInstruction(
            M"011001--------------------------",
            signal :+ (COMPARER_OP -> ComparerOp.ge())
        )

        // BLTU
        decoderService.addInstruction(
            M"011010--------------------------",
            signal :+ (COMPARER_OP -> ComparerOp.ltu())
        )

        // BGEU
        decoderService.addInstruction(
            M"011011--------------------------",
            signal :+ (COMPARER_OP -> ComparerOp.geu())
        )
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

        val comparer = pipeline.getPlugin(classOf[Comparer])
        import comparer._

        new npcStage.Area {
            NPC := pcStage(PC) + 4

            when(IS_BRANCH_SIGNAL && COMPARER_OUT) {
                NPC := NPC_OP.mux(
                    NpcOp.pc4 -> (pcStage(PC) + 4),
                    NpcOp.offs16 -> U(S(PC) + S(INSTRUCTION(25 downto 10) << 2).resized)
                )
            }
        }
    }
}
