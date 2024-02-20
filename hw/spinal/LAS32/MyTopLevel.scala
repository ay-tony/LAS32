package LAS32

import spinal.core._
import spinal.lib.misc.pipeline._

case class MyTopLevel() extends Component {
    val io = new Bundle {
        val pc = out UInt (32 bits)
        val regfile_write_enable = out Bool ()
        val regfile_write_addr = out UInt (5 bits)
        val regfile_write_data = out Bits (32 bits)
    }

    val fetch, decode, execute, memory, write = CtrlLink()

    val f2d = StageLink(fetch.down, decode.up)
    val d2e = StageLink(decode.down, execute.up)
    val e2m = StageLink(execute.down, memory.up)
    val m2w = StageLink(memory.down, write.up)

    val PC = Payload(UInt(32 bits))
    val INSTRUCTION = Payload(Bits(32 bits))

    object InstructionType extends SpinalEnum {
        val r, i, j = newElement()
    }
    val INSTRUCTION_TYPE = Payload(InstructionType()) // control signal

    val REG_VAL1, REG_VAL2 = Payload(Bits(32 bits))

    object AluOp extends SpinalEnum {
        val add = newElement()
    }
    val ALU_OP = Payload(AluOp()) // control signal
    val ALU_OUT = Payload(Bits(32 bits))

    val REGFILE_WRITE_ENABLE = Payload(Bool()) // control signal

    val fetcher = new fetch.Area {
        val pc = Reg(PC) init (0x3000)
        up(PC) := pc
        up.valid := True
        when(up.isFiring) {
            pc := PC + 4
        }

        val icache = Mem(Bits(32 bits), 0x8000)
        up(INSTRUCTION) := icache(PC(16 downto 2))
    }

    val decoder = new decode.Area {
        val IS_ADD = INSTRUCTION === M"000000---------------00000100000"
        val IS_ADDI = INSTRUCTION === M"001000--------------------------"

        // default signals
        up(INSTRUCTION_TYPE) := InstructionType.r
        up(ALU_OP) := AluOp.add
        up(REGFILE_WRITE_ENABLE) := False

        when(IS_ADD) {
            up(REGFILE_WRITE_ENABLE) := True
        }.elsewhen(IS_ADDI) {
            up(INSTRUCTION_TYPE) := InstructionType.i
            up(REGFILE_WRITE_ENABLE) := True
        }
    }

    val regfile = new decode.Area {
        val regfile = Mem(Bits(32 bits), 32)

        val rs = U(INSTRUCTION(25 downto 21))
        val rt = U(INSTRUCTION(20 downto 16))
        up(REG_VAL1) := (rs =/= 0) ? regfile(rs) | B(0, 32 bits)
        up(REG_VAL2) := (rt =/= 0) ? regfile(rt) | B(0, 32 bits)
    }

    val alu = new execute.Area {
        val in1 = REG_VAL1
        val in2 = (INSTRUCTION_TYPE === InstructionType.i) ? B(S(INSTRUCTION(15 downto 0), 32 bits)) | REG_VAL2

        ALU_OUT := B(S(in1) + S(in2))

        when(ALU_OP === AluOp.add) {
            ALU_OUT := B(S(in1) + S(in2))
        }
    }

    val write_regfile = new write.Area {
        val addr =
            (INSTRUCTION_TYPE === InstructionType.r) ? U(INSTRUCTION(15 downto 11)) | U(INSTRUCTION(20 downto 16))
        val value = (addr === 0) ? B(0, 32 bits) | B(ALU_OUT)

        when(REGFILE_WRITE_ENABLE) {
            regfile.regfile(addr) := value
        }
    }

    io.pc := write(PC)
    io.regfile_write_enable := write(REGFILE_WRITE_ENABLE)
    io.regfile_write_addr := write_regfile.addr
    io.regfile_write_data := write_regfile.value

    Builder(
        fetch,
        decode,
        execute,
        memory,
        write,
        f2d,
        d2e,
        e2m,
        m2w
    )

}

object MyTopLevelVerilog extends App {
    Config.spinal.generateVerilog(MyTopLevel())
}
