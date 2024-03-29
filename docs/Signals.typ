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
    [LUC_OP], [IntAlu], [LucOp], [LucOp.si12()],
    [LUC_OUT], [IntAlu], [Bits(32 bits)], [],
    [WRITE_AT_LUC], [IntAlu], [Bool()], [False],
    [ALU_OP], [IntAlu], [AluOp], [AluOp.add()],
    [ALU_SRC1], [IntAlu], [AluSrc1], [AluSrc1.rj()],
    [ALU_SRC2], [IntAlu], [AluSrc2], [AluSrc2.rk()],
    [ALU_OUT], [IntAlu], [Bits(32 bits)], [],
    [WRITE_AT_ALU], [IntAlu], [Bool()], [False],
)

