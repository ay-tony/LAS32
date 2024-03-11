#table(
    columns: 4,
    [*Signal*], [*Plugin*], [*Type*], [*Default*],
    [PC], [Fetcher], [UInt(32 bits)], [],
    [INSTRUCTION], [Fetcher], [Bits(32 bits)], [],
    [REGFILE_ADDR1], [RegisterFile], [UInt(5 bits)], [I(9:5)],
    [REGFILE_ADDR2], [RegisterFile], [UInt(5 bits)], [I(14:10)],
    [REGFILE_VAL1_ENABLE], [RegisterFile], [Bool()], [False],
    [REGFILE_VAL2_ENABLE], [RegisterFile], [Bool()], [False],
    [REGFILE_VAL1], [RegisterFile], [Bits(32 bits)], [],
    [REGFILE_VAL2], [RegisterFile], [Bits(32 bits)], [],
    [REGFILE_WRITE_ENABLE], [RegisterFile], [Bool()], [False], 
    [REGFILE_WRITE_ADDR], [RegisterFile], [UInt(5 bits)], [I(4:0)],
    [REGFILE_WRITE_VAL], [RegisterFile], [Bits(32 bits)], [],
    [ALU_OP], [IntAlu], [AluOp], [AluOp.add],
    [ALU_OUT], [IntAlu], [Bits(32 bits)], [],
)

- ADD.W
#table(
  columns: 2,
  [ALU_OP], [AluOp.add],
  [REGFILE_VAL1_ENABLE], [True],
  [REGFILE_VAL2_ENABLE], [True],
  [REGFILE_WRITE_ENABLE], [True]
)
