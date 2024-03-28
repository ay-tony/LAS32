package LAS32

import spinal.core._
import spinal.lib.misc.pipeline._

import LAS32.Plugin._

class LAS32 extends Component with Pipeline {

    def newStage() = { val s = CtrlLink(); stages += s; s }
    val fetch = newStage()
    val decode = newStage()
    val execute = newStage()
    val memory = newStage()
    val write = newStage()

    def getIndex(stage: CtrlLink) = stages.indexOf(stage)

    plugins ++= Seq(
        new Pc(getIndex(fetch), getIndex(decode)),
        new Fetcher(getIndex(fetch)),
        new Decoder(getIndex(decode)),
        new RegisterFile(getIndex(decode), getIndex(write)),
        new Bypass(getIndex(decode), 5),
        new IntAlu(getIndex(decode), getIndex(execute)),
        new DebugBus(getIndex(write)),
        new Shifter(getIndex(execute)),
        new Comparer(getIndex(decode)),
        new Dcache(getIndex(memory))
    )

    build()
}

object LAS32Verilog extends App {
    Config.spinal.generateVerilog(new LAS32())
}
