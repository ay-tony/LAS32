// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : MyTopLevel
// Git hash  : 3db916043b26737c76f749231b6fbca8617ee9df

`timescale 1ns/1ps

module MyTopLevel (
  input  wire          io_cond0,
  input  wire          io_cond1,
  output wire          io_flag,
  output wire [7:0]    io_state,
  input  wire          clk,
  input  wire          reset
);

  reg        [7:0]    counter;

  assign io_state = counter;
  assign io_flag = ((counter == 8'h00) || io_cond1);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      counter <= 8'h00;
    end else begin
      if(io_cond0) begin
        counter <= (counter + 8'h01);
      end
    end
  end


endmodule
