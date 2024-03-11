// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : LAS32
// Git hash  : 73fc1c201d718ba3a67ef6c06b15877cec21aed6

`timescale 1ns/1ps

module LAS32 (
  output wire [31:0]   _zz_17,
  output wire          _zz_18,
  output wire [4:0]    _zz_19,
  output wire [31:0]   _zz_20,
  input  wire          clk,
  input  wire          reset
);
  localparam AluOp_add = 2'd0;
  localparam AluOp_sub = 2'd1;
  localparam AluOp_or_1 = 2'd2;

  wire       [31:0]   _zz__zz_16_port0;
  wire       [31:0]   _zz__zz_22_port1;
  wire       [31:0]   _zz__zz_22_port2;
  wire       [31:0]   _zz__zz_26;
  wire                write_up_isReady;
  reg        [31:0]   _zz_1;
  reg        [4:0]    _zz_when_RegisterFile_l35;
  reg                 _zz_when_RegisterFile_l35_1;
  reg        [31:0]   _zz_2;
  reg        [31:0]   _zz_3;
  reg        [4:0]    _zz_when_RegisterFile_l35_2;
  reg                 _zz_when_RegisterFile_l35_3;
  reg        [31:0]   _zz_4;
  reg        [31:0]   _zz_5;
  reg        [31:0]   _zz_6;
  reg        [1:0]    _zz_7;
  reg        [4:0]    _zz_when_RegisterFile_l35_4;
  reg                 _zz_when_RegisterFile_l35_5;
  reg        [31:0]   _zz_8;
  reg        [31:0]   _zz_when_Decoder_l40;
  reg        [31:0]   _zz_9;
  wire       [1:0]    _zz_10;
  reg                 _zz_11;
  wire       [31:0]   _zz_12;
  wire                write_up_isValid;
  wire                write_up_isFiring;
  wire       [4:0]    _zz_when_RegisterFile_l35_6;
  wire                _zz_when_RegisterFile_l35_7;
  reg        [1:0]    _zz_13;
  reg                 _zz_when_RegisterFile_l35_8;
  wire       [4:0]    _zz_14;
  wire       [4:0]    _zz_15;
  wire       [31:0]   _zz_when_Decoder_l40_1;
  wire       [31:0]   _zz_when_Decoder_l40_2;
  reg        [31:0]   _zz_when_Decoder_l40_3;
  wire       [14:0]   _zz_when_Decoder_l40_4;
  wire                when_Decoder_l40;
  wire                when_RegisterFile_l35;
  reg        [31:0]   _zz_26;
  `ifndef SYNTHESIS
  reg [31:0] _zz_7_string;
  reg [31:0] _zz_10_string;
  reg [31:0] _zz_13_string;
  `endif

  reg [31:0] _zz_16 [0:32767];
  (* ram_style = "distributed" *) reg [31:0] _zz_22 [0:31];

  assign _zz__zz_26 = (_zz_6 + _zz_5);
  assign _zz__zz_16_port0 = _zz_16[_zz_when_Decoder_l40_4];
  always @(posedge clk) begin
    if(_zz_11) begin
      _zz_22[_zz_when_RegisterFile_l35_6] <= _zz_12;
    end
  end

  assign _zz__zz_22_port1 = _zz_22[_zz_15];
  assign _zz__zz_22_port2 = _zz_22[_zz_14];
  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_7)
      AluOp_add : _zz_7_string = "add ";
      AluOp_sub : _zz_7_string = "sub ";
      AluOp_or_1 : _zz_7_string = "or_1";
      default : _zz_7_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_10)
      AluOp_add : _zz_10_string = "add ";
      AluOp_sub : _zz_10_string = "sub ";
      AluOp_or_1 : _zz_10_string = "or_1";
      default : _zz_10_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_13)
      AluOp_add : _zz_13_string = "add ";
      AluOp_sub : _zz_13_string = "sub ";
      AluOp_or_1 : _zz_13_string = "or_1";
      default : _zz_13_string = "????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_11 = 1'b0;
    if(when_RegisterFile_l35) begin
      _zz_11 = 1'b1;
    end
  end

  assign _zz_when_Decoder_l40_2 = _zz_when_Decoder_l40_3;
  assign _zz_when_Decoder_l40_4 = _zz_when_Decoder_l40_2[16 : 2];
  assign _zz_15 = _zz_when_Decoder_l40_1[9 : 5];
  assign _zz_14 = _zz_when_Decoder_l40_1[14 : 10];
  always @(*) begin
    _zz_when_RegisterFile_l35_8 = 1'b0;
    if(when_Decoder_l40) begin
      _zz_when_RegisterFile_l35_8 = 1'b1;
    end
  end

  always @(*) begin
    _zz_13 = AluOp_add;
    if(when_Decoder_l40) begin
      _zz_13 = AluOp_add;
    end
  end

  assign when_Decoder_l40 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00100000);
  assign when_RegisterFile_l35 = (((_zz_when_RegisterFile_l35_7 && (_zz_when_RegisterFile_l35_6 != 5'h00)) && write_up_isFiring) && write_up_isValid);
  always @(*) begin
    case(_zz_10)
      AluOp_add : begin
        _zz_26 = _zz__zz_26;
      end
      default : begin
        _zz_26 = 32'h00000000;
      end
    endcase
  end

  assign _zz_17 = _zz_2;
  assign _zz_18 = _zz_when_RegisterFile_l35_7;
  assign _zz_19 = _zz_when_RegisterFile_l35_6;
  assign _zz_20 = _zz_12;
  assign _zz_when_Decoder_l40_1 = _zz_when_Decoder_l40;
  assign _zz_10 = _zz_7;
  assign _zz_when_RegisterFile_l35_7 = _zz_when_RegisterFile_l35_1;
  assign _zz_when_RegisterFile_l35_6 = _zz_when_RegisterFile_l35;
  assign _zz_12 = _zz_1;
  assign write_up_isFiring = (write_up_isValid && write_up_isReady);
  assign write_up_isValid = 1'b1;
  assign write_up_isReady = 1'b1;
  always @(posedge clk) begin
    if(reset) begin
      _zz_when_Decoder_l40_3 <= 32'h00003000;
    end else begin
      _zz_when_Decoder_l40_3 <= (_zz_when_Decoder_l40_3 + 32'h00000004);
    end
  end

  always @(posedge clk) begin
    _zz_9 <= _zz_when_Decoder_l40_2;
    _zz_when_Decoder_l40 <= _zz__zz_16_port0;
    _zz_8 <= _zz_9;
    _zz_when_RegisterFile_l35_5 <= _zz_when_RegisterFile_l35_8;
    _zz_when_RegisterFile_l35_4 <= _zz_when_Decoder_l40_1[4 : 0];
    _zz_7 <= _zz_13;
    _zz_6 <= ((_zz_15 != 5'h00) ? ((_zz_15 == _zz_when_RegisterFile_l35_6) ? _zz_12 : _zz__zz_22_port1) : 32'h00000000);
    _zz_5 <= ((_zz_14 != 5'h00) ? ((_zz_14 == _zz_when_RegisterFile_l35_6) ? _zz_12 : _zz__zz_22_port2) : 32'h00000000);
    _zz_4 <= _zz_8;
    _zz_when_RegisterFile_l35_3 <= _zz_when_RegisterFile_l35_5;
    _zz_when_RegisterFile_l35_2 <= _zz_when_RegisterFile_l35_4;
    _zz_3 <= _zz_26;
    _zz_2 <= _zz_4;
    _zz_when_RegisterFile_l35_1 <= _zz_when_RegisterFile_l35_3;
    _zz_when_RegisterFile_l35 <= _zz_when_RegisterFile_l35_2;
    _zz_1 <= _zz_3;
  end


endmodule
