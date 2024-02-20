// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : MyTopLevel
// Git hash  : 3a9739065ed6e104f8518030f8a95931552dfd71

`timescale 1ns/1ps

module MyTopLevel (
  output wire [31:0]   io_pc,
  output wire          io_regfile_write_enable,
  output wire [4:0]    io_regfile_write_addr,
  output wire [31:0]   io_regfile_write_data,
  input  wire          clk,
  input  wire          reset
);
  localparam InstructionType_r = 2'd0;
  localparam InstructionType_i = 2'd1;
  localparam InstructionType_j = 2'd2;

  wire       [31:0]   _zz_fetcher_icache_port0;
  wire       [31:0]   _zz_regfile_regfile_port0;
  wire       [31:0]   _zz_regfile_regfile_port1;
  wire       [31:0]   _zz_execute_down_ALU_OUT;
  wire       [31:0]   _zz_alu_in2;
  wire       [15:0]   _zz_alu_in2_1;
  wire       [31:0]   _zz_execute_down_ALU_OUT_1;
  wire       [31:0]   _zz_execute_down_ALU_OUT_2;
  wire       [31:0]   _zz_execute_down_ALU_OUT_3;
  wire                fetch_up_isReady;
  wire                fetch_up_isValid;
  wire                memory_down_isValid;
  wire                execute_down_isValid;
  wire                decode_down_isValid;
  wire                fetch_down_isValid;
  reg        [31:0]   write_up_ALU_OUT;
  reg                 write_up_REGFILE_WRITE_ENABLE;
  reg        [31:0]   write_up_INSTRUCTION;
  reg        [31:0]   write_up_PC;
  reg        [31:0]   memory_up_ALU_OUT;
  wire       [31:0]   memory_down_ALU_OUT;
  reg                 memory_up_REGFILE_WRITE_ENABLE;
  wire                memory_down_REGFILE_WRITE_ENABLE;
  reg        [31:0]   memory_up_INSTRUCTION;
  wire       [31:0]   memory_down_INSTRUCTION;
  reg        [31:0]   memory_up_PC;
  wire       [31:0]   memory_down_PC;
  reg        [31:0]   execute_up_REG_VAL2;
  reg        [31:0]   execute_up_REG_VAL1;
  reg                 execute_up_REGFILE_WRITE_ENABLE;
  wire                execute_down_REGFILE_WRITE_ENABLE;
  reg        [1:0]    execute_up_INSTRUCTION_TYPE;
  reg        [31:0]   execute_up_INSTRUCTION;
  reg        [31:0]   execute_up_PC;
  wire       [31:0]   execute_down_PC;
  wire       [31:0]   decode_down_REG_VAL2;
  wire       [31:0]   decode_down_REG_VAL1;
  wire                decode_down_REGFILE_WRITE_ENABLE;
  wire       [1:0]    decode_down_INSTRUCTION_TYPE;
  reg        [31:0]   decode_up_INSTRUCTION;
  reg        [31:0]   decode_up_PC;
  wire       [31:0]   decode_down_PC;
  wire       [31:0]   fetch_down_INSTRUCTION;
  wire                write_down_valid;
  reg                 write_up_valid;
  wire                memory_down_valid;
  reg                 memory_up_valid;
  wire                execute_down_valid;
  reg                 execute_up_valid;
  wire                decode_down_valid;
  reg                 decode_up_valid;
  wire                fetch_down_valid;
  wire       [31:0]   write_down_PC;
  reg                 _zz_1;
  wire                write_down_REGFILE_WRITE_ENABLE;
  wire       [31:0]   write_down_ALU_OUT;
  wire       [31:0]   write_down_INSTRUCTION;
  wire       [31:0]   execute_down_INSTRUCTION;
  wire       [1:0]    execute_down_INSTRUCTION_TYPE;
  wire       [31:0]   execute_down_REG_VAL2;
  wire       [31:0]   execute_down_REG_VAL1;
  reg        [31:0]   execute_down_ALU_OUT;
  wire       [31:0]   decode_up_REG_VAL2;
  wire       [31:0]   decode_up_REG_VAL1;
  reg                 decode_up_REGFILE_WRITE_ENABLE;
  reg        [1:0]    decode_up_INSTRUCTION_TYPE;
  wire                decode_down_IS_ADDI;
  wire       [31:0]   decode_down_INSTRUCTION;
  wire                decode_down_IS_ADD;
  wire       [31:0]   fetch_up_INSTRUCTION;
  wire       [31:0]   fetch_down_PC;
  wire                fetch_up_isFiring;
  wire                fetch_up_valid;
  wire       [31:0]   fetch_up_PC;
  reg        [31:0]   fetcher_pc;
  wire       [14:0]   _zz_fetch_up_INSTRUCTION;
  wire       [4:0]    _zz_decode_up_REG_VAL1;
  wire       [4:0]    _zz_decode_up_REG_VAL2;
  wire       [31:0]   alu_in2;
  wire                when_MyTopLevel_l84;
  wire       [4:0]    write_regfile_addr;
  wire       [31:0]   write_regfile_value;
  `ifndef SYNTHESIS
  reg [7:0] execute_up_INSTRUCTION_TYPE_string;
  reg [7:0] decode_down_INSTRUCTION_TYPE_string;
  reg [7:0] execute_down_INSTRUCTION_TYPE_string;
  reg [7:0] decode_up_INSTRUCTION_TYPE_string;
  `endif

  reg [31:0] fetcher_icache [0:32767];
  (* ram_style = "distributed" *) reg [31:0] regfile_regfile [0:31];

  assign _zz_execute_down_ALU_OUT = (execute_down_REG_VAL1 + execute_down_REG_VAL2);
  assign _zz_alu_in2_1 = execute_down_INSTRUCTION[15 : 0];
  assign _zz_alu_in2 = {{16{_zz_alu_in2_1[15]}}, _zz_alu_in2_1};
  assign _zz_execute_down_ALU_OUT_1 = ($signed(_zz_execute_down_ALU_OUT_2) + $signed(_zz_execute_down_ALU_OUT_3));
  assign _zz_execute_down_ALU_OUT_2 = execute_down_REG_VAL1;
  assign _zz_execute_down_ALU_OUT_3 = alu_in2;
  assign _zz_fetcher_icache_port0 = fetcher_icache[_zz_fetch_up_INSTRUCTION];
  assign _zz_regfile_regfile_port0 = regfile_regfile[_zz_decode_up_REG_VAL1];
  assign _zz_regfile_regfile_port1 = regfile_regfile[_zz_decode_up_REG_VAL2];
  always @(posedge clk) begin
    if(_zz_1) begin
      regfile_regfile[write_regfile_addr] <= write_regfile_value;
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(execute_up_INSTRUCTION_TYPE)
      InstructionType_r : execute_up_INSTRUCTION_TYPE_string = "r";
      InstructionType_i : execute_up_INSTRUCTION_TYPE_string = "i";
      InstructionType_j : execute_up_INSTRUCTION_TYPE_string = "j";
      default : execute_up_INSTRUCTION_TYPE_string = "?";
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
    case(execute_down_INSTRUCTION_TYPE)
      InstructionType_r : execute_down_INSTRUCTION_TYPE_string = "r";
      InstructionType_i : execute_down_INSTRUCTION_TYPE_string = "i";
      InstructionType_j : execute_down_INSTRUCTION_TYPE_string = "j";
      default : execute_down_INSTRUCTION_TYPE_string = "?";
    endcase
  end
  always @(*) begin
    case(decode_up_INSTRUCTION_TYPE)
      InstructionType_r : decode_up_INSTRUCTION_TYPE_string = "r";
      InstructionType_i : decode_up_INSTRUCTION_TYPE_string = "i";
      InstructionType_j : decode_up_INSTRUCTION_TYPE_string = "j";
      default : decode_up_INSTRUCTION_TYPE_string = "?";
    endcase
  end
  `endif

  always @(*) begin
    _zz_1 = 1'b0;
    if(write_down_REGFILE_WRITE_ENABLE) begin
      _zz_1 = 1'b1;
    end
  end

  assign fetch_up_PC = fetcher_pc;
  assign fetch_up_valid = 1'b1;
  assign _zz_fetch_up_INSTRUCTION = fetch_down_PC[16 : 2];
  assign fetch_up_INSTRUCTION = _zz_fetcher_icache_port0;
  assign decode_down_IS_ADD = ((decode_down_INSTRUCTION & 32'hfc0007ff) == 32'h00000020);
  assign decode_down_IS_ADDI = ((decode_down_INSTRUCTION & 32'hfc000000) == 32'h20000000);
  always @(*) begin
    decode_up_INSTRUCTION_TYPE = InstructionType_r;
    if(!decode_down_IS_ADD) begin
      if(decode_down_IS_ADDI) begin
        decode_up_INSTRUCTION_TYPE = InstructionType_i;
      end
    end
  end

  always @(*) begin
    decode_up_REGFILE_WRITE_ENABLE = 1'b0;
    if(decode_down_IS_ADD) begin
      decode_up_REGFILE_WRITE_ENABLE = 1'b1;
    end else begin
      if(decode_down_IS_ADDI) begin
        decode_up_REGFILE_WRITE_ENABLE = 1'b1;
      end
    end
  end

  assign _zz_decode_up_REG_VAL1 = decode_down_INSTRUCTION[25 : 21];
  assign decode_up_REG_VAL1 = _zz_regfile_regfile_port0;
  assign _zz_decode_up_REG_VAL2 = decode_down_INSTRUCTION[20 : 16];
  assign decode_up_REG_VAL2 = _zz_regfile_regfile_port1;
  always @(*) begin
    execute_down_ALU_OUT = _zz_execute_down_ALU_OUT;
    if(when_MyTopLevel_l84) begin
      execute_down_ALU_OUT = _zz_execute_down_ALU_OUT_1;
    end
  end

  assign alu_in2 = ((execute_down_INSTRUCTION_TYPE == InstructionType_i) ? _zz_alu_in2 : execute_down_REG_VAL2);
  assign when_MyTopLevel_l84 = 1'b1;
  assign write_regfile_addr = write_down_INSTRUCTION[15 : 11];
  assign write_regfile_value = write_down_ALU_OUT;
  assign io_pc = write_down_PC;
  assign io_regfile_write_enable = write_down_REGFILE_WRITE_ENABLE;
  assign io_regfile_write_addr = write_regfile_addr;
  assign io_regfile_write_data = write_regfile_value;
  assign fetch_down_valid = fetch_up_valid;
  assign fetch_down_PC = fetch_up_PC;
  assign fetch_down_INSTRUCTION = fetch_up_INSTRUCTION;
  assign decode_down_valid = decode_up_valid;
  assign decode_down_PC = decode_up_PC;
  assign decode_down_INSTRUCTION = decode_up_INSTRUCTION;
  assign decode_down_INSTRUCTION_TYPE = decode_up_INSTRUCTION_TYPE;
  assign decode_down_REGFILE_WRITE_ENABLE = decode_up_REGFILE_WRITE_ENABLE;
  assign decode_down_REG_VAL1 = decode_up_REG_VAL1;
  assign decode_down_REG_VAL2 = decode_up_REG_VAL2;
  assign execute_down_valid = execute_up_valid;
  assign execute_down_PC = execute_up_PC;
  assign execute_down_INSTRUCTION = execute_up_INSTRUCTION;
  assign execute_down_INSTRUCTION_TYPE = execute_up_INSTRUCTION_TYPE;
  assign execute_down_REGFILE_WRITE_ENABLE = execute_up_REGFILE_WRITE_ENABLE;
  assign execute_down_REG_VAL1 = execute_up_REG_VAL1;
  assign execute_down_REG_VAL2 = execute_up_REG_VAL2;
  assign memory_down_valid = memory_up_valid;
  assign memory_down_PC = memory_up_PC;
  assign memory_down_INSTRUCTION = memory_up_INSTRUCTION;
  assign memory_down_REGFILE_WRITE_ENABLE = memory_up_REGFILE_WRITE_ENABLE;
  assign memory_down_ALU_OUT = memory_up_ALU_OUT;
  assign write_down_valid = write_up_valid;
  assign write_down_PC = write_up_PC;
  assign write_down_INSTRUCTION = write_up_INSTRUCTION;
  assign write_down_REGFILE_WRITE_ENABLE = write_up_REGFILE_WRITE_ENABLE;
  assign write_down_ALU_OUT = write_up_ALU_OUT;
  assign fetch_up_isFiring = (fetch_up_isValid && fetch_up_isReady);
  assign fetch_up_isValid = fetch_up_valid;
  assign fetch_up_isReady = 1'b1;
  assign fetch_down_isValid = fetch_down_valid;
  assign decode_down_isValid = decode_down_valid;
  assign execute_down_isValid = execute_down_valid;
  assign memory_down_isValid = memory_down_valid;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fetcher_pc <= 32'h00003000;
      decode_up_valid <= 1'b0;
      execute_up_valid <= 1'b0;
      memory_up_valid <= 1'b0;
      write_up_valid <= 1'b0;
    end else begin
      if(fetch_up_isFiring) begin
        fetcher_pc <= (fetch_down_PC + 32'h00000004);
      end
      decode_up_valid <= fetch_down_isValid;
      execute_up_valid <= decode_down_isValid;
      memory_up_valid <= execute_down_isValid;
      write_up_valid <= memory_down_isValid;
    end
  end

  always @(posedge clk) begin
    decode_up_PC <= fetch_down_PC;
    decode_up_INSTRUCTION <= fetch_down_INSTRUCTION;
    execute_up_PC <= decode_down_PC;
    execute_up_INSTRUCTION <= decode_down_INSTRUCTION;
    execute_up_INSTRUCTION_TYPE <= decode_down_INSTRUCTION_TYPE;
    execute_up_REGFILE_WRITE_ENABLE <= decode_down_REGFILE_WRITE_ENABLE;
    execute_up_REG_VAL1 <= decode_down_REG_VAL1;
    execute_up_REG_VAL2 <= decode_down_REG_VAL2;
    memory_up_PC <= execute_down_PC;
    memory_up_INSTRUCTION <= execute_down_INSTRUCTION;
    memory_up_REGFILE_WRITE_ENABLE <= execute_down_REGFILE_WRITE_ENABLE;
    memory_up_ALU_OUT <= execute_down_ALU_OUT;
    write_up_PC <= memory_down_PC;
    write_up_INSTRUCTION <= memory_down_INSTRUCTION;
    write_up_REGFILE_WRITE_ENABLE <= memory_down_REGFILE_WRITE_ENABLE;
    write_up_ALU_OUT <= memory_down_ALU_OUT;
  end


endmodule
