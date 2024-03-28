package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

class Dcache(stageIndex: Int) extends Plugin {
    val dcache = Mem(Bits(32 bits), 0x8000)

    val DCACHE_WRITE_MASK = Payload(Bits(4 bits))
    val DCACHE_WRITE_ENABLE = Payload(Bool()) // control signal
    val DCACHE_WRITE_VAL, DCACHE_READ_VAL = Payload(Bits(32 bits))
    object DcacheStoreType extends SpinalEnum {
        val b, h, w = newElement()
    }
    val DCACHE_STORE_TYPE = Payload(DcacheStoreType()) // control signal
    object DcacheReadType extends SpinalEnum {
        val b, bu, h, hu, w = newElement()
    }
    val DCACHE_READ_TYPE = Payload(DcacheReadType()) // control signal
    val WRITE_AT_DCACHE = Payload(Bool()) // control signal

    override def register(pipeline: Pipeline): Unit = {
        val decoderService = pipeline.getService(classOf[DecoderService])

        val bypass = pipeline.getPlugin(classOf[Bypass])
        import bypass._

        val intAlu = pipeline.getPlugin(classOf[IntAlu])
        import intAlu._

        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile._

        decoderService.addSignal(DCACHE_WRITE_ENABLE, False)
        decoderService.addSignal(DCACHE_STORE_TYPE, DcacheStoreType.w())
        decoderService.addSignal(DCACHE_READ_TYPE, DcacheReadType.w())
        decoderService.addSignal(WRITE_AT_DCACHE, False)

        val commonLoadSignals = List(
            REGFILE_VAL1_ENABLE -> True,
            REGFILE_WRITE_VAL_ENABLE -> True,
            LUC_OP -> LucOp.si12(),
            ALU_OP -> AluOp.add(),
            ALU_SRC2 -> AluSrc2.luc(),
            WRITE_AT_DCACHE -> True,
            BYPASS_ENABLE_STAGE -> U(stageIndex).resized
        )

        // LD.B
        decoderService.addInstruction(
            M"0010100000----------------------",
            commonLoadSignals ++ List(
                DCACHE_READ_TYPE -> DcacheReadType.b()
            )
        )

        // LD.BU
        decoderService.addInstruction(
            M"0010101000----------------------",
            commonLoadSignals ++ List(
                DCACHE_READ_TYPE -> DcacheReadType.bu()
            )
        )

        // LD.H
        decoderService.addInstruction(
            M"0010100001----------------------",
            commonLoadSignals ++ List(
                DCACHE_READ_TYPE -> DcacheReadType.h()
            )
        )

        // LD.HU
        decoderService.addInstruction(
            M"0010101001----------------------",
            commonLoadSignals ++ List(
                DCACHE_READ_TYPE -> DcacheReadType.hu()
            )
        )

        // LD.W
        decoderService.addInstruction(
            M"0010100010----------------------",
            commonLoadSignals ++ List(
                DCACHE_READ_TYPE -> DcacheReadType.w()
            )
        )

        val commonStoreSignals = List(
            REGFILE_VAL1_ENABLE -> True,
            REGFILE_VAL2_ENABLE -> True,
            REGFILE_VAL2_ADDR -> ((INSTRUCTION: Bits) => U(INSTRUCTION(14 downto 10), 5 bits)),
            LUC_OP -> LucOp.si12(),
            ALU_OP -> AluOp.add(),
            ALU_SRC2 -> AluSrc2.luc(),
            DCACHE_WRITE_ENABLE -> True
        )

        // ST.B
        decoderService.addInstruction(
            M"0010100010----------------------",
            commonStoreSignals ++ List(DCACHE_STORE_TYPE -> DcacheStoreType.b())
        )

        // ST.H
        decoderService.addInstruction(
            M"0010100010----------------------",
            commonStoreSignals ++ List(DCACHE_STORE_TYPE -> DcacheStoreType.h())
        )

        // ST.W
        decoderService.addInstruction(
            M"0010100010----------------------",
            commonStoreSignals ++ List(DCACHE_STORE_TYPE -> DcacheStoreType.w())
        )
    }

    override def build(pipeline: Pipeline): Unit = {
        val stage = pipeline.stages(stageIndex)

        val registerFile = pipeline.getPlugin(classOf[RegisterFile])
        import registerFile._

        val intAlu = pipeline.getPlugin(classOf[IntAlu])
        import intAlu._

        new stage.Area {
            stage.bypass(DCACHE_WRITE_MASK) := DCACHE_STORE_TYPE.mux(
                DcacheStoreType.b -> ALU_OUT(1 downto 0).mux(
                    0 -> B("4'b0001"),
                    1 -> B("4'b0010"),
                    2 -> B("4'b0100"),
                    3 -> B("4'b1000")
                ),
                DcacheStoreType.h -> ALU_OUT(1 downto 1).mux(
                    0 -> B("4'b0011"),
                    1 -> B("4'b1100")
                ),
                DcacheStoreType.w -> B("4'b1111")
            )
            stage.bypass(DCACHE_WRITE_VAL) := DCACHE_WRITE_MASK.mux(
                M"---1" -> stage(REGFILE_VAL2),
                M"--10" -> (REGFILE_VAL2 << 8).resize(32),
                M"-100" -> (REGFILE_VAL2 << 16).resize(32),
                M"1000" -> (REGFILE_VAL2 << 24).resize(32),
                default -> B(0)
            )

            when(stage.up.isFiring && DCACHE_WRITE_ENABLE) {
                dcache.write(
                    U(ALU_OUT(31 downto 2)).resized,
                    DCACHE_WRITE_VAL,
                    mask = DCACHE_WRITE_MASK
                )
            }
        }

        new stage.Area {
            val rawDcacheVal = dcache(U(ALU_OUT(31 downto 2)).resize(15))
            val offset = ALU_OUT(1 downto 0)

            DCACHE_READ_VAL := DCACHE_READ_TYPE.mux(
                DcacheReadType.b -> offset.mux(
                    0 -> rawDcacheVal(7 downto 0).asSInt.resize(32).asBits,
                    1 -> rawDcacheVal(15 downto 8).asSInt.resize(32).asBits,
                    2 -> rawDcacheVal(23 downto 16).asSInt.resize(32).asBits,
                    3 -> rawDcacheVal(31 downto 24).asSInt.resize(32).asBits
                ),
                DcacheReadType.bu -> offset.mux(
                    0 -> rawDcacheVal(7 downto 0).resize(32),
                    1 -> rawDcacheVal(15 downto 8).resize(32),
                    2 -> rawDcacheVal(23 downto 16).resize(32),
                    3 -> rawDcacheVal(31 downto 24).resize(32)
                ),
                DcacheReadType.h -> offset(1 downto 1).mux(
                    0 -> rawDcacheVal(15 downto 0).asSInt.resize(32).asBits,
                    1 -> rawDcacheVal(31 downto 15).asSInt.resize(32).asBits
                ),
                DcacheReadType.hu -> offset(1 downto 1).mux(
                    0 -> rawDcacheVal(15 downto 0).resize(32),
                    1 -> rawDcacheVal(31 downto 15).resize(32)
                ),
                DcacheReadType.w -> rawDcacheVal
            )

            when(up.isFiring && WRITE_AT_DCACHE) {
                stage.bypass(REGFILE_WRITE_VAL) := DCACHE_READ_VAL
            }
        }
    }
}
