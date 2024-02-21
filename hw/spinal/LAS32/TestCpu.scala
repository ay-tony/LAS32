package LAS32

import spinal.core._
import spinal.core.sim._

object CpuSim extends App {
    Config.sim
        .compile {
            val d = MyTopLevel()
            d.fetcher.icache.simPublic()
            d
        }
        .doSim { dut =>
            def nop() = BigInt(0)
            def add(rd: Int, rs: Int, rt: Int) = BigInt((0 << 26) | (rs << 21) | (rt << 16) | (rd << 11) | 0x20)
            def addi(rt: Int, rs: Int, imm: Int) = BigInt((0x8 << 26) | (rs << 21) | (rt << 16) | imm)
            def sub(rd: Int, rs: Int, rt: Int) = BigInt((0 << 26) | (rs << 21) | (rt << 16) | (rd << 11) | 0x22)
            def ori(rt: Int, rs: Int, imm: Int) = BigInt((0x0d << 26) | (rs << 21) | (rt << 16) | imm)

            val mem = dut.fetcher.icache
            mem.setBigInt(0x3000 / 4, addi(1, 0, 1))
            mem.setBigInt(0x3004 / 4, addi(2, 0, 10))
            mem.setBigInt(0x3008 / 4, add(3, 1, 2))
            mem.setBigInt(0x300c / 4, nop())
            mem.setBigInt(0x3010 / 4, sub(4, 3, 2))
            mem.setBigInt(0x3014 / 4, sub(5, 0, 1))
            mem.setBigInt(0x3018 / 4, ori(6, 2, 0x1200))
            mem.setBigInt(0x301c / 4, addi(5, 10, 3004))
            mem.setBigInt(0x3020 / 4, addi(8, 7, 19904))

            dut.clockDomain.forkStimulus(10)

            dut.clockDomain.assertReset()
            dut.clockDomain.waitRisingEdge()
            dut.clockDomain.deassertReset()

            for (t <- 0 until 32) {
                dut.clockDomain.waitRisingEdge()
                val pc = dut.io.pc.toLong
                val en = dut.io.regfile_write_enable.toBoolean
                val addr = dut.io.regfile_write_addr.toInt
                val data = dut.io.regfile_write_data.toLong
                println("*%8h: %8h > %2d %b".format(pc, data, addr, en))
            }
        }
}
