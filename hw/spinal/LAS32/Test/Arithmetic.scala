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
            def sltu(rd: Int, rj: Int, rk: Int) = BigInt((0x25 << 15) | (rk << 10) | (rj << 5) | rd)
            def slti(rd: Int, rj: Int, si12: Int) = BigInt((0x8 << 22) | ((si12 & 0xfff) << 10) | (rj << 5) | rd)
            def sltui(rd: Int, rj: Int, si12: Int) = BigInt((0x9 << 22) | ((si12 & 0xfff) << 10) | (rj << 5) | rd)
            def pcaddu12i(rd: Int, si20: Int) = BigInt((0xe << 25) | ((si20 & 0xfffff) << 5) | rd)
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
                slt(4, 2, 1),
                addiw(1, 0, 1),
                addiw(2, 0, -2),
                slt(3, 1, 2),
                slt(4, 2, 1)
            )

            val sltu_test = List(
                addiw(1, 0, 1),
                addiw(2, 0, 2),
                sltu(3, 1, 2),
                sltu(4, 2, 1),
                addiw(1, 0, -1),
                addiw(2, 0, -2),
                sltu(3, 1, 2),
                sltu(4, 2, 1),
                addiw(1, 0, 1),
                addiw(2, 0, -2),
                sltu(3, 1, 2),
                sltu(4, 2, 1)
            )

            val slti_test = List(
                addiw(1, 0, 1),
                slti(3, 1, 2),
                slti(4, 1, 1),
                slti(4, 1, 0),
                slti(4, 1, -1),
                addiw(1, 0, -1),
                slti(3, 1, -2),
                slti(4, 1, -1),
                slti(4, 1, 0),
                slti(4, 1, 1)
            )

            val sltui_test = List(
                addiw(1, 0, 1),
                sltui(3, 1, 2),
                sltui(4, 1, 1),
                sltui(4, 1, 0),
                sltui(4, 1, -1),
                addiw(1, 0, -1),
                sltui(3, 1, -2),
                sltui(4, 1, -1),
                sltui(4, 1, 0),
                sltui(4, 1, 1)
            )

            val pcaddu12i_test = List(
                pcaddu12i(1, 0),
                pcaddu12i(1, 1),
                pcaddu12i(1, 2),
                pcaddu12i(1, 3),
                pcaddu12i(1, 4),
                pcaddu12i(1, 5),
                pcaddu12i(1, 6),
                pcaddu12i(1, 7),
                pcaddu12i(1, 8),
                pcaddu12i(1, 9)
            )

            val instructions = pcaddu12i_test

            val mem = dut.getPlugin(classOf[Fetcher]).icache
            var addr: Long = 0x3000
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
            var pc: Long = bus.pc.toLong
            var waddr: Long = bus.regfileWriteAddr.toLong
            var wdata: Long = bus.regfileWriteVal.toLong
            var en: Boolean = bus.regfileWriteEnable.toBoolean
            while (pc != addr) {
                dut.clockDomain.waitRisingEdge()
                pc = bus.pc.toLong
                en = bus.regfileWriteEnable.toBoolean
                waddr = bus.regfileWriteAddr.toLong
                wdata = bus.regfileWriteVal.toLong
                println("*%8h: %8h > %2d %b".format(pc, wdata, waddr, en))
            }
        }
}
