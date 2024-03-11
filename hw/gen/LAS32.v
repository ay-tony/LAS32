// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : LAS32
// Git hash  : 40246750b83a96f75e66de75ab5f0f0dbbf04e20

`timescale 1ns/1ps

module LAS32 (
  output wire [31:0]   _zz_23,
  output wire          _zz_24,
  output wire [4:0]    _zz_25,
  output wire [31:0]   _zz_26,
  input  wire          clk,
  input  wire          reset
);
  localparam AluSrc2_rk = 1'd0;
  localparam AluSrc2_si12 = 1'd1;
  localparam AluOp_add = 2'd0;
  localparam AluOp_sub = 2'd1;
  localparam AluOp_or_1 = 2'd2;

  wire       [31:0]   _zz__zz_21_port0;
  wire       [31:0]   _zz__zz_22_port1;
  wire       [31:0]   _zz__zz_22_port2;
  wire       [31:0]   _zz__zz_32;
  wire       [11:0]   _zz__zz_32_1;
  wire       [31:0]   _zz__zz_33;
  wire       [31:0]   _zz__zz_33_1;
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
  reg        [0:0]    _zz_7;
  reg        [1:0]    _zz_8;
  reg        [4:0]    _zz_when_RegisterFile_l35_4;
  reg                 _zz_when_RegisterFile_l35_5;
  reg        [31:0]   _zz_9;
  reg        [31:0]   _zz_10;
  reg        [31:0]   _zz_when_Decoder_l40;
  reg        [31:0]   _zz_11;
  wire       [31:0]   _zz_12;
  wire       [1:0]    _zz_13;
  wire       [0:0]    _zz_14;
  reg                 _zz_15;
  wire       [31:0]   _zz_16;
  wire                write_up_isValid;
  wire                write_up_isFiring;
  wire       [4:0]    _zz_when_RegisterFile_l35_6;
  wire                _zz_when_RegisterFile_l35_7;
  reg        [0:0]    _zz_17;
  reg        [1:0]    _zz_18;
  reg                 _zz_when_RegisterFile_l35_8;
  wire       [4:0]    _zz_19;
  wire       [4:0]    _zz_20;
  wire       [31:0]   _zz_when_Decoder_l40_1;
  wire       [31:0]   _zz_when_Decoder_l40_2;
  reg        [31:0]   _zz_when_Decoder_l40_3;
  wire       [14:0]   _zz_when_Decoder_l40_4;
  wire                when_Decoder_l40;
  wire                when_Decoder_l40_1;
  wire                when_Decoder_l40_2;
  wire                when_RegisterFile_l35;
  wire       [31:0]   _zz_31;
  reg        [31:0]   _zz_32;
  reg        [31:0]   _zz_33;
  `ifndef SYNTHESIS
  reg [31:0] _zz_7_string;
  reg [31:0] _zz_8_string;
  reg [31:0] _zz_13_string;
  reg [31:0] _zz_14_string;
  reg [31:0] _zz_17_string;
  reg [31:0] _zz_18_string;
  `endif

  reg [31:0] _zz_21 [0:32767];
  (* ram_style = "distributed" *) reg [31:0] _zz_22 [0:31];

  assign _zz__zz_32_1 = _zz_9[21 : 10];
  assign _zz__zz_32 = {{20{_zz__zz_32_1[11]}}, _zz__zz_32_1};
  assign _zz__zz_33 = (_zz_12 + _zz_31);
  assign _zz__zz_33_1 = (_zz_12 - _zz_31);
  assign _zz__zz_21_port0 = _zz_21[_zz_when_Decoder_l40_4];
  always @(posedge clk) begin
    if(_zz_15) begin
      _zz_22[_zz_when_RegisterFile_l35_6] <= _zz_16;
    end
  end

  assign _zz__zz_22_port1 = _zz_22[_zz_20];
  assign _zz__zz_22_port2 = _zz_22[_zz_19];
  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_7)
      AluSrc2_rk : _zz_7_string = "rk  ";
      AluSrc2_si12 : _zz_7_string = "si12";
      default : _zz_7_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_8)
      AluOp_add : _zz_8_string = "add ";
      AluOp_sub : _zz_8_string = "sub ";
      AluOp_or_1 : _zz_8_string = "or_1";
      default : _zz_8_string = "????";
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
  always @(*) begin
    case(_zz_14)
      AluSrc2_rk : _zz_14_string = "rk  ";
      AluSrc2_si12 : _zz_14_string = "si12";
      default : _zz_14_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_17)
      AluSrc2_rk : _zz_17_string = "rk  ";
      AluSrc2_si12 : _zz_17_string = "si12";
      default : _zz_17_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_18)
      AluOp_add : _zz_18_string = "add ";
      AluOp_sub : _zz_18_string = "sub ";
      AluOp_or_1 : _zz_18_string = "or_1";
      default : _zz_18_string = "????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_15 = 1'b0;
    if(when_RegisterFile_l35) begin
      _zz_15 = 1'b1;
    end
  end

  assign _zz_when_Decoder_l40_2 = _zz_when_Decoder_l40_3;
  assign _zz_when_Decoder_l40_4 = _zz_when_Decoder_l40_2[16 : 2];
  assign _zz_20 = _zz_when_Decoder_l40_1[9 : 5];
  assign _zz_19 = _zz_when_Decoder_l40_1[14 : 10];
  always @(*) begin
    _zz_when_RegisterFile_l35_8 = 1'b0;
    if(when_Decoder_l40) begin
      _zz_when_RegisterFile_l35_8 = 1'b1;
    end
    if(when_Decoder_l40_1) begin
      _zz_when_RegisterFile_l35_8 = 1'b1;
    end
    if(when_Decoder_l40_2) begin
      _zz_when_RegisterFile_l35_8 = 1'b1;
    end
  end

  always @(*) begin
    _zz_18 = AluOp_add;
    if(when_Decoder_l40) begin
      _zz_18 = AluOp_add;
    end
    if(when_Decoder_l40_1) begin
      _zz_18 = AluOp_sub;
    end
    if(when_Decoder_l40_2) begin
      _zz_18 = AluOp_add;
    end
  end

  always @(*) begin
    _zz_17 = AluSrc2_rk;
    if(when_Decoder_l40_2) begin
      _zz_17 = AluSrc2_si12;
    end
  end

  assign when_Decoder_l40 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00100000);
  assign when_Decoder_l40_1 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00110000);
  assign when_Decoder_l40_2 = ((_zz_when_Decoder_l40_1 & 32'hffc00000) == 32'h02800000);
  assign when_RegisterFile_l35 = (((_zz_when_RegisterFile_l35_7 && (_zz_when_RegisterFile_l35_6 != 5'h00)) && write_up_isFiring) && write_up_isValid);
  always @(*) begin
    case(_zz_14)
      AluSrc2_rk : begin
        _zz_32 = _zz_5;
      end
      default : begin
        _zz_32 = _zz__zz_32;
      end
    endcase
  end

  assign _zz_31 = _zz_32;
  always @(*) begin
    case(_zz_13)
      AluOp_add : begin
        _zz_33 = _zz__zz_33;
      end
      AluOp_sub : begin
        _zz_33 = _zz__zz_33_1;
      end
      default : begin
        _zz_33 = 32'h00000000;
      end
    endcase
  end

  assign _zz_23 = _zz_2;
  assign _zz_24 = _zz_when_RegisterFile_l35_7;
  assign _zz_25 = _zz_when_RegisterFile_l35_6;
  assign _zz_26 = _zz_16;
  assign _zz_when_Decoder_l40_1 = _zz_when_Decoder_l40;
  assign _zz_13 = _zz_8;
  assign _zz_14 = _zz_7;
  assign _zz_12 = _zz_6;
  assign _zz_when_RegisterFile_l35_7 = _zz_when_RegisterFile_l35_1;
  assign _zz_when_RegisterFile_l35_6 = _zz_when_RegisterFile_l35;
  assign _zz_16 = _zz_1;
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
    _zz_11 <= _zz_when_Decoder_l40_2;
    _zz_when_Decoder_l40 <= _zz__zz_21_port0;
    _zz_10 <= _zz_11;
    _zz_9 <= _zz_when_Decoder_l40_1;
    _zz_when_RegisterFile_l35_5 <= _zz_when_RegisterFile_l35_8;
    _zz_when_RegisterFile_l35_4 <= _zz_when_Decoder_l40_1[4 : 0];
    _zz_8 <= _zz_18;
    _zz_7 <= _zz_17;
    _zz_6 <= ((_zz_20 != 5'h00) ? ((_zz_20 == _zz_when_RegisterFile_l35_6) ? _zz_16 : _zz__zz_22_port1) : 32'h00000000);
    _zz_5 <= ((_zz_19 != 5'h00) ? ((_zz_19 == _zz_when_RegisterFile_l35_6) ? _zz_16 : _zz__zz_22_port2) : 32'h00000000);
    _zz_4 <= _zz_10;
    _zz_when_RegisterFile_l35_3 <= _zz_when_RegisterFile_l35_5;
    _zz_when_RegisterFile_l35_2 <= _zz_when_RegisterFile_l35_4;
    _zz_3 <= _zz_33;
    _zz_2 <= _zz_4;
    _zz_when_RegisterFile_l35_1 <= _zz_when_RegisterFile_l35_3;
    _zz_when_RegisterFile_l35 <= _zz_when_RegisterFile_l35_2;
    _zz_1 <= _zz_3;
  end


endmodule
