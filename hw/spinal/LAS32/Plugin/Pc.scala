package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

// TODO: flush stages after branching
class Pc(pcStageIndex: Int, npcStageIndex: Int) extends Plugin {
    val PC = Payload(UInt(32 bits))

    object NpcOp extends SpinalEnum {
        val pc4, offs16, offs26 = newElement()
    }
    val NPC_OP = Payload(NpcOp()) // control signal
    val NPC = Payload(UInt(32 bits))
    val IS_BRANCH_SIGNAL = Payload(Bool()) // control signal
    val FORCE_BRANCH = Payload(Bool()) // control signal
    val WRITE_AT_NPC = Payload(Bool()) // control signal

    val pc = Reg(PC) init (0x3000)

    override def register(pipeline: Pipeline): Unit = {
        val decoderService = pipeline.getService(classOf[DecoderService])

        decoderService.addSignal(NPC_OP, NpcOp.pc4())
        decoderService.addSignal(IS_BRANCH_SIGNAL, False)
        decoderService.addSignal(FORCE_BRANCH, False)
        decoderService.addSignal(WRITE_AT_NPC, False)

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

        // B
        decoderService.addInstruction(
            M"010100--------------------------",
            List(
                IS_BRANCH_SIGNAL -> True,
                FORCE_BRANCH -> True,
                NPC_OP -> NpcOp.offs26()
            )
        )

        // BL
        decoderService.addInstruction(
            M"010101--------------------------",
            List(
                IS_BRANCH_SIGNAL -> True,
                FORCE_BRANCH -> True,
                NPC_OP -> NpcOp.offs26(),
                WRITE_AT_NPC -> True,
                REGFILE_WRITE_VAL_ADDR -> U(1).resized
            )
        )

        // JIRL
        decoderService.addInstruction(
            M"010011--------------------------",
            List(
                IS_BRANCH_SIGNAL -> True,
                FORCE_BRANCH -> True,
                NPC_OP -> NpcOp.offs16(),
                WRITE_AT_NPC -> True
            )
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

        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile._

        new npcStage.Area {
            NPC := pcStage(PC) + 4

            when(IS_BRANCH_SIGNAL && (COMPARER_OUT || FORCE_BRANCH)) {
                NPC := NPC_OP.mux(
                    NpcOp.pc4 -> (pcStage(PC) + 4),
                    NpcOp.offs16 -> U(S(PC) + S(INSTRUCTION(25 downto 10) << 2).resized),
                    NpcOp.offs26 -> U(
                        S(PC) + S(INSTRUCTION(9 downto 0) ## INSTRUCTION(25 downto 10) ## B(0, 2 bits)).resized
                    )
                )
            }

            when(WRITE_AT_NPC) {
                npcStage.bypass(REGFILE_WRITE_VAL) := B(PC + 4)
            }
        }
    }
}
