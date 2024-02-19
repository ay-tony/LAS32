package LAS32

import spinal.core._
import spinal.lib.misc.pipeline._

case class MyTopLevel() extends Component {
    val io = new Bundle {
        val pc = out UInt (32 bits)
    }

    val fetch, decode, execute, memory, write = CtrlLink()

    val f2d = StageLink(fetch.down, decode.up)
    val d2e = StageLink(decode.down, execute.up)
    val e2m = StageLink(execute.down, memory.up)
    val m2w = StageLink(memory.down, write.up)

    val fetcher = new fetch.Area {
        val PC = Payload(UInt(32 bits))
        val INSTRUCTION = Payload(Bits(32 bits))

        val pc = Reg(PC) init (0x3000)
        up(PC) := pc
        up.valid := True
        when(up.isFiring) {
            pc := PC + 4
        }
    }

    val decoder = new decode.Area {
        import fetcher.INSTRUCTION

        val IS_ADD = INSTRUCTION === M"000000---------------00000100000"
        val IS_ADDI = INSTRUCTION === M"001000--------------------------"
    }

    io.pc := write(fetcher.PC)

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
