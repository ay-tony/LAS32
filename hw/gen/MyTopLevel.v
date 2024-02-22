// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : MyTopLevel
// Git hash  : 2585d214d16c1badba47c0d1050a2206ba797877

`timescale 1ns/1ps

module MyTopLevel (
  output wire [31:0]   io_pc,
  output wire          io_regfile_write_enable,
  output wire [4:0]    io_regfile_write_addr,
  output wire [31:0]   io_regfile_write_data,
  input  wire          clk,
  input  wire          reset
);
  localparam AluOp_add = 2'd0;
  localparam AluOp_sub = 2'd1;
  localparam AluOp_or_1 = 2'd2;
  localparam BypassRegfileWriteDataComponent_Alu = 2'd0;
  localparam BypassRegfileWriteDataComponent_Luc = 2'd1;
  localparam BypassRegfileWriteDataComponent_Npc = 2'd2;
  localparam InstructionType_r = 2'd0;
  localparam InstructionType_i = 2'd1;
  localparam InstructionType_j = 2'd2;
  localparam NpcOp_pc4 = 2'd0;
  localparam NpcOp_imm26 = 2'd1;
  localparam NpcOp_regfile = 2'd2;
  localparam NpcOp_imm16 = 2'd3;

  wire       [31:0]   _zz_fetcher_icache_port0;
  wire       [31:0]   _zz_regfile_regfile_port0;
  wire       [31:0]   _zz_regfile_regfile_port1;
  wire       [31:0]   _zz_decode_down_NPC;
  wire       [17:0]   _zz_decode_down_NPC_1;
  wire       [31:0]   _zz_decode_REGFILE_WRITE_DATA_bypass;
  wire       [31:0]   _zz_alu_in2;
  wire       [15:0]   _zz_alu_in2_1;
  wire       [31:0]   _zz_execute_down_ALU_OUT;
  wire       [31:0]   _zz_execute_down_ALU_OUT_1;
  wire       [31:0]   _zz_execute_down_ALU_OUT_2;
  wire       [31:0]   _zz_execute_down_ALU_OUT_3;
  wire       [31:0]   _zz_execute_down_ALU_OUT_4;
  wire       [31:0]   _zz_execute_down_ALU_OUT_5;
  wire       [31:0]   _zz_execute_down_ALU_OUT_6;
  wire       [31:0]   _zz_execute_down_ALU_OUT_7;
  wire       [31:0]   _zz_execute_down_ALU_OUT_8;
  wire                memory_down_isValid;
  wire                execute_down_isValid;
  wire                execute_up_isValid;
  wire                decode_down_isValid;
  wire                decode_up_isValid;
  reg        [4:0]    write_up_REGFILE_WRITE_ADDR;
  reg                 write_up_REGFILE_WRITE_ENABLE;
  reg        [31:0]   write_up_REGFILE_WRITE_DATA;
  reg        [31:0]   write_up_PC;
  reg        [4:0]    memory_up_REGFILE_WRITE_ADDR;
  reg                 memory_up_REGFILE_WRITE_ENABLE;
  wire                memory_down_REGFILE_WRITE_ENABLE;
  reg                 memory_up_BYPASS_WRITE_ENABLE;
  reg                 memory_up_BYPASS_MEMORY_ENABLE;
  reg        [31:0]   memory_up_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_up_PC;
  wire       [31:0]   memory_down_PC;
  reg        [4:0]    execute_up_REGFILE_WRITE_ADDR;
  wire       [4:0]    execute_down_REGFILE_WRITE_ADDR;
  reg                 execute_up_REGFILE_WRITE_ENABLE;
  wire                execute_down_REGFILE_WRITE_ENABLE;
  reg        [1:0]    execute_up_ALU_OP;
  reg        [4:0]    execute_up_REGFILE_ADDR2;
  reg        [4:0]    execute_up_REGFILE_ADDR1;
  reg        [1:0]    execute_up_BYPASS_REGFILE_WRITE_DATA_COMPONENT;
  reg                 execute_up_BYPASS_WRITE_ENABLE;
  wire                execute_down_BYPASS_WRITE_ENABLE;
  reg                 execute_up_BYPASS_MEMORY_ENABLE;
  wire                execute_down_BYPASS_MEMORY_ENABLE;
  reg        [1:0]    execute_up_INSTRUCTION_TYPE;
  reg        [31:0]   execute_up_INSTRUCTION;
  reg        [31:0]   execute_up_PC;
  wire       [31:0]   execute_down_PC;
  wire                execute_down_isReady;
  reg                 execute_up_valid;
  reg        [31:0]   decode_up_INSTRUCTION;
  reg        [31:0]   decode_up_PC;
  wire                decode_down_isReady;
  wire                fetch_down_isReady;
  wire                write_down_valid;
  reg                 write_up_valid;
  wire                memory_down_valid;
  reg                 memory_up_valid;
  reg                 execute_down_valid;
  wire                fetch_up_ready;
  reg                 fetch_down_ready;
  wire                decode_up_ready;
  reg                 decode_down_ready;
  reg                 execute_up_ready;
  wire       [31:0]   write_down_PC;
  reg                 _zz_execute_haltRequest_MyTopLevel_l271;
  reg                 _zz_execute_haltRequest_MyTopLevel_l264;
  reg        [31:0]   execute_up_REGFILE_VAL2;
  reg        [31:0]   execute_REGFILE_VAL2_bypass;
  wire       [4:0]    execute_down_REGFILE_ADDR2;
  reg                 _zz_execute_haltRequest_MyTopLevel_l254;
  wire       [31:0]   memory_down_REGFILE_WRITE_DATA;
  wire                memory_down_BYPASS_MEMORY_ENABLE;
  wire       [4:0]    memory_down_REGFILE_WRITE_ADDR;
  reg                 _zz_execute_haltRequest_MyTopLevel_l247;
  reg        [31:0]   execute_up_REGFILE_VAL1;
  reg        [31:0]   execute_REGFILE_VAL1_bypass;
  wire                memory_down_BYPASS_WRITE_ENABLE;
  wire       [4:0]    execute_down_REGFILE_ADDR1;
  reg                 _zz_1;
  wire                write_down_REGFILE_WRITE_ENABLE;
  reg        [31:0]   execute_up_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_down_REGFILE_WRITE_DATA;
  reg        [31:0]   execute_REGFILE_WRITE_DATA_bypass;
  wire       [1:0]    execute_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT;
  wire       [31:0]   execute_down_REGFILE_VAL1;
  reg        [31:0]   execute_down_ALU_OUT;
  wire       [1:0]    execute_down_ALU_OP;
  wire       [31:0]   execute_down_REGFILE_VAL2;
  wire       [31:0]   execute_down_INSTRUCTION;
  wire       [1:0]    execute_down_INSTRUCTION_TYPE;
  wire       [31:0]   decode_down_PC;
  wire       [31:0]   decode_down_REGFILE_WRITE_DATA;
  reg        [31:0]   decode_REGFILE_WRITE_DATA_bypass;
  wire       [31:0]   decode_down_REGFILE_VAL2;
  wire       [31:0]   write_down_REGFILE_WRITE_DATA;
  wire       [4:0]    write_down_REGFILE_WRITE_ADDR;
  wire       [31:0]   decode_down_REGFILE_VAL1;
  wire                decode_down_REGFILE_VAL_EQUAL;
  wire       [31:0]   decode_up_REGFILE_WRITE_DATA;
  reg        [4:0]    decode_down_REGFILE_WRITE_ADDR;
  reg                 decode_down_REGFILE_WRITE_ENABLE;
  reg        [1:0]    decode_down_ALU_OP;
  reg        [4:0]    decode_down_REGFILE_ADDR2;
  reg        [4:0]    decode_down_REGFILE_ADDR1;
  reg        [1:0]    decode_down_NPC_OP;
  reg        [1:0]    decode_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT;
  wire                decode_down_BYPASS_WRITE_ENABLE;
  reg                 decode_down_BYPASS_MEMORY_ENABLE;
  reg                 decode_down_BYPASS_EXECUTE_ENABLE;
  reg        [1:0]    decode_down_INSTRUCTION_TYPE;
  wire       [31:0]   decode_down_INSTRUCTION;
  wire       [31:0]   fetch_down_INSTRUCTION;
  wire       [31:0]   fetch_down_PC;
  reg        [31:0]   decode_down_NPC;
  reg        [31:0]   fetcher_pc;
  wire       [14:0]   _zz_fetch_down_INSTRUCTION;
  wire                decoder_IS_NOP;
  wire                decoder_IS_ADD;
  wire                decoder_IS_ADDI;
  wire                decoder_IS_ADDU;
  wire                decoder_IS_ADDIU;
  wire                decoder_IS_SUB;
  wire                decoder_IS_SUBU;
  wire                decoder_IS_SLT;
  wire                decoder_IS_SLTI;
  wire                decoder_IS_SLTU;
  wire                decoder_IS_SLTIU;
  wire                decoder_IS_LUI;
  wire                decoder_IS_ORI;
  wire                decoder_IS_BEQ;
  wire                decoder_IS_J;
  wire                decoder_IS_JAL;
  wire                decoder_IS_JR;
  wire       [1:0]    _zz_decode_down_NPC_OP;
  wire                when_MyTopLevel_l190;
  wire                when_MyTopLevel_l197;
  wire                when_MyTopLevel_l199;
  wire                when_MyTopLevel_l201;
  wire                when_MyTopLevel_l203;
  wire                when_MyTopLevel_l209;
  wire       [31:0]   alu_in2;
  wire                when_MyTopLevel_l219;
  wire                when_MyTopLevel_l221;
  wire                when_MyTopLevel_l227;
  wire                when_MyTopLevel_l234;
  wire                when_MyTopLevel_l241;
  wire                when_MyTopLevel_l243;
  wire                execute_haltRequest_MyTopLevel_l247;
  wire                when_MyTopLevel_l250;
  wire                execute_haltRequest_MyTopLevel_l254;
  wire                when_MyTopLevel_l258;
  wire                when_MyTopLevel_l260;
  wire                execute_haltRequest_MyTopLevel_l264;
  wire                when_MyTopLevel_l267;
  wire                execute_haltRequest_MyTopLevel_l271;
  wire                when_CtrlLink_l151;
  wire                when_StageLink_l67;
  wire                when_StageLink_l67_1;
  `ifndef SYNTHESIS
  reg [31:0] execute_up_ALU_OP_string;
  reg [23:0] execute_up_BYPASS_REGFILE_WRITE_DATA_COMPONENT_string;
  reg [7:0] execute_up_INSTRUCTION_TYPE_string;
  reg [23:0] execute_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT_string;
  reg [31:0] execute_down_ALU_OP_string;
  reg [7:0] execute_down_INSTRUCTION_TYPE_string;
  reg [31:0] decode_down_ALU_OP_string;
  reg [55:0] decode_down_NPC_OP_string;
  reg [23:0] decode_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT_string;
  reg [7:0] decode_down_INSTRUCTION_TYPE_string;
  reg [55:0] _zz_decode_down_NPC_OP_string;
  `endif

  reg [31:0] fetcher_icache [0:32767];
  (* ram_style = "distributed" *) reg [31:0] regfile_regfile [0:31];

  assign _zz_decode_down_NPC_1 = {decode_down_INSTRUCTION[15 : 0],2'b00};
  assign _zz_decode_down_NPC = {14'd0, _zz_decode_down_NPC_1};
  assign _zz_decode_REGFILE_WRITE_DATA_bypass = (decode_down_PC + 32'h00000008);
  assign _zz_alu_in2_1 = execute_down_INSTRUCTION[15 : 0];
  assign _zz_alu_in2 = {{16{_zz_alu_in2_1[15]}}, _zz_alu_in2_1};
  assign _zz_execute_down_ALU_OUT = ($signed(_zz_execute_down_ALU_OUT_1) + $signed(_zz_execute_down_ALU_OUT_2));
  assign _zz_execute_down_ALU_OUT_1 = execute_down_REGFILE_VAL1;
  assign _zz_execute_down_ALU_OUT_2 = alu_in2;
  assign _zz_execute_down_ALU_OUT_3 = ($signed(_zz_execute_down_ALU_OUT_4) - $signed(_zz_execute_down_ALU_OUT_5));
  assign _zz_execute_down_ALU_OUT_4 = execute_down_REGFILE_VAL1;
  assign _zz_execute_down_ALU_OUT_5 = alu_in2;
  assign _zz_execute_down_ALU_OUT_6 = ($signed(_zz_execute_down_ALU_OUT_7) + $signed(_zz_execute_down_ALU_OUT_8));
  assign _zz_execute_down_ALU_OUT_7 = execute_down_REGFILE_VAL1;
  assign _zz_execute_down_ALU_OUT_8 = alu_in2;
  assign _zz_fetcher_icache_port0 = fetcher_icache[_zz_fetch_down_INSTRUCTION];
  assign _zz_regfile_regfile_port0 = regfile_regfile[decode_down_REGFILE_ADDR1];
  assign _zz_regfile_regfile_port1 = regfile_regfile[decode_down_REGFILE_ADDR2];
  always @(posedge clk) begin
    if(_zz_1) begin
      regfile_regfile[write_down_REGFILE_WRITE_ADDR] <= write_down_REGFILE_WRITE_DATA;
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(execute_up_ALU_OP)
      AluOp_add : execute_up_ALU_OP_string = "add ";
      AluOp_sub : execute_up_ALU_OP_string = "sub ";
      AluOp_or_1 : execute_up_ALU_OP_string = "or_1";
      default : execute_up_ALU_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_up_BYPASS_REGFILE_WRITE_DATA_COMPONENT)
      BypassRegfileWriteDataComponent_Alu : execute_up_BYPASS_REGFILE_WRITE_DATA_COMPONENT_string = "Alu";
      BypassRegfileWriteDataComponent_Luc : execute_up_BYPASS_REGFILE_WRITE_DATA_COMPONENT_string = "Luc";
      BypassRegfileWriteDataComponent_Npc : execute_up_BYPASS_REGFILE_WRITE_DATA_COMPONENT_string = "Npc";
      default : execute_up_BYPASS_REGFILE_WRITE_DATA_COMPONENT_string = "???";
    endcase
  end
  always @(*) begin
    case(execute_up_INSTRUCTION_TYPE)
      InstructionType_r : execute_up_INSTRUCTION_TYPE_string = "r";
      InstructionType_i : execute_up_INSTRUCTION_TYPE_string = "i";
      InstructionType_j : execute_up_INSTRUCTION_TYPE_string = "j";
      default : execute_up_INSTRUCTION_TYPE_string = "?";
    endcase
  end
  always @(*) begin
    case(execute_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT)
      BypassRegfileWriteDataComponent_Alu : execute_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT_string = "Alu";
      BypassRegfileWriteDataComponent_Luc : execute_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT_string = "Luc";
      BypassRegfileWriteDataComponent_Npc : execute_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT_string = "Npc";
      default : execute_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT_string = "???";
    endcase
  end
  always @(*) begin
    case(execute_down_ALU_OP)
      AluOp_add : execute_down_ALU_OP_string = "add ";
      AluOp_sub : execute_down_ALU_OP_string = "sub ";
      AluOp_or_1 : execute_down_ALU_OP_string = "or_1";
      default : execute_down_ALU_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_down_INSTRUCTION_TYPE)
      InstructionType_r : execute_down_INSTRUCTION_TYPE_string = "r";
      InstructionType_i : execute_down_INSTRUCTION_TYPE_string = "i";
      InstructionType_j : execute_down_INSTRUCTION_TYPE_string = "j";
      default : execute_down_INSTRUCTION_TYPE_string = "?";
    endcase
  end
  always @(*) begin
    case(decode_down_ALU_OP)
      AluOp_add : decode_down_ALU_OP_string = "add ";
      AluOp_sub : decode_down_ALU_OP_string = "sub ";
      AluOp_or_1 : decode_down_ALU_OP_string = "or_1";
      default : decode_down_ALU_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_down_NPC_OP)
      NpcOp_pc4 : decode_down_NPC_OP_string = "pc4    ";
      NpcOp_imm26 : decode_down_NPC_OP_string = "imm26  ";
      NpcOp_regfile : decode_down_NPC_OP_string = "regfile";
      NpcOp_imm16 : decode_down_NPC_OP_string = "imm16  ";
      default : decode_down_NPC_OP_string = "???????";
    endcase
  end
  always @(*) begin
    case(decode_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT)
      BypassRegfileWriteDataComponent_Alu : decode_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT_string = "Alu";
      BypassRegfileWriteDataComponent_Luc : decode_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT_string = "Luc";
      BypassRegfileWriteDataComponent_Npc : decode_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT_string = "Npc";
      default : decode_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_down_INSTRUCTION_TYPE)
      InstructionType_r : decode_down_INSTRUCTION_TYPE_string = "r";
      InstructionType_i : decode_down_INSTRUCTION_TYPE_string = "i";
      InstructionType_j : decode_down_INSTRUCTION_TYPE_string = "j";
      default : decode_down_INSTRUCTION_TYPE_string = "?";
    endcase
  end
  always @(*) begin
    case(_zz_decode_down_NPC_OP)
      NpcOp_pc4 : _zz_decode_down_NPC_OP_string = "pc4    ";
      NpcOp_imm26 : _zz_decode_down_NPC_OP_string = "imm26  ";
      NpcOp_regfile : _zz_decode_down_NPC_OP_string = "regfile";
      NpcOp_imm16 : _zz_decode_down_NPC_OP_string = "imm16  ";
      default : _zz_decode_down_NPC_OP_string = "???????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_execute_haltRequest_MyTopLevel_l271 = 1'b0;
    if(when_MyTopLevel_l258) begin
      if(when_MyTopLevel_l267) begin
        if(!memory_down_BYPASS_MEMORY_ENABLE) begin
          _zz_execute_haltRequest_MyTopLevel_l271 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_MyTopLevel_l264 = 1'b0;
    if(when_MyTopLevel_l258) begin
      if(when_MyTopLevel_l260) begin
        if(!memory_down_BYPASS_WRITE_ENABLE) begin
          _zz_execute_haltRequest_MyTopLevel_l264 = 1'b1;
        end
      end
    end
  end

  assign execute_down_REGFILE_VAL2 = execute_REGFILE_VAL2_bypass;
  always @(*) begin
    execute_REGFILE_VAL2_bypass = execute_up_REGFILE_VAL2;
    if(when_MyTopLevel_l258) begin
      if(when_MyTopLevel_l260) begin
        if(memory_down_BYPASS_WRITE_ENABLE) begin
          execute_REGFILE_VAL2_bypass = write_down_REGFILE_WRITE_DATA;
        end
      end
      if(when_MyTopLevel_l267) begin
        if(memory_down_BYPASS_MEMORY_ENABLE) begin
          execute_REGFILE_VAL2_bypass = memory_down_REGFILE_WRITE_DATA;
        end
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_MyTopLevel_l254 = 1'b0;
    if(when_MyTopLevel_l241) begin
      if(when_MyTopLevel_l250) begin
        if(!memory_down_BYPASS_MEMORY_ENABLE) begin
          _zz_execute_haltRequest_MyTopLevel_l254 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_MyTopLevel_l247 = 1'b0;
    if(when_MyTopLevel_l241) begin
      if(when_MyTopLevel_l243) begin
        if(!memory_down_BYPASS_WRITE_ENABLE) begin
          _zz_execute_haltRequest_MyTopLevel_l247 = 1'b1;
        end
      end
    end
  end

  assign execute_down_REGFILE_VAL1 = execute_REGFILE_VAL1_bypass;
  always @(*) begin
    execute_REGFILE_VAL1_bypass = execute_up_REGFILE_VAL1;
    if(when_MyTopLevel_l241) begin
      if(when_MyTopLevel_l243) begin
        if(memory_down_BYPASS_WRITE_ENABLE) begin
          execute_REGFILE_VAL1_bypass = write_down_REGFILE_WRITE_DATA;
        end
      end
      if(when_MyTopLevel_l250) begin
        if(memory_down_BYPASS_MEMORY_ENABLE) begin
          execute_REGFILE_VAL1_bypass = memory_down_REGFILE_WRITE_DATA;
        end
      end
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_MyTopLevel_l234) begin
      _zz_1 = 1'b1;
    end
  end

  assign execute_down_REGFILE_WRITE_DATA = execute_REGFILE_WRITE_DATA_bypass;
  always @(*) begin
    execute_REGFILE_WRITE_DATA_bypass = execute_up_REGFILE_WRITE_DATA;
    if(when_MyTopLevel_l227) begin
      execute_REGFILE_WRITE_DATA_bypass = execute_down_ALU_OUT;
    end
  end

  assign decode_down_REGFILE_WRITE_DATA = decode_REGFILE_WRITE_DATA_bypass;
  always @(*) begin
    decode_REGFILE_WRITE_DATA_bypass = decode_up_REGFILE_WRITE_DATA;
    if(when_MyTopLevel_l190) begin
      decode_REGFILE_WRITE_DATA_bypass = {decode_down_INSTRUCTION[15 : 0],16'h0000};
    end
    if(when_MyTopLevel_l209) begin
      decode_REGFILE_WRITE_DATA_bypass = _zz_decode_REGFILE_WRITE_DATA_bypass;
    end
  end

  assign fetch_down_PC = fetcher_pc;
  assign _zz_fetch_down_INSTRUCTION = fetch_down_PC[16 : 2];
  assign fetch_down_INSTRUCTION = _zz_fetcher_icache_port0;
  assign decoder_IS_NOP = ((decode_down_INSTRUCTION & 32'hffffffff) == 32'h00000000);
  assign decoder_IS_ADD = ((decode_down_INSTRUCTION & 32'hfc0007ff) == 32'h00000020);
  assign decoder_IS_ADDI = ((decode_down_INSTRUCTION & 32'hfc000000) == 32'h20000000);
  assign decoder_IS_ADDU = ((decode_down_INSTRUCTION & 32'hfc0007ff) == 32'h00000021);
  assign decoder_IS_ADDIU = ((decode_down_INSTRUCTION & 32'hfc000000) == 32'h24000000);
  assign decoder_IS_SUB = ((decode_down_INSTRUCTION & 32'hfc0007ff) == 32'h00000022);
  assign decoder_IS_SUBU = ((decode_down_INSTRUCTION & 32'hfc0007ff) == 32'h00000023);
  assign decoder_IS_SLT = ((decode_down_INSTRUCTION & 32'hfc0007ff) == 32'h0000002a);
  assign decoder_IS_SLTI = ((decode_down_INSTRUCTION & 32'hfc000000) == 32'h28000000);
  assign decoder_IS_SLTU = ((decode_down_INSTRUCTION & 32'hfc0007ff) == 32'h0000002b);
  assign decoder_IS_SLTIU = ((decode_down_INSTRUCTION & 32'hfc000000) == 32'h2c000000);
  assign decoder_IS_LUI = ((decode_down_INSTRUCTION & 32'hffe00000) == 32'h3c000000);
  assign decoder_IS_ORI = ((decode_down_INSTRUCTION & 32'hfc000000) == 32'h34000000);
  assign decoder_IS_BEQ = ((decode_down_INSTRUCTION & 32'hfc000000) == 32'h10000000);
  assign decoder_IS_J = ((decode_down_INSTRUCTION & 32'hfc000000) == 32'h08000000);
  assign decoder_IS_JAL = ((decode_down_INSTRUCTION & 32'hfc000000) == 32'h0c000000);
  assign decoder_IS_JR = ((decode_down_INSTRUCTION & 32'hfc1fffff) == 32'h00000008);
  always @(*) begin
    decode_down_INSTRUCTION_TYPE = InstructionType_r;
    if(!decoder_IS_ADD) begin
      if(decoder_IS_ADDI) begin
        decode_down_INSTRUCTION_TYPE = InstructionType_i;
      end else begin
        if(!decoder_IS_SUB) begin
          if(decoder_IS_ORI) begin
            decode_down_INSTRUCTION_TYPE = InstructionType_i;
          end else begin
            if(decoder_IS_LUI) begin
              decode_down_INSTRUCTION_TYPE = InstructionType_i;
            end else begin
              if(decoder_IS_J) begin
                decode_down_INSTRUCTION_TYPE = InstructionType_j;
              end else begin
                if(decoder_IS_JAL) begin
                  decode_down_INSTRUCTION_TYPE = InstructionType_j;
                end else begin
                  if(!decoder_IS_JR) begin
                    if(decoder_IS_BEQ) begin
                      decode_down_INSTRUCTION_TYPE = InstructionType_i;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  always @(*) begin
    decode_down_BYPASS_EXECUTE_ENABLE = 1'b0;
    if(!decoder_IS_ADD) begin
      if(!decoder_IS_ADDI) begin
        if(!decoder_IS_SUB) begin
          if(!decoder_IS_ORI) begin
            if(decoder_IS_LUI) begin
              decode_down_BYPASS_EXECUTE_ENABLE = 1'b1;
            end else begin
              if(!decoder_IS_J) begin
                if(decoder_IS_JAL) begin
                  decode_down_BYPASS_EXECUTE_ENABLE = 1'b1;
                end
              end
            end
          end
        end
      end
    end
  end

  always @(*) begin
    decode_down_BYPASS_MEMORY_ENABLE = 1'b0;
    if(decoder_IS_ADD) begin
      decode_down_BYPASS_MEMORY_ENABLE = 1'b1;
    end else begin
      if(decoder_IS_ADDI) begin
        decode_down_BYPASS_MEMORY_ENABLE = 1'b1;
      end else begin
        if(decoder_IS_SUB) begin
          decode_down_BYPASS_MEMORY_ENABLE = 1'b1;
        end else begin
          if(decoder_IS_ORI) begin
            decode_down_BYPASS_MEMORY_ENABLE = 1'b1;
          end else begin
            if(decoder_IS_LUI) begin
              decode_down_BYPASS_MEMORY_ENABLE = 1'b1;
            end else begin
              if(!decoder_IS_J) begin
                if(decoder_IS_JAL) begin
                  decode_down_BYPASS_MEMORY_ENABLE = 1'b1;
                end
              end
            end
          end
        end
      end
    end
  end

  assign decode_down_BYPASS_WRITE_ENABLE = 1'b1;
  always @(*) begin
    decode_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT = BypassRegfileWriteDataComponent_Alu;
    if(!decoder_IS_ADD) begin
      if(!decoder_IS_ADDI) begin
        if(!decoder_IS_SUB) begin
          if(!decoder_IS_ORI) begin
            if(decoder_IS_LUI) begin
              decode_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT = BypassRegfileWriteDataComponent_Luc;
            end else begin
              if(!decoder_IS_J) begin
                if(decoder_IS_JAL) begin
                  decode_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT = BypassRegfileWriteDataComponent_Npc;
                end
              end
            end
          end
        end
      end
    end
  end

  always @(*) begin
    decode_down_NPC_OP = NpcOp_pc4;
    if(!decoder_IS_ADD) begin
      if(!decoder_IS_ADDI) begin
        if(!decoder_IS_SUB) begin
          if(!decoder_IS_ORI) begin
            if(!decoder_IS_LUI) begin
              if(decoder_IS_J) begin
                decode_down_NPC_OP = NpcOp_imm26;
              end else begin
                if(decoder_IS_JAL) begin
                  decode_down_NPC_OP = NpcOp_imm26;
                end else begin
                  if(decoder_IS_JR) begin
                    decode_down_NPC_OP = NpcOp_regfile;
                  end else begin
                    if(decoder_IS_BEQ) begin
                      decode_down_NPC_OP = _zz_decode_down_NPC_OP;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  always @(*) begin
    decode_down_REGFILE_ADDR1 = decode_down_INSTRUCTION[25 : 21];
    if(!decoder_IS_ADD) begin
      if(!decoder_IS_ADDI) begin
        if(!decoder_IS_SUB) begin
          if(!decoder_IS_ORI) begin
            if(decoder_IS_LUI) begin
              decode_down_REGFILE_ADDR1 = 5'h00;
            end else begin
              if(decoder_IS_J) begin
                decode_down_REGFILE_ADDR1 = 5'h00;
              end else begin
                if(decoder_IS_JAL) begin
                  decode_down_REGFILE_ADDR1 = 5'h00;
                end
              end
            end
          end
        end
      end
    end
  end

  always @(*) begin
    decode_down_REGFILE_ADDR2 = decode_down_INSTRUCTION[20 : 16];
    if(!decoder_IS_ADD) begin
      if(decoder_IS_ADDI) begin
        decode_down_REGFILE_ADDR2 = 5'h00;
      end else begin
        if(!decoder_IS_SUB) begin
          if(decoder_IS_ORI) begin
            decode_down_REGFILE_ADDR2 = 5'h00;
          end else begin
            if(decoder_IS_LUI) begin
              decode_down_REGFILE_ADDR2 = 5'h00;
            end else begin
              if(decoder_IS_J) begin
                decode_down_REGFILE_ADDR2 = 5'h00;
              end else begin
                if(decoder_IS_JAL) begin
                  decode_down_REGFILE_ADDR2 = 5'h00;
                end else begin
                  if(decoder_IS_JR) begin
                    decode_down_REGFILE_ADDR2 = 5'h00;
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  always @(*) begin
    decode_down_ALU_OP = AluOp_add;
    if(!decoder_IS_ADD) begin
      if(!decoder_IS_ADDI) begin
        if(decoder_IS_SUB) begin
          decode_down_ALU_OP = AluOp_sub;
        end else begin
          if(decoder_IS_ORI) begin
            decode_down_ALU_OP = AluOp_or_1;
          end
        end
      end
    end
  end

  always @(*) begin
    decode_down_REGFILE_WRITE_ENABLE = 1'b0;
    if(decoder_IS_ADD) begin
      decode_down_REGFILE_WRITE_ENABLE = 1'b1;
    end else begin
      if(decoder_IS_ADDI) begin
        decode_down_REGFILE_WRITE_ENABLE = 1'b1;
      end else begin
        if(decoder_IS_SUB) begin
          decode_down_REGFILE_WRITE_ENABLE = 1'b1;
        end else begin
          if(decoder_IS_ORI) begin
            decode_down_REGFILE_WRITE_ENABLE = 1'b1;
          end else begin
            if(decoder_IS_LUI) begin
              decode_down_REGFILE_WRITE_ENABLE = 1'b1;
            end else begin
              if(!decoder_IS_J) begin
                if(decoder_IS_JAL) begin
                  decode_down_REGFILE_WRITE_ENABLE = 1'b1;
                end
              end
            end
          end
        end
      end
    end
  end

  always @(*) begin
    decode_down_REGFILE_WRITE_ADDR = ((decode_down_INSTRUCTION_TYPE == InstructionType_r) ? decode_down_INSTRUCTION[15 : 11] : decode_down_INSTRUCTION[20 : 16]);
    if(!decoder_IS_ADD) begin
      if(!decoder_IS_ADDI) begin
        if(!decoder_IS_SUB) begin
          if(!decoder_IS_ORI) begin
            if(!decoder_IS_LUI) begin
              if(!decoder_IS_J) begin
                if(decoder_IS_JAL) begin
                  decode_down_REGFILE_WRITE_ADDR = 5'h1f;
                end
              end
            end
          end
        end
      end
    end
  end

  assign decode_up_REGFILE_WRITE_DATA = 32'h00000000;
  assign _zz_decode_down_NPC_OP = (decode_down_REGFILE_VAL_EQUAL ? NpcOp_imm16 : NpcOp_pc4);
  assign decode_down_REGFILE_VAL1 = ((decode_down_REGFILE_ADDR1 != 5'h00) ? ((decode_down_REGFILE_ADDR1 == write_down_REGFILE_WRITE_ADDR) ? write_down_REGFILE_WRITE_DATA : _zz_regfile_regfile_port0) : 32'h00000000);
  assign decode_down_REGFILE_VAL2 = ((decode_down_REGFILE_ADDR2 != 5'h00) ? ((decode_down_REGFILE_ADDR2 == write_down_REGFILE_WRITE_ADDR) ? write_down_REGFILE_WRITE_DATA : _zz_regfile_regfile_port1) : 32'h00000000);
  assign decode_down_REGFILE_VAL_EQUAL = (decode_down_REGFILE_VAL1 == decode_down_REGFILE_VAL2);
  assign when_MyTopLevel_l190 = (decode_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT == BypassRegfileWriteDataComponent_Luc);
  assign when_MyTopLevel_l197 = (decode_down_NPC_OP == NpcOp_pc4);
  always @(*) begin
    if(when_MyTopLevel_l197) begin
      decode_down_NPC = (fetch_down_PC + 32'h00000004);
    end else begin
      if(when_MyTopLevel_l199) begin
        decode_down_NPC = {{decode_down_PC[31 : 28],decode_down_INSTRUCTION[25 : 0]},2'b00};
      end else begin
        if(when_MyTopLevel_l201) begin
          decode_down_NPC = decode_down_REGFILE_VAL1;
        end else begin
          if(when_MyTopLevel_l203) begin
            decode_down_NPC = (fetch_down_PC + _zz_decode_down_NPC);
          end else begin
            decode_down_NPC = (fetch_down_PC + 32'h00000004);
          end
        end
      end
    end
  end

  assign when_MyTopLevel_l199 = (decode_down_NPC_OP == NpcOp_imm26);
  assign when_MyTopLevel_l201 = (decode_down_NPC_OP == NpcOp_regfile);
  assign when_MyTopLevel_l203 = (decode_down_NPC_OP == NpcOp_imm16);
  assign when_MyTopLevel_l209 = (decode_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT == BypassRegfileWriteDataComponent_Npc);
  assign alu_in2 = ((execute_down_INSTRUCTION_TYPE == InstructionType_i) ? _zz_alu_in2 : execute_down_REGFILE_VAL2);
  assign when_MyTopLevel_l219 = (execute_down_ALU_OP == AluOp_add);
  always @(*) begin
    if(when_MyTopLevel_l219) begin
      execute_down_ALU_OUT = _zz_execute_down_ALU_OUT;
    end else begin
      if(when_MyTopLevel_l221) begin
        execute_down_ALU_OUT = _zz_execute_down_ALU_OUT_3;
      end else begin
        execute_down_ALU_OUT = _zz_execute_down_ALU_OUT_6;
      end
    end
  end

  assign when_MyTopLevel_l221 = (execute_down_ALU_OP == AluOp_sub);
  assign when_MyTopLevel_l227 = (execute_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT == BypassRegfileWriteDataComponent_Alu);
  assign when_MyTopLevel_l234 = (write_down_REGFILE_WRITE_ENABLE && (write_down_REGFILE_WRITE_ADDR != 5'h00));
  assign when_MyTopLevel_l241 = (execute_down_REGFILE_ADDR1 != 5'h00);
  assign when_MyTopLevel_l243 = (execute_down_REGFILE_ADDR1 == write_down_REGFILE_WRITE_ADDR);
  assign execute_haltRequest_MyTopLevel_l247 = _zz_execute_haltRequest_MyTopLevel_l247;
  assign when_MyTopLevel_l250 = (execute_down_REGFILE_ADDR1 == memory_down_REGFILE_WRITE_ADDR);
  assign execute_haltRequest_MyTopLevel_l254 = _zz_execute_haltRequest_MyTopLevel_l254;
  assign when_MyTopLevel_l258 = (execute_down_REGFILE_ADDR2 != 5'h00);
  assign when_MyTopLevel_l260 = (execute_down_REGFILE_ADDR2 == write_down_REGFILE_WRITE_ADDR);
  assign execute_haltRequest_MyTopLevel_l264 = _zz_execute_haltRequest_MyTopLevel_l264;
  assign when_MyTopLevel_l267 = (execute_down_REGFILE_ADDR2 == memory_down_REGFILE_WRITE_ADDR);
  assign execute_haltRequest_MyTopLevel_l271 = _zz_execute_haltRequest_MyTopLevel_l271;
  assign io_pc = write_down_PC;
  assign io_regfile_write_enable = write_down_REGFILE_WRITE_ENABLE;
  assign io_regfile_write_addr = write_down_REGFILE_WRITE_ADDR;
  assign io_regfile_write_data = write_down_REGFILE_WRITE_DATA;
  assign fetch_up_ready = fetch_down_isReady;
  assign decode_up_ready = decode_down_isReady;
  assign decode_down_PC = decode_up_PC;
  assign decode_down_INSTRUCTION = decode_up_INSTRUCTION;
  always @(*) begin
    execute_down_valid = execute_up_valid;
    if(when_CtrlLink_l151) begin
      execute_down_valid = 1'b0;
    end
  end

  always @(*) begin
    execute_up_ready = execute_down_isReady;
    if(when_CtrlLink_l151) begin
      execute_up_ready = 1'b0;
    end
  end

  assign when_CtrlLink_l151 = (|{execute_haltRequest_MyTopLevel_l271,{execute_haltRequest_MyTopLevel_l264,{execute_haltRequest_MyTopLevel_l254,execute_haltRequest_MyTopLevel_l247}}});
  assign execute_down_PC = execute_up_PC;
  assign execute_down_INSTRUCTION = execute_up_INSTRUCTION;
  assign execute_down_INSTRUCTION_TYPE = execute_up_INSTRUCTION_TYPE;
  assign execute_down_BYPASS_MEMORY_ENABLE = execute_up_BYPASS_MEMORY_ENABLE;
  assign execute_down_BYPASS_WRITE_ENABLE = execute_up_BYPASS_WRITE_ENABLE;
  assign execute_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT = execute_up_BYPASS_REGFILE_WRITE_DATA_COMPONENT;
  assign execute_down_REGFILE_ADDR1 = execute_up_REGFILE_ADDR1;
  assign execute_down_REGFILE_ADDR2 = execute_up_REGFILE_ADDR2;
  assign execute_down_ALU_OP = execute_up_ALU_OP;
  assign execute_down_REGFILE_WRITE_ENABLE = execute_up_REGFILE_WRITE_ENABLE;
  assign execute_down_REGFILE_WRITE_ADDR = execute_up_REGFILE_WRITE_ADDR;
  assign memory_down_valid = memory_up_valid;
  assign memory_down_PC = memory_up_PC;
  assign memory_down_REGFILE_WRITE_DATA = memory_up_REGFILE_WRITE_DATA;
  assign memory_down_BYPASS_MEMORY_ENABLE = memory_up_BYPASS_MEMORY_ENABLE;
  assign memory_down_BYPASS_WRITE_ENABLE = memory_up_BYPASS_WRITE_ENABLE;
  assign memory_down_REGFILE_WRITE_ENABLE = memory_up_REGFILE_WRITE_ENABLE;
  assign memory_down_REGFILE_WRITE_ADDR = memory_up_REGFILE_WRITE_ADDR;
  assign write_down_valid = write_up_valid;
  assign write_down_PC = write_up_PC;
  assign write_down_REGFILE_WRITE_DATA = write_up_REGFILE_WRITE_DATA;
  assign write_down_REGFILE_WRITE_ENABLE = write_up_REGFILE_WRITE_ENABLE;
  assign write_down_REGFILE_WRITE_ADDR = write_up_REGFILE_WRITE_ADDR;
  always @(*) begin
    fetch_down_ready = decode_up_ready;
    if(when_StageLink_l67) begin
      fetch_down_ready = 1'b1;
    end
  end

  assign when_StageLink_l67 = (! decode_up_isValid);
  always @(*) begin
    decode_down_ready = execute_up_ready;
    if(when_StageLink_l67_1) begin
      decode_down_ready = 1'b1;
    end
  end

  assign when_StageLink_l67_1 = (! execute_up_isValid);
  assign fetch_down_isReady = fetch_down_ready;
  assign decode_up_isValid = 1'b1;
  assign decode_down_isValid = 1'b1;
  assign decode_down_isReady = decode_down_ready;
  assign execute_up_isValid = execute_up_valid;
  assign execute_down_isValid = execute_down_valid;
  assign execute_down_isReady = 1'b1;
  assign memory_down_isValid = memory_down_valid;
  always @(posedge clk) begin
    if(reset) begin
      fetcher_pc <= 32'h00003000;
      execute_up_valid <= 1'b0;
      memory_up_valid <= 1'b0;
      write_up_valid <= 1'b0;
    end else begin
      fetcher_pc <= decode_down_NPC;
      if(decode_down_isReady) begin
        execute_up_valid <= decode_down_isValid;
      end
      memory_up_valid <= execute_down_isValid;
      write_up_valid <= memory_down_isValid;
    end
  end

  always @(posedge clk) begin
    if(fetch_down_isReady) begin
      decode_up_PC <= fetch_down_PC;
      decode_up_INSTRUCTION <= fetch_down_INSTRUCTION;
    end
    if(decode_down_isReady) begin
      execute_up_PC <= decode_down_PC;
      execute_up_INSTRUCTION <= decode_down_INSTRUCTION;
      execute_up_REGFILE_WRITE_DATA <= decode_down_REGFILE_WRITE_DATA;
      execute_up_INSTRUCTION_TYPE <= decode_down_INSTRUCTION_TYPE;
      execute_up_BYPASS_MEMORY_ENABLE <= decode_down_BYPASS_MEMORY_ENABLE;
      execute_up_BYPASS_WRITE_ENABLE <= decode_down_BYPASS_WRITE_ENABLE;
      execute_up_BYPASS_REGFILE_WRITE_DATA_COMPONENT <= decode_down_BYPASS_REGFILE_WRITE_DATA_COMPONENT;
      execute_up_REGFILE_ADDR1 <= decode_down_REGFILE_ADDR1;
      execute_up_REGFILE_ADDR2 <= decode_down_REGFILE_ADDR2;
      execute_up_ALU_OP <= decode_down_ALU_OP;
      execute_up_REGFILE_WRITE_ENABLE <= decode_down_REGFILE_WRITE_ENABLE;
      execute_up_REGFILE_WRITE_ADDR <= decode_down_REGFILE_WRITE_ADDR;
      execute_up_REGFILE_VAL1 <= decode_down_REGFILE_VAL1;
      execute_up_REGFILE_VAL2 <= decode_down_REGFILE_VAL2;
    end
    memory_up_PC <= execute_down_PC;
    memory_up_REGFILE_WRITE_DATA <= execute_down_REGFILE_WRITE_DATA;
    memory_up_BYPASS_MEMORY_ENABLE <= execute_down_BYPASS_MEMORY_ENABLE;
    memory_up_BYPASS_WRITE_ENABLE <= execute_down_BYPASS_WRITE_ENABLE;
    memory_up_REGFILE_WRITE_ENABLE <= execute_down_REGFILE_WRITE_ENABLE;
    memory_up_REGFILE_WRITE_ADDR <= execute_down_REGFILE_WRITE_ADDR;
    write_up_PC <= memory_down_PC;
    write_up_REGFILE_WRITE_DATA <= memory_down_REGFILE_WRITE_DATA;
    write_up_REGFILE_WRITE_ENABLE <= memory_down_REGFILE_WRITE_ENABLE;
    write_up_REGFILE_WRITE_ADDR <= memory_down_REGFILE_WRITE_ADDR;
  end


endmodule
