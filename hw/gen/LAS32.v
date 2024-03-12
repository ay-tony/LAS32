// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : LAS32
// Git hash  : 437890ce5c3115b1982c7bbf83e17dd5ac5b017a

`timescale 1ns/1ps

module LAS32 (
  output wire [31:0]   _zz_33,
  output wire          _zz_34,
  output wire [4:0]    _zz_35,
  output wire [31:0]   _zz_36,
  input  wire          clk,
  input  wire          reset
);
  localparam AluSrc2_rk = 1'd0;
  localparam AluSrc2_luc = 1'd1;
  localparam AluSrc1_rj = 1'd0;
  localparam AluSrc1_pc = 1'd1;
  localparam AluOp_add = 2'd0;
  localparam AluOp_sub = 2'd1;
  localparam AluOp_slt = 2'd2;
  localparam AluOp_sltu = 2'd3;
  localparam LucOp_si12 = 2'd0;
  localparam LucOp_si20 = 2'd1;
  localparam LucOp_u12i = 2'd2;

  wire       [31:0]   _zz__zz_31_port0;
  wire       [31:0]   _zz__zz_32_port1;
  wire       [31:0]   _zz__zz_32_port2;
  wire       [31:0]   _zz__zz_41;
  wire       [11:0]   _zz__zz_41_1;
  wire       [31:0]   _zz__zz_41_2;
  wire       [19:0]   _zz__zz_41_3;
  wire       [31:0]   _zz__zz_46;
  wire       [31:0]   _zz__zz_46_1;
  wire       [31:0]   _zz__zz_46_2;
  wire       [31:0]   _zz__zz_46_3;
  wire                write_up_isReady;
  reg        [4:0]    _zz_when_RegisterFile_l36;
  reg                 _zz_when_RegisterFile_l36_1;
  reg        [31:0]   _zz_1;
  reg        [31:0]   _zz_2;
  reg        [4:0]    _zz_when_RegisterFile_l36_2;
  reg                 _zz_when_RegisterFile_l36_3;
  reg        [31:0]   _zz_3;
  reg        [31:0]   _zz_4;
  reg        [31:0]   _zz_5;
  reg        [31:0]   _zz_6;
  reg        [31:0]   _zz_7;
  reg                 _zz_8;
  reg        [0:0]    _zz_9;
  reg        [0:0]    _zz_10;
  reg        [1:0]    _zz_11;
  reg        [4:0]    _zz_when_RegisterFile_l36_4;
  reg                 _zz_when_RegisterFile_l36_5;
  reg        [31:0]   _zz_12;
  reg        [31:0]   _zz_when_Decoder_l40;
  reg        [31:0]   _zz_13;
  reg        [31:0]   _zz_14;
  reg        [31:0]   _zz_15;
  wire       [1:0]    _zz_16;
  wire       [0:0]    _zz_17;
  wire       [31:0]   _zz_18;
  wire       [0:0]    _zz_19;
  reg        [31:0]   _zz_20;
  wire       [31:0]   _zz_21;
  reg                 _zz_22;
  wire       [31:0]   _zz_23;
  wire                write_up_isValid;
  wire                write_up_isFiring;
  wire       [4:0]    _zz_when_RegisterFile_l36_6;
  wire                _zz_when_RegisterFile_l36_7;
  reg                 _zz_24;
  reg                 _zz_25;
  reg        [1:0]    _zz_26;
  reg        [0:0]    _zz_27;
  reg        [1:0]    _zz_28;
  reg                 _zz_when_RegisterFile_l36_8;
  wire       [4:0]    _zz_29;
  wire       [4:0]    _zz_30;
  wire       [31:0]   _zz_when_Decoder_l40_1;
  wire       [31:0]   _zz_when_Decoder_l40_2;
  reg        [31:0]   _zz_when_Decoder_l40_3;
  wire       [14:0]   _zz_when_Decoder_l40_4;
  wire                when_Decoder_l40;
  wire                when_Decoder_l40_1;
  wire                when_Decoder_l40_2;
  wire                when_Decoder_l40_3;
  wire                when_Decoder_l40_4;
  wire                when_Decoder_l40_5;
  wire                when_Decoder_l40_6;
  wire                when_Decoder_l40_7;
  wire                when_RegisterFile_l36;
  reg        [31:0]   _zz_41;
  wire       [31:0]   _zz_42;
  wire       [31:0]   _zz_43;
  reg        [31:0]   _zz_44;
  reg        [31:0]   _zz_45;
  reg        [31:0]   _zz_46;
  `ifndef SYNTHESIS
  reg [23:0] _zz_9_string;
  reg [15:0] _zz_10_string;
  reg [31:0] _zz_11_string;
  reg [31:0] _zz_16_string;
  reg [23:0] _zz_17_string;
  reg [15:0] _zz_19_string;
  reg [31:0] _zz_26_string;
  reg [23:0] _zz_27_string;
  reg [31:0] _zz_28_string;
  `endif

  reg [31:0] _zz_31 [0:32767];
  (* ram_style = "distributed" *) reg [31:0] _zz_32 [0:31];

  assign _zz__zz_41_1 = _zz_when_Decoder_l40_1[21 : 10];
  assign _zz__zz_41 = {{20{_zz__zz_41_1[11]}}, _zz__zz_41_1};
  assign _zz__zz_41_3 = _zz_when_Decoder_l40_1[24 : 5];
  assign _zz__zz_41_2 = {{12{_zz__zz_41_3[19]}}, _zz__zz_41_3};
  assign _zz__zz_46 = (_zz_42 + _zz_43);
  assign _zz__zz_46_1 = (_zz_42 - _zz_43);
  assign _zz__zz_46_2 = _zz_42;
  assign _zz__zz_46_3 = _zz_43;
  assign _zz__zz_31_port0 = _zz_31[_zz_when_Decoder_l40_4];
  always @(posedge clk) begin
    if(_zz_22) begin
      _zz_32[_zz_when_RegisterFile_l36_6] <= _zz_23;
    end
  end

  assign _zz__zz_32_port1 = _zz_32[_zz_30];
  assign _zz__zz_32_port2 = _zz_32[_zz_29];
  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_9)
      AluSrc2_rk : _zz_9_string = "rk ";
      AluSrc2_luc : _zz_9_string = "luc";
      default : _zz_9_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_10)
      AluSrc1_rj : _zz_10_string = "rj";
      AluSrc1_pc : _zz_10_string = "pc";
      default : _zz_10_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_11)
      AluOp_add : _zz_11_string = "add ";
      AluOp_sub : _zz_11_string = "sub ";
      AluOp_slt : _zz_11_string = "slt ";
      AluOp_sltu : _zz_11_string = "sltu";
      default : _zz_11_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_16)
      AluOp_add : _zz_16_string = "add ";
      AluOp_sub : _zz_16_string = "sub ";
      AluOp_slt : _zz_16_string = "slt ";
      AluOp_sltu : _zz_16_string = "sltu";
      default : _zz_16_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_17)
      AluSrc2_rk : _zz_17_string = "rk ";
      AluSrc2_luc : _zz_17_string = "luc";
      default : _zz_17_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_19)
      AluSrc1_rj : _zz_19_string = "rj";
      AluSrc1_pc : _zz_19_string = "pc";
      default : _zz_19_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_26)
      LucOp_si12 : _zz_26_string = "si12";
      LucOp_si20 : _zz_26_string = "si20";
      LucOp_u12i : _zz_26_string = "u12i";
      default : _zz_26_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_27)
      AluSrc2_rk : _zz_27_string = "rk ";
      AluSrc2_luc : _zz_27_string = "luc";
      default : _zz_27_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_28)
      AluOp_add : _zz_28_string = "add ";
      AluOp_sub : _zz_28_string = "sub ";
      AluOp_slt : _zz_28_string = "slt ";
      AluOp_sltu : _zz_28_string = "sltu";
      default : _zz_28_string = "????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_15 = _zz_14;
    if(_zz_8) begin
      _zz_15 = _zz_46;
    end
  end

  always @(*) begin
    _zz_20 = 32'h00000000;
    if(_zz_25) begin
      _zz_20 = _zz_21;
    end
  end

  always @(*) begin
    _zz_22 = 1'b0;
    if(when_RegisterFile_l36) begin
      _zz_22 = 1'b1;
    end
  end

  assign _zz_when_Decoder_l40_2 = _zz_when_Decoder_l40_3;
  assign _zz_when_Decoder_l40_4 = _zz_when_Decoder_l40_2[16 : 2];
  assign _zz_30 = _zz_when_Decoder_l40_1[9 : 5];
  assign _zz_29 = _zz_when_Decoder_l40_1[14 : 10];
  always @(*) begin
    _zz_when_RegisterFile_l36_8 = 1'b0;
    if(when_Decoder_l40) begin
      _zz_when_RegisterFile_l36_8 = 1'b1;
    end
    if(when_Decoder_l40_1) begin
      _zz_when_RegisterFile_l36_8 = 1'b1;
    end
    if(when_Decoder_l40_2) begin
      _zz_when_RegisterFile_l36_8 = 1'b1;
    end
    if(when_Decoder_l40_3) begin
      _zz_when_RegisterFile_l36_8 = 1'b1;
    end
    if(when_Decoder_l40_4) begin
      _zz_when_RegisterFile_l36_8 = 1'b1;
    end
    if(when_Decoder_l40_5) begin
      _zz_when_RegisterFile_l36_8 = 1'b1;
    end
    if(when_Decoder_l40_6) begin
      _zz_when_RegisterFile_l36_8 = 1'b1;
    end
    if(when_Decoder_l40_7) begin
      _zz_when_RegisterFile_l36_8 = 1'b1;
    end
  end

  always @(*) begin
    _zz_28 = AluOp_add;
    if(when_Decoder_l40_1) begin
      _zz_28 = AluOp_sub;
    end
    if(when_Decoder_l40_4) begin
      _zz_28 = AluOp_slt;
    end
    if(when_Decoder_l40_5) begin
      _zz_28 = AluOp_sltu;
    end
    if(when_Decoder_l40_6) begin
      _zz_28 = AluOp_slt;
    end
    if(when_Decoder_l40_7) begin
      _zz_28 = AluOp_sltu;
    end
  end

  always @(*) begin
    _zz_27 = AluSrc2_rk;
    if(when_Decoder_l40_6) begin
      _zz_27 = AluSrc2_luc;
    end
    if(when_Decoder_l40_7) begin
      _zz_27 = AluSrc2_luc;
    end
  end

  always @(*) begin
    _zz_26 = LucOp_si12;
    if(when_Decoder_l40_2) begin
      _zz_26 = LucOp_si12;
    end
    if(when_Decoder_l40_3) begin
      _zz_26 = LucOp_u12i;
    end
    if(when_Decoder_l40_6) begin
      _zz_26 = LucOp_si12;
    end
    if(when_Decoder_l40_7) begin
      _zz_26 = LucOp_si20;
    end
  end

  always @(*) begin
    _zz_25 = 1'b0;
    if(when_Decoder_l40_3) begin
      _zz_25 = 1'b1;
    end
  end

  always @(*) begin
    _zz_24 = 1'b0;
    if(when_Decoder_l40) begin
      _zz_24 = 1'b1;
    end
    if(when_Decoder_l40_1) begin
      _zz_24 = 1'b1;
    end
    if(when_Decoder_l40_2) begin
      _zz_24 = 1'b1;
    end
    if(when_Decoder_l40_4) begin
      _zz_24 = 1'b1;
    end
    if(when_Decoder_l40_5) begin
      _zz_24 = 1'b1;
    end
    if(when_Decoder_l40_6) begin
      _zz_24 = 1'b1;
    end
    if(when_Decoder_l40_7) begin
      _zz_24 = 1'b1;
    end
  end

  assign when_Decoder_l40 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00100000);
  assign when_Decoder_l40_1 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00110000);
  assign when_Decoder_l40_2 = ((_zz_when_Decoder_l40_1 & 32'hffc00000) == 32'h02800000);
  assign when_Decoder_l40_3 = ((_zz_when_Decoder_l40_1 & 32'hfe000000) == 32'h14000000);
  assign when_Decoder_l40_4 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00120000);
  assign when_Decoder_l40_5 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00128000);
  assign when_Decoder_l40_6 = ((_zz_when_Decoder_l40_1 & 32'hffc00000) == 32'h02000000);
  assign when_Decoder_l40_7 = ((_zz_when_Decoder_l40_1 & 32'hffc00000) == 32'h02400000);
  assign when_RegisterFile_l36 = (((_zz_when_RegisterFile_l36_7 && (_zz_when_RegisterFile_l36_6 != 5'h00)) && write_up_isFiring) && write_up_isValid);
  always @(*) begin
    case(_zz_26)
      LucOp_si12 : begin
        _zz_41 = _zz__zz_41;
      end
      LucOp_si20 : begin
        _zz_41 = _zz__zz_41_2;
      end
      default : begin
        _zz_41 = {_zz_when_Decoder_l40_1[24 : 5],12'h000};
      end
    endcase
  end

  assign _zz_21 = _zz_41;
  always @(*) begin
    case(_zz_19)
      AluSrc1_rj : begin
        _zz_44 = _zz_7;
      end
      default : begin
        _zz_44 = _zz_18;
      end
    endcase
  end

  assign _zz_42 = _zz_44;
  always @(*) begin
    case(_zz_17)
      AluSrc2_rk : begin
        _zz_45 = _zz_6;
      end
      default : begin
        _zz_45 = _zz_5;
      end
    endcase
  end

  assign _zz_43 = _zz_45;
  always @(*) begin
    case(_zz_16)
      AluOp_add : begin
        _zz_46 = _zz__zz_46;
      end
      AluOp_sub : begin
        _zz_46 = _zz__zz_46_1;
      end
      AluOp_slt : begin
        _zz_46 = (($signed(_zz__zz_46_2) < $signed(_zz__zz_46_3)) ? 32'h00000001 : 32'h00000000);
      end
      default : begin
        _zz_46 = ((_zz_42 < _zz_43) ? 32'h00000001 : 32'h00000000);
      end
    endcase
  end

  assign _zz_33 = _zz_2;
  assign _zz_34 = _zz_when_RegisterFile_l36_7;
  assign _zz_35 = _zz_when_RegisterFile_l36_6;
  assign _zz_36 = _zz_23;
  assign _zz_when_Decoder_l40_1 = _zz_when_Decoder_l40;
  assign _zz_18 = _zz_12;
  assign _zz_16 = _zz_11;
  assign _zz_19 = _zz_10;
  assign _zz_17 = _zz_9;
  assign _zz_23 = _zz_1;
  assign _zz_when_RegisterFile_l36_7 = _zz_when_RegisterFile_l36_1;
  assign _zz_when_RegisterFile_l36_6 = _zz_when_RegisterFile_l36;
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
    _zz_13 <= _zz_when_Decoder_l40_2;
    _zz_when_Decoder_l40 <= _zz__zz_31_port0;
    _zz_12 <= _zz_13;
    _zz_14 <= _zz_20;
    _zz_when_RegisterFile_l36_5 <= _zz_when_RegisterFile_l36_8;
    _zz_when_RegisterFile_l36_4 <= _zz_when_Decoder_l40_1[4 : 0];
    _zz_11 <= _zz_28;
    _zz_10 <= AluSrc1_rj;
    _zz_9 <= _zz_27;
    _zz_8 <= _zz_24;
    _zz_7 <= ((_zz_30 != 5'h00) ? ((_zz_30 == _zz_when_RegisterFile_l36_6) ? _zz_23 : _zz__zz_32_port1) : 32'h00000000);
    _zz_6 <= ((_zz_29 != 5'h00) ? ((_zz_29 == _zz_when_RegisterFile_l36_6) ? _zz_23 : _zz__zz_32_port2) : 32'h00000000);
    _zz_5 <= _zz_21;
    _zz_4 <= _zz_18;
    _zz_3 <= _zz_15;
    _zz_when_RegisterFile_l36_3 <= _zz_when_RegisterFile_l36_5;
    _zz_when_RegisterFile_l36_2 <= _zz_when_RegisterFile_l36_4;
    _zz_2 <= _zz_4;
    _zz_1 <= _zz_3;
    _zz_when_RegisterFile_l36_1 <= _zz_when_RegisterFile_l36_3;
    _zz_when_RegisterFile_l36 <= _zz_when_RegisterFile_l36_2;
  end


endmodule
