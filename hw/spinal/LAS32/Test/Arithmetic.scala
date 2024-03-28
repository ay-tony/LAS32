package LAS32.Test

import spinal.core._
import spinal.core.sim._
import LAS32._
import LAS32.Plugin._

object Arithmetic extends App {
    Config.sim
        .compile {
            val d = new LAS32()
            d.getPlugin(classOf[Fetcher]).icache.simPublic()
            d
        }
        .doSim { dut =>
            def addw(rd: Int, rj: Int, rk: Int) = BigInt((0x20 << 15) | (rk << 10) | (rj << 5) | rd)
            def subw(rd: Int, rj: Int, rk: Int) = BigInt((0x22 << 15) | (rk << 10) | (rj << 5) | rd)
            def addiw(rd: Int, rj: Int, si12: Int) = BigInt((0xa << 22) | ((si12 & 0xfff) << 10) | (rj << 5) | rd)
            def lu12iw(rd: Int, si20: Int) = BigInt((0xa << 25) | ((si20 & 0xfffff) << 5) | rd)
            def slt(rd: Int, rj: Int, rk: Int) = BigInt((0x24 << 15) | (rk << 10) | (rj << 5) | rd)
            // def ori(rt: Int, rs: Int, imm: Int) = BigInt((0x0d << 26) | (rs << 21) | (rt << 16) | imm)
            // def beq(rs: Int, rt: Int, imm: Int) = BigInt((0x04 << 26) | (rs << 21) | (rt << 16) | imm)
            // def j(imm: Int) = BigInt((0x02 << 26) | imm)
            // def jal(imm: Int) = BigInt((0x03 << 26) | imm)
            // def jr(rs: Int) = BigInt(rs << 21 | 0x08)
            // def lw(rt: Int, offset: Int, base: Int) = BigInt((0x23L << 26) | (base << 21) | (rt << 16) | offset)
            // def sw(rt: Int, offset: Int, base: Int) = BigInt((0x2bL << 26) | (base << 21) | (rt << 16) | offset)
            def nop() = addw(0, 0, 0)

            val reset = for (i <- 1 to 31) yield lu12iw(i, 0)

            val addiw_test = List(
                addiw(1, 0, 1),
                addiw(2, 1, 2),
                addiw(3, 2, 4),
                addiw(4, 3, 8),
                addiw(5, 4, 16)
            )

            val addw_test = List(
                addiw(1, 0, 1),
                addw(2, 1, 1),
                addw(3, 2, 2),
                addw(4, 3, 3),
                addw(5, 4, 4),
                addw(6, 5, 5)
            )

            val subw_test = List(
                addiw(1, 0, 10),
                addiw(2, 0, 20),
                subw(3, 2, 1),
                subw(4, 3, 1),
                subw(5, 1, 2)
            )

            val lu12iw_test = List(
                lu12iw(1, 0),
                lu12iw(1, 1),
                lu12iw(1, 10),
                lu12iw(1, 32768)
            )

            val slt_test = List(
                addiw(1, 0, 1),
                addiw(2, 0, 2),
                slt(3, 1, 2),
                slt(4, 2, 1),
                addiw(1, 0, -1),
                addiw(2, 0, -2),
                slt(3, 1, 2),
                slt(4, 2, 1)
            )

            val instructions = slt_test

            val mem = dut.getPlugin(classOf[Fetcher]).icache
            var addr = 0x3000
            for (inst <- instructions) {
                mem.setBigInt(addr / 4, inst)
                addr += 4
            }

            dut.clockDomain.forkStimulus(10)

            dut.clockDomain.waitRisingEdge()
            dut.clockDomain.waitRisingEdge()
            dut.clockDomain.assertReset()
            dut.clockDomain.waitRisingEdge()
            dut.clockDomain.deassertReset()
            dut.clockDomain.waitRisingEdge()
            dut.clockDomain.waitRisingEdge()
            dut.clockDomain.waitRisingEdge()
            dut.clockDomain.waitRisingEdge()

            val bus = dut.getPlugin(classOf[DebugBus]).debugBus
            for (t <- 0 until instructions.length) {
                dut.clockDomain.waitRisingEdge()
                val pc = bus.pc.toLong
                val en = bus.regfileWriteEnable.toBoolean
                val addr = bus.regfileWriteAddr.toInt
                val data = bus.regfileWriteVal.toLong
                println("*%8h: %8h > %2d %b".format(pc, data, addr, en))
            }
        }
}
