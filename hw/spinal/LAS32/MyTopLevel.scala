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

    // -----
    // ----- stages
    // -----
    val fetch, decode, execute, memory, write = CtrlLink()

    val f2d = StageLink(fetch.down, decode.up)
    val d2e = StageLink(decode.down, execute.up)
    val e2m = StageLink(execute.down, memory.up)
    val m2w = StageLink(memory.down, write.up)

    // -----
    // ----- signals
    // -----

    // base
    val PC = Payload(UInt(32 bits))
    val INSTRUCTION = Payload(Bits(32 bits))

    // instruction
    object InstructionType extends SpinalEnum {
        val r, i, j = newElement()
    }
    val INSTRUCTION_TYPE = Payload(InstructionType()) // control signal

    // bypass
    val BYPASS_EXECUTE_ENABLE, BYPASS_MEMORY_ENABLE, BYPASS_WRITE_ENABLE = Payload(Bool()) // control signal
    object BypassRegfileWriteDataComponent extends SpinalEnum {
        val alu, luc, npc, memory = newElement()
    }
    val BYPASS_REGFILE_WRITE_DATA_COMPONENT = Payload(BypassRegfileWriteDataComponent()) // control signal

    // npc
    object NpcOp extends SpinalEnum {
        val pc4, imm26, regfile, imm16 = newElement()
    }
    val NPC_OP = Payload(NpcOp()) // control signal
    val NPC = Payload(UInt(32 bits))

    // regfile read
    val REGFILE_ADDR1, REGFILE_ADDR2 = Payload(UInt(5 bits)) // control signal
    val REGFILE_VAL1, REGFILE_VAL2 = Payload(Bits(32 bits))

    // cmp
    val REGFILE_VAL_EQUAL = Payload(Bool())

    // alu
    object AluOp extends SpinalEnum {
        val add, sub, or = newElement()
    }
    val ALU_OP = Payload(AluOp()) // control signal
    val ALU_OUT = Payload(Bits(32 bits))

    // memory
    val MEMORY_WRITE_ENABLE = Payload(Bool()) // control signal

    // regfile write
    val REGFILE_WRITE_ENABLE = Payload(Bool()) // control signal
    val REGFILE_WRITE_ADDR = Payload(UInt(5 bits)) // control signal
    val REGFILE_WRITE_DATA = Payload(Bits(32 bits))

    // -----
    // ----- components
    // -----
    val fetcher = new fetch.Area {
        val pc = Reg(PC) init (0x3000)
        pc := up.isFiring ? decode(NPC) | pc
        PC := pc

        val icache = Mem(Bits(32 bits), 0x8000)
        INSTRUCTION := icache(PC(16 downto 2))
    }

    val decoder = new decode.Area {
        val IS_NOP = INSTRUCTION === M"00000000000000000000000000000000"
        val IS_ADD = INSTRUCTION === M"000000---------------00000100000"
        val IS_ADDI = INSTRUCTION === M"001000--------------------------"
        val IS_ADDU = INSTRUCTION === M"000000---------------00000100001"
        val IS_ADDIU = INSTRUCTION === M"001001--------------------------"
        val IS_SUB = INSTRUCTION === M"000000---------------00000100010"
        val IS_SUBU = INSTRUCTION === M"000000---------------00000100011"
        val IS_SLT = INSTRUCTION === M"000000---------------00000101010"
        val IS_SLTI = INSTRUCTION === M"001010--------------------------"
        val IS_SLTU = INSTRUCTION === M"000000---------------00000101011"
        val IS_SLTIU = INSTRUCTION === M"001011--------------------------"

        val IS_LUI = INSTRUCTION === M"00111100000---------------------"
        val IS_ORI = INSTRUCTION === M"001101--------------------------"
        val IS_BEQ = INSTRUCTION === M"000100--------------------------"
        val IS_J = INSTRUCTION === M"000010--------------------------"
        val IS_JAL = INSTRUCTION === M"000011--------------------------"
        val IS_JR = INSTRUCTION === M"000000-----000000000000000001000"
        val IS_LW = INSTRUCTION === M"100011--------------------------"
        val IS_SW = INSTRUCTION === M"101011--------------------------"

        // default signals
        INSTRUCTION_TYPE := InstructionType.r
        BYPASS_EXECUTE_ENABLE := False
        BYPASS_MEMORY_ENABLE := False
        BYPASS_WRITE_ENABLE := True
        BYPASS_REGFILE_WRITE_DATA_COMPONENT := BypassRegfileWriteDataComponent.alu
        NPC_OP := NpcOp.pc4
        REGFILE_ADDR1 := U(INSTRUCTION(25 downto 21))
        REGFILE_ADDR2 := U(INSTRUCTION(20 downto 16))
        ALU_OP := AluOp.add
        MEMORY_WRITE_ENABLE := False
        REGFILE_WRITE_ENABLE := False
        REGFILE_WRITE_ADDR :=
            (INSTRUCTION_TYPE === InstructionType.r) ? U(INSTRUCTION(15 downto 11)) | U(INSTRUCTION(20 downto 16))
        up(REGFILE_WRITE_DATA) := 0 // not control signal, but initialize here to prevent latch

        when(IS_ADD) {
            BYPASS_MEMORY_ENABLE := True

            REGFILE_WRITE_ENABLE := True
        }.elsewhen(IS_ADDI) {
            INSTRUCTION_TYPE := InstructionType.i

            BYPASS_MEMORY_ENABLE := True

            REGFILE_ADDR2 := 0
            REGFILE_WRITE_ENABLE := True
        }.elsewhen(IS_SUB) {
            BYPASS_MEMORY_ENABLE := True

            ALU_OP := AluOp.sub
            REGFILE_WRITE_ENABLE := True
        }.elsewhen(IS_ORI) {
            INSTRUCTION_TYPE := InstructionType.i

            BYPASS_MEMORY_ENABLE := True

            REGFILE_ADDR2 := 0
            ALU_OP := AluOp.or
            REGFILE_WRITE_ENABLE := True
        }.elsewhen(IS_LUI) {
            INSTRUCTION_TYPE := InstructionType.i

            BYPASS_EXECUTE_ENABLE := True
            BYPASS_MEMORY_ENABLE := True
            BYPASS_REGFILE_WRITE_DATA_COMPONENT := BypassRegfileWriteDataComponent.luc

            REGFILE_ADDR1 := 0
            REGFILE_ADDR2 := 0
            REGFILE_WRITE_ENABLE := True
        }.elsewhen(IS_J) {
            INSTRUCTION_TYPE := InstructionType.j

            BYPASS_WRITE_ENABLE := False

            NPC_OP := NpcOp.imm26
            REGFILE_ADDR1 := 0
            REGFILE_ADDR2 := 0
        }.elsewhen(IS_JAL) {
            INSTRUCTION_TYPE := InstructionType.j

            BYPASS_EXECUTE_ENABLE := True
            BYPASS_MEMORY_ENABLE := True
            BYPASS_REGFILE_WRITE_DATA_COMPONENT := BypassRegfileWriteDataComponent.npc

            NPC_OP := NpcOp.imm26
            REGFILE_ADDR1 := 0
            REGFILE_ADDR2 := 0
            REGFILE_WRITE_ADDR := 31
            REGFILE_WRITE_ENABLE := True
        }.elsewhen(IS_JR) {
            BYPASS_WRITE_ENABLE := False

            NPC_OP := NpcOp.regfile
            REGFILE_ADDR2 := 0
        }.elsewhen(IS_BEQ) {
            INSTRUCTION_TYPE := InstructionType.i

            BYPASS_WRITE_ENABLE := False

            NPC_OP := REGFILE_VAL_EQUAL ? NpcOp.imm16 | NpcOp.pc4
        }.elsewhen(IS_LW) {
            INSTRUCTION_TYPE := InstructionType.i

            BYPASS_REGFILE_WRITE_DATA_COMPONENT := BypassRegfileWriteDataComponent.memory

            REGFILE_ADDR2 := 0
            REGFILE_WRITE_ENABLE := True
        }.elsewhen(IS_SW) {
            INSTRUCTION_TYPE := InstructionType.i

            BYPASS_WRITE_ENABLE := False

            REGFILE_WRITE_ADDR := 0
            MEMORY_WRITE_ENABLE := True
        }
    }

    // general register file
    val regfile = new decode.Area {
        val regfile = Mem(Bits(32 bits), 32)

        // inner regfile forward
        REGFILE_VAL1 := (REGFILE_ADDR1 =/= 0) ?
            ((REGFILE_ADDR1 === write(REGFILE_WRITE_ADDR)) ? write(REGFILE_WRITE_DATA) | regfile(REGFILE_ADDR1)) |
            B(0, 32 bits)
        REGFILE_VAL2 := (REGFILE_ADDR2 =/= 0) ?
            ((REGFILE_ADDR2 === write(REGFILE_WRITE_ADDR)) ? write(REGFILE_WRITE_DATA) | regfile(REGFILE_ADDR2)) |
            B(0, 32 bits)
    }

    // comparing component
    val cmp = new decode.Area {
        REGFILE_VAL_EQUAL := (REGFILE_VAL1 === REGFILE_VAL2)
    }

    // load upperbits component
    val luc = new decode.Area {
        when(BYPASS_REGFILE_WRITE_DATA_COMPONENT === BypassRegfileWriteDataComponent.luc) {
            decode.bypass(REGFILE_WRITE_DATA) := INSTRUCTION(15 downto 0) ## B(0, 16 bits)
        }
    }

    // npc
    val npc = new decode.Area {
        when(NPC_OP === NpcOp.pc4) {
            NPC := fetch(PC) + 4
        }.elsewhen(NPC_OP === NpcOp.imm26) {
            NPC := U(PC(31 downto 28) ## INSTRUCTION(25 downto 0) ## B(0, 2 bits))
        }.elsewhen(NPC_OP === NpcOp.regfile) {
            NPC := U(REGFILE_VAL1)
        }.elsewhen(NPC_OP === NpcOp.imm16) {
            NPC := fetch(PC) + U(INSTRUCTION(15 downto 0) ## B(0, 2 bits))
        }.otherwise {
            NPC := fetch(PC) + 4
        }

        when(BYPASS_REGFILE_WRITE_DATA_COMPONENT === BypassRegfileWriteDataComponent.npc) {
            decode.bypass(REGFILE_WRITE_DATA) := B(PC + 8)
        }
    }

    // algorithm logical unit
    val alu = new execute.Area {
        val in1 = REGFILE_VAL1
        val in2 = (INSTRUCTION_TYPE === InstructionType.i) ? B(S(INSTRUCTION(15 downto 0), 32 bits)) | REGFILE_VAL2

        when(ALU_OP === AluOp.add) {
            ALU_OUT := B(S(in1) + S(in2))
        }.elsewhen(ALU_OP === AluOp.sub) {
            ALU_OUT := B(S(in1) - S(in2))
        }.otherwise {
            ALU_OUT := B(S(in1) + S(in2))
        }

        when(BYPASS_REGFILE_WRITE_DATA_COMPONENT === BypassRegfileWriteDataComponent.alu && isValid) {
            execute.bypass(REGFILE_WRITE_DATA) := ALU_OUT
        }
    }

    // memory
    val mem = new memory.Area {
        val dcache = Mem(Bits(32 bits), 0x8000)

        when(MEMORY_WRITE_ENABLE && up.isFiring) {
            dcache(U(ALU_OUT(16 downto 2))) := REGFILE_VAL2
        }

        when(BYPASS_REGFILE_WRITE_DATA_COMPONENT === BypassRegfileWriteDataComponent.memory && isValid) {
            memory.bypass(REGFILE_WRITE_DATA) := dcache(U(ALU_OUT(16 downto 2)))
        }
    }

    // general register file - write stage
    val write_regfile = new write.Area {
        when(REGFILE_WRITE_ENABLE && REGFILE_WRITE_ADDR =/= 0 && up.isFiring && isValid) {
            regfile.regfile(REGFILE_WRITE_ADDR) := REGFILE_WRITE_DATA
        }
    }

    val hazard = new Area {
        // execute stage
        when(execute(REGFILE_ADDR1) =/= 0 && execute.isValid) {
            // stages are iterated reversely to guarentee that novel generations are preserved
            when(execute(REGFILE_ADDR1) === write(REGFILE_WRITE_ADDR) && write.isValid) {
                when(write(BYPASS_WRITE_ENABLE)) {
                    execute.bypass(REGFILE_VAL1) := write(REGFILE_WRITE_DATA)
                }.otherwise {
                    execute.haltIt()
                }
            }
            when(execute(REGFILE_ADDR1) === memory(REGFILE_WRITE_ADDR) && memory.isValid) {
                when(memory(BYPASS_MEMORY_ENABLE)) {
                    execute.bypass(REGFILE_VAL1) := memory(REGFILE_WRITE_DATA)
                }.otherwise {
                    execute.haltIt()
                }
            }
        }
        when(execute(REGFILE_ADDR2) =/= 0 && execute.isValid) {
            // stages are iterated reversely to guarentee that novel generations are preserved
            when(execute(REGFILE_ADDR2) === write(REGFILE_WRITE_ADDR) && write.isValid) {
                when(write(BYPASS_WRITE_ENABLE)) {
                    execute.bypass(REGFILE_VAL2) := write(REGFILE_WRITE_DATA)
                }.otherwise {
                    execute.haltIt()
                }
            }
            when(execute(REGFILE_ADDR2) === memory(REGFILE_WRITE_ADDR) && memory.isValid) {
                when(memory(BYPASS_MEMORY_ENABLE)) {
                    execute.bypass(REGFILE_VAL2) := memory(REGFILE_WRITE_DATA)
                }.otherwise {
                    execute.haltIt()
                }
            }
        }

        // memory stage
        when(memory(REGFILE_ADDR1) =/= 0 && memory.isValid) {
            when(memory(REGFILE_ADDR1) === write(REGFILE_WRITE_ADDR) && write.isValid) {
                when(write(BYPASS_WRITE_ENABLE)) {
                    memory.bypass(REGFILE_VAL1) := write(REGFILE_WRITE_DATA)
                }.otherwise {
                    memory.haltIt()
                }
            }
        }
        when(memory(REGFILE_ADDR2) =/= 0 && memory.isValid) {
            when(memory(REGFILE_ADDR2) === write(REGFILE_WRITE_ADDR) && write.isValid) {
                when(write(BYPASS_WRITE_ENABLE)) {
                    memory.bypass(REGFILE_VAL2) := write(REGFILE_WRITE_DATA)
                }.otherwise {
                    memory.haltIt()
                }
            }
        }
    }

    // -----
    // ----- ios
    // -----
    io.pc := write(PC)
    io.regfile_write_enable := write(REGFILE_WRITE_ENABLE)
    io.regfile_write_addr := write(REGFILE_WRITE_ADDR)
    io.regfile_write_data := write(REGFILE_WRITE_DATA)

    // -----
    // ----- build the pipeline
    // -----
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
