package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

class Branch(comparerStageIndex: Int, npcStageIndex: Int) extends Plugin {
    object ComparerOp extends SpinalEnum {
        val eq, ne, lt, ge, ltu, geu = newElement()
    }
    val COMPARER_OP = Payload(ComparerOp()) // control signal
    object ComparerSrc2 extends SpinalEnum {
        val registerVal2, si12 = newElement()
    }
    val COMPARER_SRC2 = Payload(ComparerSrc2()) // control signal
    val COMPARER_OUT = Payload(Bool())
    val WRITE_AT_COMPARER = Payload(Bool()) // control signal

    object NpcOp extends SpinalEnum {
        val pc4, offs16 = newElement()
    }
    val NPC_OP = Payload(NpcOp()) // control signal
    val NPC = Payload(UInt(32 bits))

    override def register(pipeline: Pipeline) = {
        // TODO: add branch instruction signals
        val decoderService = pipeline.getService(classOf[DecoderService])

        decoderService.addSignal(COMPARER_OP, ComparerOp.lt())
        decoderService.addSignal(COMPARER_SRC2, ComparerSrc2.registerVal2())
        decoderService.addSignal(WRITE_AT_COMPARER, False)

        decoderService.addSignal(NPC_OP, NpcOp.pc4())

        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile._

        val sltSignals = List(
            REGFILE_VAL1_ENABLE -> True,
            REGFILE_VAL2_ENABLE -> True,
            REGFILE_WRITE_VAL_ENABLE -> True,
            WRITE_AT_COMPARER -> True
        )

        val sltImmSignals = List(
            REGFILE_VAL1_ENABLE -> True,
            REGFILE_WRITE_VAL_ENABLE -> True,
            COMPARER_SRC2 -> ComparerSrc2.si12(),
            WRITE_AT_COMPARER -> True
        )

        val branchSignals = List(
            REGFILE_VAL1_ENABLE -> True,
            REGFILE_VAL2_ENABLE -> True,
            REGFILE_VAL2_ADDR -> ((INSTRUCTION: Bits) => U(INSTRUCTION(4 downto 0)))
        )

        // SLT
        decoderService.addInstruction(
            M"00000000000100100---------------",
            sltSignals :+ (COMPARER_OP -> ComparerOp.lt())
        )

        // SLTU
        decoderService.addInstruction(
            M"00000000000100101---------------",
            sltSignals :+ (COMPARER_OP -> ComparerOp.ltu())
        )

        // SLTI
        decoderService.addInstruction(
            M"0000001000----------------------",
            sltImmSignals :+ (COMPARER_OP -> ComparerOp.lt())
        )

        // SLTUI
        decoderService.addInstruction(
            M"0000001001----------------------",
            sltImmSignals :+ (COMPARER_OP -> ComparerOp.ltu())
        )
    }

    override def build(pipeline: Pipeline) = {
        val fetcher = pipeline.getPlugin(classOf[Fetcher])
        import fetcher._

        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile._

        val comparerStage = pipeline.stages(comparerStageIndex)
        new comparerStage.Area {
            val src1, src2 = Bits(32 bits)
            src1 := B(REGFILE_VAL1)
            src2 := COMPARER_SRC2.mux(
                ComparerSrc2.registerVal2 -> B(REGFILE_VAL2),
                ComparerSrc2.si12 -> B(INSTRUCTION(21 downto 10)).resized
            )

            val EQ, LTS, LTU = Bool()
            EQ := src1 === src2
            LTS := S(src1) < S(src2)
            LTU := U(src1) < U(src2)

            COMPARER_OUT := COMPARER_OP.mux(
                ComparerOp.eq -> EQ,
                ComparerOp.ne -> !EQ,
                ComparerOp.lt -> LTS,
                ComparerOp.ge -> !LTS,
                ComparerOp.ltu -> LTU,
                ComparerOp.geu -> !LTU
            )

            when(WRITE_AT_COMPARER) {
                comparerStage.bypass(REGFILE_WRITE_VAL) := B(COMPARER_OUT).resized
            }
        }

        val npcStage = pipeline.stages(npcStageIndex)
        new npcStage.Area {
            NPC := NPC_OP.mux(
                NpcOp.pc4 -> (PC + 4),
                NpcOp.offs16 -> U(S(PC) + S(INSTRUCTION(25 downto 10) << 2).resized)
            )
        }
    }
}
