#table(
    columns: 4,
    [*Signal*], [*Plugin*], [*Type*], [*Default*],
    [PC], [Fetcher], [UInt(32 bits)], [],
    [INSTRUCTION], [Fetcher], [Bits(32 bits)], [],
    [REGFILE_RJ_ENABLE], [RegisterFile], [Bool()], [False],
    [REGFILE_RK_ENABLE], [RegisterFile], [Bool()], [False],
    [REGFILE_RJ_ADDR], [RegisterFile], [UInt(5 bits)], [I(9:5)],
    [REGFILE_RK_ADDR], [RegisterFile], [UInt(5 bits)], [I(14:10)],
    [REGFILE_RJ], [RegisterFile], [Bits(32 bits)], [],
    [REGFILE_RK], [RegisterFile], [Bits(32 bits)], [],
    [REGFILE_RD_ENABLE], [RegisterFile], [Bool()], [False], 
    [REGFILE_RD_ADDR], [RegisterFile], [UInt(5 bits)], [I(4:0)],
    [REGFILE_RD], [RegisterFile], [Bits(32 bits)], [],
    [ALU_OP], [IntAlu], [AluOp], [AluOp.add()],
    [ALU_SRC2], [IntAlu], [AluSrc2], [AluSrc2.rk()],
    [ALU_OUT], [IntAlu], [Bits(32 bits)], [],
)

- ADD.W (IntAlu)
#table(
  columns: 2,
  [REGFILE_RJ_ENABLE], [True],
  [REGFILE_RK_ENABLE], [True],
  [REGFILE_RD_ENABLE], [True]
)

- SUB.W (IntAlu)
#table(
  columns: 2,
  [ALU_OP], [AluOp.sub()],
  [REGFILE_RJ_ENABLE], [True],
  [REGFILE_RK_ENABLE], [True],
  [REGFILE_RD_ENABLE], [True]
)

- ADDI.W (IntAlu)
#table(
  columns: 2,
  [ALU_SRC2], [AluSrc2.si12()],
  [REGFILE_RJ_ENABLE], [True],
  [REGFILE_RD_ENABLE], [True]
)

- LU12I.W (IntAlu)
#table(
  columns: 2,
  [ALU_OP], [AluOp.src2()],
  [ALU_SRC2], [AluSrc2.si20()],
  [REGFILE_RD_ENABLE], [True]
)
