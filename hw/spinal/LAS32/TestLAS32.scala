package LAS32

import spinal.core._
import spinal.core.sim._
import LAS32.Plugin._

object TestLAS32 extends App {
    Config.sim
        .compile {
            val d = new LAS32()
            d.getPlugin(classOf[Fetcher]).icache.simPublic()
            d
        }
        .doSim { dut =>
            def nop() = BigInt(0)
            def addw(rd: Int, rj: Int, rk: Int) = BigInt((0x20 << 15) | (rk << 10) | (rj << 5) | rd)
            // def addi(rt: Int, rs: Int, imm: Int) = BigInt((0x8 << 26) | (rs << 21) | (rt << 16) | imm)
            // def sub(rd: Int, rs: Int, rt: Int) = BigInt((0 << 26) | (rs << 21) | (rt << 16) | (rd << 11) | 0x22)
            // def ori(rt: Int, rs: Int, imm: Int) = BigInt((0x0d << 26) | (rs << 21) | (rt << 16) | imm)
            // def lui(rt: Int, imm: Int) = BigInt((0x0f << 26) | (rt << 16) | imm)
            // def beq(rs: Int, rt: Int, imm: Int) = BigInt((0x04 << 26) | (rs << 21) | (rt << 16) | imm)
            // def j(imm: Int) = BigInt((0x02 << 26) | imm)
            // def jal(imm: Int) = BigInt((0x03 << 26) | imm)
            // def jr(rs: Int) = BigInt(rs << 21 | 0x08)
            // def lw(rt: Int, offset: Int, base: Int) = BigInt((0x23L << 26) | (base << 21) | (rt << 16) | offset)
            // def sw(rt: Int, offset: Int, base: Int) = BigInt((0x2bL << 26) | (base << 21) | (rt << 16) | offset)

            val instructions = List(
                nop(),
                nop(),
                nop(),
                nop(),
                nop(),
                nop(),
                nop(),
                nop(),
                nop(),
                nop(),
                nop(),
                addw(1, 0, 1),
                addw(1, 0, 1),
                addw(1, 0, 1),
                nop(),
                nop(),
                nop()
            )

            val mem = dut.getPlugin(classOf[Fetcher]).icache
            var addr = 0x3000
            for (inst <- instructions) {
                mem.setBigInt(addr / 4, inst)
                addr += 4
            }

            dut.clockDomain.forkStimulus(10)

            dut.clockDomain.waitRisingEdge()
            dut.clockDomain.waitRisingEdge()
            dut.clockDomain.waitRisingEdge()
            dut.clockDomain.assertReset()
            dut.clockDomain.waitRisingEdge()
            dut.clockDomain.deassertReset()

            val bus = dut.getPlugin(classOf[DebugBus]).debugBus
            for (t <- 0 until 64) {
                dut.clockDomain.waitRisingEdge()
                val pc = bus.pc.toLong
                val en = bus.regfileWriteEnable.toBoolean
                val addr = bus.regfileWriteAddr.toInt
                val data = bus.regfileWriteVal.toLong
                println("*%8h: %8h > %2d %b".format(pc, data, addr, en))
            }
        }
}
