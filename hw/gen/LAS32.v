// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : LAS32
// Git hash  : 4c3d0d536fb4c94646ad0d203d68fe5f6b4ea02a

`timescale 1ns/1ps

module LAS32 (
  output wire [31:0]   _zz_24,
  output wire          _zz_25,
  output wire [4:0]    _zz_26,
  output wire [31:0]   _zz_27,
  input  wire          clk,
  input  wire          reset
);
  localparam AluSrc2_rk = 2'd0;
  localparam AluSrc2_si12 = 2'd1;
  localparam AluSrc2_si20 = 2'd2;
  localparam AluOp_add = 2'd0;
  localparam AluOp_sub = 2'd1;
  localparam AluOp_or_1 = 2'd2;
  localparam AluOp_src2 = 2'd3;

  wire       [31:0]   _zz__zz_22_port0;
  wire       [31:0]   _zz__zz_23_port1;
  wire       [31:0]   _zz__zz_23_port2;
  wire       [31:0]   _zz__zz_33;
  wire       [11:0]   _zz__zz_33_1;
  wire       [31:0]   _zz__zz_33_2;
  wire       [19:0]   _zz__zz_33_3;
  wire       [31:0]   _zz__zz_34;
  wire       [31:0]   _zz__zz_34_1;
  wire       [31:0]   _zz__zz_34_2;
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
  reg        [1:0]    _zz_8;
  reg        [4:0]    _zz_when_RegisterFile_l35_4;
  reg                 _zz_when_RegisterFile_l35_5;
  reg        [31:0]   _zz_9;
  reg        [31:0]   _zz_10;
  reg        [31:0]   _zz_when_Decoder_l40;
  reg        [31:0]   _zz_11;
  wire       [31:0]   _zz_12;
  wire       [1:0]    _zz_13;
  wire       [31:0]   _zz_14;
  wire       [1:0]    _zz_15;
  reg                 _zz_16;
  wire       [31:0]   _zz_17;
  wire                write_up_isValid;
  wire                write_up_isFiring;
  wire       [4:0]    _zz_when_RegisterFile_l35_6;
  wire                _zz_when_RegisterFile_l35_7;
  reg        [1:0]    _zz_18;
  reg        [1:0]    _zz_19;
  reg                 _zz_when_RegisterFile_l35_8;
  wire       [4:0]    _zz_20;
  wire       [4:0]    _zz_21;
  wire       [31:0]   _zz_when_Decoder_l40_1;
  wire       [31:0]   _zz_when_Decoder_l40_2;
  reg        [31:0]   _zz_when_Decoder_l40_3;
  wire       [14:0]   _zz_when_Decoder_l40_4;
  wire                when_Decoder_l40;
  wire                when_Decoder_l40_1;
  wire                when_Decoder_l40_2;
  wire                when_Decoder_l40_3;
  wire                when_RegisterFile_l35;
  wire       [31:0]   _zz_32;
  reg        [31:0]   _zz_33;
  reg        [31:0]   _zz_34;
  `ifndef SYNTHESIS
  reg [31:0] _zz_7_string;
  reg [31:0] _zz_8_string;
  reg [31:0] _zz_13_string;
  reg [31:0] _zz_15_string;
  reg [31:0] _zz_18_string;
  reg [31:0] _zz_19_string;
  `endif

  reg [31:0] _zz_22 [0:32767];
  (* ram_style = "distributed" *) reg [31:0] _zz_23 [0:31];

  assign _zz__zz_33_1 = _zz_14[21 : 10];
  assign _zz__zz_33 = {{20{_zz__zz_33_1[11]}}, _zz__zz_33_1};
  assign _zz__zz_33_3 = _zz_14[24 : 5];
  assign _zz__zz_33_2 = {{12{_zz__zz_33_3[19]}}, _zz__zz_33_3};
  assign _zz__zz_34 = (_zz_12 + _zz_32);
  assign _zz__zz_34_1 = (_zz_12 - _zz_32);
  assign _zz__zz_34_2 = _zz_32;
  assign _zz__zz_22_port0 = _zz_22[_zz_when_Decoder_l40_4];
  always @(posedge clk) begin
    if(_zz_16) begin
      _zz_23[_zz_when_RegisterFile_l35_6] <= _zz_17;
    end
  end

  assign _zz__zz_23_port1 = _zz_23[_zz_21];
  assign _zz__zz_23_port2 = _zz_23[_zz_20];
  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_7)
      AluSrc2_rk : _zz_7_string = "rk  ";
      AluSrc2_si12 : _zz_7_string = "si12";
      AluSrc2_si20 : _zz_7_string = "si20";
      default : _zz_7_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_8)
      AluOp_add : _zz_8_string = "add ";
      AluOp_sub : _zz_8_string = "sub ";
      AluOp_or_1 : _zz_8_string = "or_1";
      AluOp_src2 : _zz_8_string = "src2";
      default : _zz_8_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_13)
      AluOp_add : _zz_13_string = "add ";
      AluOp_sub : _zz_13_string = "sub ";
      AluOp_or_1 : _zz_13_string = "or_1";
      AluOp_src2 : _zz_13_string = "src2";
      default : _zz_13_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_15)
      AluSrc2_rk : _zz_15_string = "rk  ";
      AluSrc2_si12 : _zz_15_string = "si12";
      AluSrc2_si20 : _zz_15_string = "si20";
      default : _zz_15_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_18)
      AluSrc2_rk : _zz_18_string = "rk  ";
      AluSrc2_si12 : _zz_18_string = "si12";
      AluSrc2_si20 : _zz_18_string = "si20";
      default : _zz_18_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_19)
      AluOp_add : _zz_19_string = "add ";
      AluOp_sub : _zz_19_string = "sub ";
      AluOp_or_1 : _zz_19_string = "or_1";
      AluOp_src2 : _zz_19_string = "src2";
      default : _zz_19_string = "????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_16 = 1'b0;
    if(when_RegisterFile_l35) begin
      _zz_16 = 1'b1;
    end
  end

  assign _zz_when_Decoder_l40_2 = _zz_when_Decoder_l40_3;
  assign _zz_when_Decoder_l40_4 = _zz_when_Decoder_l40_2[16 : 2];
  assign _zz_21 = _zz_when_Decoder_l40_1[9 : 5];
  assign _zz_20 = _zz_when_Decoder_l40_1[14 : 10];
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
    if(when_Decoder_l40_3) begin
      _zz_when_RegisterFile_l35_8 = 1'b1;
    end
  end

  always @(*) begin
    _zz_19 = AluOp_add;
    if(when_Decoder_l40_1) begin
      _zz_19 = AluOp_sub;
    end
    if(when_Decoder_l40_3) begin
      _zz_19 = AluOp_src2;
    end
  end

  always @(*) begin
    _zz_18 = AluSrc2_rk;
    if(when_Decoder_l40_2) begin
      _zz_18 = AluSrc2_si12;
    end
    if(when_Decoder_l40_3) begin
      _zz_18 = AluSrc2_si20;
    end
  end

  assign when_Decoder_l40 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00100000);
  assign when_Decoder_l40_1 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00110000);
  assign when_Decoder_l40_2 = ((_zz_when_Decoder_l40_1 & 32'hffc00000) == 32'h02800000);
  assign when_Decoder_l40_3 = ((_zz_when_Decoder_l40_1 & 32'hfe000000) == 32'h14000000);
  assign when_RegisterFile_l35 = (((_zz_when_RegisterFile_l35_7 && (_zz_when_RegisterFile_l35_6 != 5'h00)) && write_up_isFiring) && write_up_isValid);
  always @(*) begin
    case(_zz_15)
      AluSrc2_rk : begin
        _zz_33 = _zz_5;
      end
      AluSrc2_si12 : begin
        _zz_33 = _zz__zz_33;
      end
      default : begin
        _zz_33 = _zz__zz_33_2;
      end
    endcase
  end

  assign _zz_32 = _zz_33;
  always @(*) begin
    case(_zz_13)
      AluOp_add : begin
        _zz_34 = _zz__zz_34;
      end
      AluOp_sub : begin
        _zz_34 = _zz__zz_34_1;
      end
      AluOp_src2 : begin
        _zz_34 = _zz__zz_34_2;
      end
      default : begin
        _zz_34 = 32'h00000000;
      end
    endcase
  end

  assign _zz_24 = _zz_2;
  assign _zz_25 = _zz_when_RegisterFile_l35_7;
  assign _zz_26 = _zz_when_RegisterFile_l35_6;
  assign _zz_27 = _zz_17;
  assign _zz_when_Decoder_l40_1 = _zz_when_Decoder_l40;
  assign _zz_14 = _zz_9;
  assign _zz_13 = _zz_8;
  assign _zz_15 = _zz_7;
  assign _zz_12 = _zz_6;
  assign _zz_when_RegisterFile_l35_7 = _zz_when_RegisterFile_l35_1;
  assign _zz_when_RegisterFile_l35_6 = _zz_when_RegisterFile_l35;
  assign _zz_17 = _zz_1;
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
    _zz_when_Decoder_l40 <= _zz__zz_22_port0;
    _zz_10 <= _zz_11;
    _zz_9 <= _zz_when_Decoder_l40_1;
    _zz_when_RegisterFile_l35_5 <= _zz_when_RegisterFile_l35_8;
    _zz_when_RegisterFile_l35_4 <= _zz_when_Decoder_l40_1[4 : 0];
    _zz_8 <= _zz_19;
    _zz_7 <= _zz_18;
    _zz_6 <= ((_zz_21 != 5'h00) ? ((_zz_21 == _zz_when_RegisterFile_l35_6) ? _zz_17 : _zz__zz_23_port1) : 32'h00000000);
    _zz_5 <= ((_zz_20 != 5'h00) ? ((_zz_20 == _zz_when_RegisterFile_l35_6) ? _zz_17 : _zz__zz_23_port2) : 32'h00000000);
    _zz_4 <= _zz_10;
    _zz_when_RegisterFile_l35_3 <= _zz_when_RegisterFile_l35_5;
    _zz_when_RegisterFile_l35_2 <= _zz_when_RegisterFile_l35_4;
    _zz_3 <= _zz_34;
    _zz_2 <= _zz_4;
    _zz_when_RegisterFile_l35_1 <= _zz_when_RegisterFile_l35_3;
    _zz_when_RegisterFile_l35 <= _zz_when_RegisterFile_l35_2;
    _zz_1 <= _zz_3;
  end


endmodule
