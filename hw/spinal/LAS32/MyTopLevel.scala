package LAS32

import spinal.core._
import spinal.lib.misc.pipeline._

case class MyTopLevel() extends Component {
    val io = new Bundle {
        val pc = out UInt (32 bits)
    }

    // val stages = new Area {
    val fetch, decode, execute, memory, write = CtrlLink()
    // }
    //
    // val links = new Area {
    //     import stages._
    val f2d = StageLink(fetch.down, decode.up)
    val d2e = StageLink(decode.down, execute.up)
    val e2m = StageLink(execute.down, memory.up)
    val m2w = StageLink(memory.down, write.up)
    // }

    val PC = Payload(UInt(32 bits))
    val INSTRUCTION = Payload(Bits(32 bits))

    val fetcher = new fetch.Area {
        val pc = Reg(PC) init (0x3000)
        up(PC) := pc
        up.valid := True
        when(up.isFiring) {
            pc := PC + 4
        }
    }

    io.pc := write(PC)

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
