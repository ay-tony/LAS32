package LAS32.Plugin

import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

class Dcache(stageIndex: Int) extends Plugin {
    val dcache = Mem(Bits(32 bits), 0x8000)

    val DCACHE_WRITE_MASK = Payload(Bits(4 bits))
    val DCACHE_WRITE_ENABLE = Payload(Bool())
    val DCACHE_WRITE_VAL, DCACHE_READ_VAL = Payload(Bits(32 bits))
    object DcacheStoreType extends SpinalEnum {
        val b, h, w = newElement()
    }
    val DCACHE_STORE_TYPE = Payload(DcacheStoreType())
    object DcacheReadType extends SpinalEnum {
        val b, bu, h, hw, w = newElement()
    }
    val DCACHE_READ_TYPE = Payload(DcacheReadType())
    val WRITE_AT_DCACHE = Payload(Bool())

    override def register(pipeline: Pipeline): Unit = {
        val decoderService = pipeline.getService(classOf[DecoderService])

        decoderService.addSignal(DCACHE_WRITE_ENABLE, False)
        decoderService.addSignal(WRITE_AT_DCACHE, False)
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
                    B(0) -> B("4'b0001"),
                    B(1) -> B("4'b0010"),
                    B(2) -> B("4'b0100"),
                    B(3) -> B("4'b1000")
                ),
                DcacheStoreType.h -> ALU_OUT(1).mux(
                    B(0) -> B("4'b0011"),
                    B(1) -> B("4'b1100")
                ),
                DcacheStoreType.w -> B("4'b1111")
            )
            stage.bypass(DCACHE_WRITE_VAL) := DCACHE_WRITE_MASK.mux(
                M"---1" -> stage(REGFILE_VAL2),
                M"--10" -> (REGFILE_VAL2 << 8).resized,
                M"-100" -> (REGFILE_VAL2 << 16).resized,
                M"1000" -> (REGFILE_VAL2 << 24).resized,
                default -> B(0)
            )

            when(stage.isFiring && DCACHE_WRITE_ENABLE) {
                dcache.write(
                    U(ALU_OUT(31 downto 2)).resized,
                    DCACHE_WRITE_VAL,
                    mask = DCACHE_WRITE_MASK
                )
            }
        }

        new stage.Area {
            val rawDcacheVal = dcache(U(ALU_OUT(31 downto 2)).resized)
            val offset = ALU_OUT(1 downto 0)

            stage.bypass(DCACHE_READ_VAL) := DCACHE_STORE_TYPE.mux(
                DcacheReadType.b -> offset.mux(
                    B(0) -> B(S(rawDcacheVal(7 downto 0))),
                    B(1) -> B(S(rawDcacheVal(15 downto 8))),
                    B(2) -> B(S(rawDcacheVal(23 downto 16))),
                    B(3) -> B(S(rawDcacheVal(31 downto 24)))
                ),
                DcacheReadType.bu -> offset.mux(
                    B(0) -> B(U(rawDcacheVal(7 downto 0))),
                    B(1) -> B(U(rawDcacheVal(15 downto 8))),
                    B(2) -> B(U(rawDcacheVal(23 downto 16))),
                    B(3) -> B(U(rawDcacheVal(31 downto 24)))
                ),
                DcacheReadType.h -> offset(1).mux(
                    B(0) -> B(U(rawDcacheVal(15 downto 0))),
                    B(1) -> B(U(rawDcacheVal(31 downto 15)))
                ),
                DcacheReadType.hu -> offset(1).mux(
                    B(0) -> B(S(rawDcacheVal(15 downto 0))),
                    B(1) -> B(S(rawDcacheVal(31 downto 15)))
                ),
                DcacheStoreType.w -> rawDcacheVal
            )

            when(up.isFiring && WRITE_AT_DCACHE) {
                bypass(REGFILE_WRITE_VAL) := DCACHE_READ_VAL
            }
        }
    }
}
