// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : MyTopLevel
// Git hash  : 08f6a721986494cf647805f2c0b61a9bf663431e

`timescale 1ns/1ps

module MyTopLevel (
  output wire [31:0]   io_pc,
  input  wire          clk,
  input  wire          reset
);

  wire                fetch_up_isReady;
  wire                fetch_up_isValid;
  wire                memory_down_isValid;
  wire                execute_down_isValid;
  wire                decode_down_isValid;
  wire                fetch_down_isValid;
  reg        [31:0]   write_up_fetcher_PC;
  reg        [31:0]   memory_up_fetcher_PC;
  wire       [31:0]   memory_down_fetcher_PC;
  reg        [31:0]   execute_up_fetcher_PC;
  wire       [31:0]   execute_down_fetcher_PC;
  reg        [31:0]   decode_up_fetcher_PC;
  wire       [31:0]   decode_down_fetcher_PC;
  wire                write_down_valid;
  reg                 write_up_valid;
  wire                memory_down_valid;
  reg                 memory_up_valid;
  wire                execute_down_valid;
  reg                 execute_up_valid;
  wire                decode_down_valid;
  reg                 decode_up_valid;
  wire                fetch_down_valid;
  wire       [31:0]   write_down_fetcher_PC;
  wire       [31:0]   decode_down_fetcher_INSTRUCTION;
  wire       [31:0]   fetch_down_fetcher_PC;
  wire                fetch_up_isFiring;
  wire                fetch_up_valid;
  wire       [31:0]   fetch_up_fetcher_PC;
  reg        [31:0]   fetcher_pc;
  wire                decoder_IS_ADD;
  wire                decoder_IS_ADDI;

  assign fetch_up_fetcher_PC = fetcher_pc;
  assign fetch_up_valid = 1'b1;
  assign decoder_IS_ADD = ((decode_down_fetcher_INSTRUCTION & 32'hfc0007ff) == 32'h00000020);
  assign decoder_IS_ADDI = ((decode_down_fetcher_INSTRUCTION & 32'hfc000000) == 32'h20000000);
  assign io_pc = write_down_fetcher_PC;
  assign fetch_down_valid = fetch_up_valid;
  assign fetch_down_fetcher_PC = fetch_up_fetcher_PC;
  assign decode_down_valid = decode_up_valid;
  assign decode_down_fetcher_PC = decode_up_fetcher_PC;
  assign execute_down_valid = execute_up_valid;
  assign execute_down_fetcher_PC = execute_up_fetcher_PC;
  assign memory_down_valid = memory_up_valid;
  assign memory_down_fetcher_PC = memory_up_fetcher_PC;
  assign write_down_valid = write_up_valid;
  assign write_down_fetcher_PC = write_up_fetcher_PC;
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
        fetcher_pc <= (fetch_down_fetcher_PC + 32'h00000004);
      end
      decode_up_valid <= fetch_down_isValid;
      execute_up_valid <= decode_down_isValid;
      memory_up_valid <= execute_down_isValid;
      write_up_valid <= memory_down_isValid;
    end
  end

  always @(posedge clk) begin
    decode_up_fetcher_PC <= fetch_down_fetcher_PC;
    execute_up_fetcher_PC <= decode_down_fetcher_PC;
    memory_up_fetcher_PC <= execute_down_fetcher_PC;
    write_up_fetcher_PC <= memory_down_fetcher_PC;
  end


endmodule
