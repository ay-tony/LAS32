package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import spinal.lib.Reverse
import LAS32._

class Shifter(stageIndex: Int) extends Plugin {
    object ShifterOp extends SpinalEnum {
        val sll, srl, sra = newElement()
    }
    val SHIFTER_OP = Payload(ShifterOp()) // control signal
    object ShifterSrc2 extends SpinalEnum {
        val rk, ui5 = newElement()
    }
    val SHIFTER_SRC2 = Payload(ShifterSrc2()) // control signal
    val SHIFTER_OUT = Payload(Bits(32 bits))
    val WRITE_AT_SHIFTER = Payload(Bool()) // control signal

    override def register(pipeline: Pipeline): Unit = {
        val decoderService = pipeline.getService(classOf[DecoderService])

        decoderService.addSignal(SHIFTER_OP, ShifterOp.sll())
        decoderService.addSignal(SHIFTER_SRC2, ShifterSrc2.rk())
        decoderService.addSignal(WRITE_AT_SHIFTER, False)

        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile.{REGFILE_VAL1_ENABLE, REGFILE_VAL2_ENABLE, REGFILE_WRITE_VAL_ENABLE}

        val bypass = pipeline.getPlugin(classOf[Bypass])
        import bypass.{BYPASS_ENABLE_STAGE}

        val commonSignals = List(
            REGFILE_VAL1_ENABLE -> True,
            REGFILE_VAL2_ENABLE -> True,
            REGFILE_WRITE_VAL_ENABLE -> True,
            WRITE_AT_SHIFTER -> True,
            BYPASS_ENABLE_STAGE -> U(stageIndex).resized
        )

        val ui5Signals = List(
            REGFILE_VAL1_ENABLE -> True,
            REGFILE_WRITE_VAL_ENABLE -> True,
            WRITE_AT_SHIFTER -> True,
            SHIFTER_SRC2 -> ShifterSrc2.ui5(),
            BYPASS_ENABLE_STAGE -> U(stageIndex).resized
        )

        // SLL.W
        decoderService.addInstruction(
            M"00000000000101110---------------",
            commonSignals
        )

        // SRL.W
        decoderService.addInstruction(
            M"00000000000101111---------------",
            commonSignals :+ (SHIFTER_OP -> ShifterOp.srl())
        )

        // SRA.W
        decoderService.addInstruction(
            M"00000000000110000---------------",
            commonSignals :+ (SHIFTER_OP -> ShifterOp.sra())
        )

        // SLLI.W
        decoderService.addInstruction(
            M"00000000010000001---------------",
            ui5Signals
        )

        // SRLI.W
        decoderService.addInstruction(
            M"00000000010001001---------------",
            ui5Signals :+ (SHIFTER_OP -> ShifterOp.srl())
        )

        // SRAI.W
        decoderService.addInstruction(
            M"00000000010010001---------------",
            ui5Signals :+ (SHIFTER_OP -> ShifterOp.sra())
        )
    }

    override def build(pipeline: Pipeline): Unit = {
        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile._

        val stage = pipeline.stages(stageIndex)
        new stage.Area {
            val src1 = Bits(32 bits)
            val src2 = UInt(5 bits)
            src1 := REGFILE_VAL1
            src2 := SHIFTER_SRC2.mux(
                ShifterSrc2.rk -> U(REGFILE_VAL2(4 downto 0)),
                ShifterSrc2.ui5 -> stage(REGFILE_VAL2_ADDR)
            )

            val reversed = SHIFTER_OP.mux(
                ShifterOp.sll -> Reverse(src1),
                default -> src1
            )

            val shift_right = B(S(((SHIFTER_OP === ShifterOp.sra) & reversed.msb) ## reversed) >> src2)(31 downto 0)

            SHIFTER_OUT := SHIFTER_OP.mux(
                ShifterOp.sll -> Reverse(shift_right),
                default -> shift_right
            )

            when(WRITE_AT_SHIFTER) {
                stage.bypass(REGFILE_WRITE_VAL) := SHIFTER_OUT
            }
        }
    }
}
