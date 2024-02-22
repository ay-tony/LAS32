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
            def lui(rt: Int, imm: Int) = BigInt((0x0f << 26) | (rt << 16) | imm)
            def j(imm: Int) = BigInt((0x02 << 26) | imm)
            def jal(imm: Int) = BigInt((0x03 << 26) | imm)
            def jr(rs: Int) = BigInt(rs << 21 | 0x08)

            val instructions = List(
                lui(1, 0x1234),
                ori(1, 1, 0x5678),
                jal(0x301c),
                nop(),
                add(2, 2, 2),
                j(0x3000),
                nop(),
                add(2, 1, 1),
                jr(31),
                nop()
            )

            val mem = dut.fetcher.icache
            var addr = 0x3000
            for (inst <- instructions) {
                mem.setBigInt(addr / 4, inst)
                addr += 4
            }

            dut.clockDomain.forkStimulus(10)

            dut.clockDomain.waitRisingEdge()
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
