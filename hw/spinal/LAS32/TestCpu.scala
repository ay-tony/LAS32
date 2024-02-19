package LAS32

import spinal.core._
import spinal.core.sim._

object CpuSim extends App {
    Config.sim.compile(new MyTopLevel()).doSim { dut =>
        dut.clockDomain.forkStimulus(10)

        dut.clockDomain.assertReset()
        dut.clockDomain.waitRisingEdge()
        dut.clockDomain.deassertReset()

        for (t <- 0 until 32) {
            dut.clockDomain.waitRisingEdge()
            val pc = dut.io.pc.toLong
            println("%2d: %8h".format(t, pc))
        }
    }
}
