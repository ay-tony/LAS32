// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : LAS32
// Git hash  : dad6f90288568e3a2b4d30cc24b7a293109a4420

`timescale 1ns/1ps

module LAS32 (
  output wire [31:0]   _zz_39,
  output wire          _zz_40,
  output wire [4:0]    _zz_41,
  output wire [31:0]   _zz_42,
  input  wire          clk,
  input  wire          reset
);
  localparam AluSrc2_rk = 1'd0;
  localparam AluSrc2_luc = 1'd1;
  localparam AluSrc1_rj = 1'd0;
  localparam AluSrc1_pc = 1'd1;
  localparam AluOp_add = 3'd0;
  localparam AluOp_sub = 3'd1;
  localparam AluOp_slt = 3'd2;
  localparam AluOp_sltu = 3'd3;
  localparam AluOp_and_1 = 3'd4;
  localparam AluOp_or_1 = 3'd5;
  localparam AluOp_nor_1 = 3'd6;
  localparam AluOp_xor_1 = 3'd7;
  localparam LucOp_si12 = 2'd0;
  localparam LucOp_si20 = 2'd1;
  localparam LucOp_ui12 = 2'd2;

  wire       [31:0]   _zz__zz_37_port0;
  wire       [31:0]   _zz__zz_38_port1;
  wire       [31:0]   _zz__zz_38_port2;
  wire       [31:0]   _zz__zz_47;
  wire       [11:0]   _zz__zz_47_1;
  wire       [31:0]   _zz__zz_47_2;
  wire       [11:0]   _zz__zz_47_3;
  wire       [31:0]   _zz__zz_52;
  wire       [31:0]   _zz__zz_52_1;
  wire       [31:0]   _zz__zz_52_2;
  wire       [31:0]   _zz__zz_52_3;
  wire                write_up_isReady;
  wire                memory_down_isValid;
  wire                memory_up_isValid;
  wire                execute_down_isValid;
  wire                execute_up_isValid;
  wire                decode_down_isValid;
  wire                decode_up_isValid;
  reg        [4:0]    _zz_when_RegisterFile_l36;
  reg                 _zz_when_RegisterFile_l36_1;
  reg        [31:0]   _zz_1;
  reg        [31:0]   _zz_2;
  reg        [4:0]    _zz_when_Bypass_l28;
  reg                 _zz_when_RegisterFile_l36_2;
  reg        [4:0]    _zz_when_Bypass_l39;
  reg        [4:0]    _zz_when_Bypass_l28_1;
  reg                 _zz_3;
  reg        [31:0]   _zz_4;
  reg        [31:0]   _zz_5;
  wire                memory_down_isReady;
  reg        [31:0]   _zz_6;
  reg                 _zz_7;
  reg        [0:0]    _zz_8;
  reg        [0:0]    _zz_9;
  reg        [2:0]    _zz_10;
  reg        [4:0]    _zz_when_Bypass_l28_2;
  reg                 _zz_when_RegisterFile_l36_3;
  reg        [4:0]    _zz_when_Bypass_l39_1;
  reg        [4:0]    _zz_when_Bypass_l28_3;
  reg                 _zz_11;
  reg        [31:0]   _zz_12;
  wire                execute_down_isReady;
  reg                 execute_up_valid;
  reg        [31:0]   _zz_when_Decoder_l40;
  reg        [31:0]   _zz_13;
  wire                decode_down_isReady;
  wire                fetch_down_isReady;
  wire                write_down_valid;
  reg                 write_up_valid;
  reg                 memory_down_valid;
  reg                 memory_up_valid;
  reg                 execute_down_valid;
  wire                fetch_up_ready;
  reg                 fetch_down_ready;
  wire                decode_up_ready;
  reg                 decode_down_ready;
  reg                 execute_up_ready;
  reg                 execute_down_ready;
  reg                 memory_up_ready;
  reg        [31:0]   _zz_14;
  reg        [31:0]   _zz_15;
  wire       [2:0]    _zz_16;
  wire       [0:0]    _zz_17;
  wire       [31:0]   _zz_18;
  wire       [0:0]    _zz_19;
  reg        [31:0]   _zz_20;
  wire       [31:0]   _zz_21;
  reg                 _zz_memory_haltRequest_Bypass_l43;
  reg                 _zz_execute_haltRequest_Bypass_l43;
  reg                 _zz_execute_haltRequest_Bypass_l43_1;
  reg                 _zz_memory_haltRequest_Bypass_l43_1;
  reg                 _zz_execute_haltRequest_Bypass_l43_2;
  reg                 _zz_execute_haltRequest_Bypass_l43_3;
  reg                 _zz_memory_haltRequest_Bypass_l32;
  reg                 _zz_memory_haltRequest_Bypass_l43_2;
  wire       [4:0]    _zz_when_Bypass_l39_2;
  reg                 _zz_execute_haltRequest_Bypass_l43_4;
  reg                 _zz_execute_haltRequest_Bypass_l43_5;
  reg        [31:0]   _zz_22;
  reg        [31:0]   _zz_23;
  wire       [4:0]    _zz_when_Bypass_l39_3;
  reg                 _zz_execute_haltRequest_Bypass_l32;
  reg                 _zz_execute_haltRequest_Bypass_l32_1;
  wire       [31:0]   _zz_24;
  reg        [31:0]   _zz_25;
  reg        [31:0]   _zz_26;
  wire                _zz_when_RegisterFile_l36_4;
  wire       [4:0]    _zz_when_Bypass_l28_4;
  wire       [4:0]    _zz_when_Bypass_l28_5;
  wire                _zz_27;
  reg                 _zz_28;
  wire       [31:0]   _zz_29;
  wire                write_up_isValid;
  wire                write_up_isFiring;
  wire       [4:0]    _zz_when_RegisterFile_l36_5;
  wire                _zz_when_RegisterFile_l36_6;
  reg                 _zz_30;
  reg                 _zz_31;
  reg        [1:0]    _zz_32;
  reg        [0:0]    _zz_33;
  reg        [0:0]    _zz_34;
  reg        [2:0]    _zz_35;
  reg                 _zz_when_RegisterFile_l36_7;
  wire       [4:0]    _zz_when_Bypass_l39_4;
  wire       [4:0]    _zz_when_Bypass_l28_6;
  wire       [31:0]   _zz_when_Decoder_l40_1;
  reg                 _zz_36;
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
  wire                when_Decoder_l40_8;
  wire                when_Decoder_l40_9;
  wire                when_Decoder_l40_10;
  wire                when_Decoder_l40_11;
  wire                when_Decoder_l40_12;
  wire                when_Decoder_l40_13;
  wire                when_Decoder_l40_14;
  wire                when_Decoder_l40_15;
  wire                when_RegisterFile_l36;
  wire                when_Bypass_l28;
  wire                execute_haltRequest_Bypass_l32;
  wire                when_Bypass_l28_1;
  wire                execute_haltRequest_Bypass_l32_1;
  wire                when_Bypass_l39;
  wire                execute_haltRequest_Bypass_l43;
  wire                when_Bypass_l39_1;
  wire                execute_haltRequest_Bypass_l43_1;
  wire                when_Bypass_l39_2;
  wire                memory_haltRequest_Bypass_l43;
  wire                when_Bypass_l28_2;
  wire                memory_haltRequest_Bypass_l32;
  wire                when_Bypass_l39_3;
  wire                execute_haltRequest_Bypass_l43_2;
  wire                when_Bypass_l39_4;
  wire                execute_haltRequest_Bypass_l43_3;
  wire                when_Bypass_l39_5;
  wire                memory_haltRequest_Bypass_l43_1;
  wire                when_Bypass_l39_6;
  wire                execute_haltRequest_Bypass_l43_4;
  wire                when_Bypass_l39_7;
  wire                execute_haltRequest_Bypass_l43_5;
  wire                when_Bypass_l39_8;
  wire                memory_haltRequest_Bypass_l43_2;
  reg        [31:0]   _zz_47;
  wire       [31:0]   _zz_48;
  wire       [31:0]   _zz_49;
  reg        [31:0]   _zz_50;
  reg        [31:0]   _zz_51;
  reg        [31:0]   _zz_52;
  wire                when_CtrlLink_l151;
  wire                when_CtrlLink_l151_1;
  wire                when_StageLink_l67;
  wire                when_StageLink_l67_1;
  wire                when_StageLink_l67_2;
  `ifndef SYNTHESIS
  reg [23:0] _zz_8_string;
  reg [15:0] _zz_9_string;
  reg [39:0] _zz_10_string;
  reg [39:0] _zz_16_string;
  reg [23:0] _zz_17_string;
  reg [15:0] _zz_19_string;
  reg [31:0] _zz_32_string;
  reg [23:0] _zz_33_string;
  reg [15:0] _zz_34_string;
  reg [39:0] _zz_35_string;
  `endif

  reg [31:0] _zz_37 [0:32767];
  (* ram_style = "distributed" *) reg [31:0] _zz_38 [0:31];

  assign _zz__zz_47_1 = _zz_when_Decoder_l40_1[21 : 10];
  assign _zz__zz_47 = {{20{_zz__zz_47_1[11]}}, _zz__zz_47_1};
  assign _zz__zz_47_3 = _zz_when_Decoder_l40_1[21 : 10];
  assign _zz__zz_47_2 = {20'd0, _zz__zz_47_3};
  assign _zz__zz_52 = (_zz_48 + _zz_49);
  assign _zz__zz_52_1 = (_zz_48 - _zz_49);
  assign _zz__zz_52_2 = _zz_48;
  assign _zz__zz_52_3 = _zz_49;
  assign _zz__zz_37_port0 = _zz_37[_zz_when_Decoder_l40_4];
  always @(posedge clk) begin
    if(_zz_28) begin
      _zz_38[_zz_when_RegisterFile_l36_5] <= _zz_29;
    end
  end

  assign _zz__zz_38_port1 = _zz_38[_zz_when_Bypass_l28_6];
  assign _zz__zz_38_port2 = _zz_38[_zz_when_Bypass_l39_4];
  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_8)
      AluSrc2_rk : _zz_8_string = "rk ";
      AluSrc2_luc : _zz_8_string = "luc";
      default : _zz_8_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_9)
      AluSrc1_rj : _zz_9_string = "rj";
      AluSrc1_pc : _zz_9_string = "pc";
      default : _zz_9_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_10)
      AluOp_add : _zz_10_string = "add  ";
      AluOp_sub : _zz_10_string = "sub  ";
      AluOp_slt : _zz_10_string = "slt  ";
      AluOp_sltu : _zz_10_string = "sltu ";
      AluOp_and_1 : _zz_10_string = "and_1";
      AluOp_or_1 : _zz_10_string = "or_1 ";
      AluOp_nor_1 : _zz_10_string = "nor_1";
      AluOp_xor_1 : _zz_10_string = "xor_1";
      default : _zz_10_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_16)
      AluOp_add : _zz_16_string = "add  ";
      AluOp_sub : _zz_16_string = "sub  ";
      AluOp_slt : _zz_16_string = "slt  ";
      AluOp_sltu : _zz_16_string = "sltu ";
      AluOp_and_1 : _zz_16_string = "and_1";
      AluOp_or_1 : _zz_16_string = "or_1 ";
      AluOp_nor_1 : _zz_16_string = "nor_1";
      AluOp_xor_1 : _zz_16_string = "xor_1";
      default : _zz_16_string = "?????";
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
    case(_zz_32)
      LucOp_si12 : _zz_32_string = "si12";
      LucOp_si20 : _zz_32_string = "si20";
      LucOp_ui12 : _zz_32_string = "ui12";
      default : _zz_32_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_33)
      AluSrc2_rk : _zz_33_string = "rk ";
      AluSrc2_luc : _zz_33_string = "luc";
      default : _zz_33_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_34)
      AluSrc1_rj : _zz_34_string = "rj";
      AluSrc1_pc : _zz_34_string = "pc";
      default : _zz_34_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_35)
      AluOp_add : _zz_35_string = "add  ";
      AluOp_sub : _zz_35_string = "sub  ";
      AluOp_slt : _zz_35_string = "slt  ";
      AluOp_sltu : _zz_35_string = "sltu ";
      AluOp_and_1 : _zz_35_string = "and_1";
      AluOp_or_1 : _zz_35_string = "or_1 ";
      AluOp_nor_1 : _zz_35_string = "nor_1";
      AluOp_xor_1 : _zz_35_string = "xor_1";
      default : _zz_35_string = "?????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_15 = _zz_14;
    if(_zz_7) begin
      _zz_15 = _zz_52;
    end
  end

  always @(*) begin
    _zz_20 = 32'h00000000;
    if(_zz_31) begin
      _zz_20 = _zz_21;
    end
  end

  always @(*) begin
    _zz_memory_haltRequest_Bypass_l43 = 1'b0;
    if(when_Bypass_l39_8) begin
      if(!_zz_when_RegisterFile_l36_6) begin
        _zz_memory_haltRequest_Bypass_l43 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l43 = 1'b0;
    if(when_Bypass_l39_7) begin
      if(!_zz_when_RegisterFile_l36_6) begin
        _zz_execute_haltRequest_Bypass_l43 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l43_1 = 1'b0;
    if(when_Bypass_l39_6) begin
      if(!_zz_when_RegisterFile_l36_4) begin
        _zz_execute_haltRequest_Bypass_l43_1 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_memory_haltRequest_Bypass_l43_1 = 1'b0;
    if(when_Bypass_l39_5) begin
      if(!_zz_when_RegisterFile_l36_6) begin
        _zz_memory_haltRequest_Bypass_l43_1 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l43_2 = 1'b0;
    if(when_Bypass_l39_4) begin
      if(!_zz_when_RegisterFile_l36_6) begin
        _zz_execute_haltRequest_Bypass_l43_2 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l43_3 = 1'b0;
    if(when_Bypass_l39_3) begin
      if(!_zz_when_RegisterFile_l36_4) begin
        _zz_execute_haltRequest_Bypass_l43_3 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_memory_haltRequest_Bypass_l32 = 1'b0;
    if(_zz_3) begin
      if(when_Bypass_l28_2) begin
        if(!_zz_when_RegisterFile_l36_6) begin
          _zz_memory_haltRequest_Bypass_l32 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_memory_haltRequest_Bypass_l43_2 = 1'b0;
    if(when_Bypass_l39_2) begin
      if(!_zz_when_RegisterFile_l36_6) begin
        _zz_memory_haltRequest_Bypass_l43_2 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l43_4 = 1'b0;
    if(when_Bypass_l39_1) begin
      if(!_zz_when_RegisterFile_l36_6) begin
        _zz_execute_haltRequest_Bypass_l43_4 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l43_5 = 1'b0;
    if(when_Bypass_l39) begin
      if(!_zz_when_RegisterFile_l36_4) begin
        _zz_execute_haltRequest_Bypass_l43_5 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_23 = _zz_22;
    if(when_Bypass_l39) begin
      if(_zz_when_RegisterFile_l36_4) begin
        _zz_23 = _zz_24;
      end
    end
    if(when_Bypass_l39_1) begin
      if(_zz_when_RegisterFile_l36_6) begin
        _zz_23 = _zz_29;
      end
    end
    if(when_Bypass_l39_3) begin
      if(_zz_when_RegisterFile_l36_4) begin
        _zz_23 = _zz_24;
      end
    end
    if(when_Bypass_l39_4) begin
      if(_zz_when_RegisterFile_l36_6) begin
        _zz_23 = _zz_29;
      end
    end
    if(when_Bypass_l39_6) begin
      if(_zz_when_RegisterFile_l36_4) begin
        _zz_23 = _zz_24;
      end
    end
    if(when_Bypass_l39_7) begin
      if(_zz_when_RegisterFile_l36_6) begin
        _zz_23 = _zz_29;
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l32 = 1'b0;
    if(_zz_27) begin
      if(when_Bypass_l28_1) begin
        if(!_zz_when_RegisterFile_l36_6) begin
          _zz_execute_haltRequest_Bypass_l32 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l32_1 = 1'b0;
    if(_zz_27) begin
      if(when_Bypass_l28) begin
        if(!_zz_when_RegisterFile_l36_4) begin
          _zz_execute_haltRequest_Bypass_l32_1 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_26 = _zz_25;
    if(_zz_27) begin
      if(when_Bypass_l28) begin
        if(_zz_when_RegisterFile_l36_4) begin
          _zz_26 = _zz_24;
        end
      end
      if(when_Bypass_l28_1) begin
        if(_zz_when_RegisterFile_l36_6) begin
          _zz_26 = _zz_29;
        end
      end
    end
  end

  always @(*) begin
    _zz_28 = 1'b0;
    if(when_RegisterFile_l36) begin
      _zz_28 = 1'b1;
    end
  end

  assign _zz_when_Decoder_l40_2 = _zz_when_Decoder_l40_3;
  assign _zz_when_Decoder_l40_4 = _zz_when_Decoder_l40_2[16 : 2];
  always @(*) begin
    _zz_36 = 1'b0;
    if(when_Decoder_l40) begin
      _zz_36 = 1'b1;
    end
    if(when_Decoder_l40_1) begin
      _zz_36 = 1'b1;
    end
    if(when_Decoder_l40_2) begin
      _zz_36 = 1'b1;
    end
    if(when_Decoder_l40_4) begin
      _zz_36 = 1'b1;
    end
    if(when_Decoder_l40_5) begin
      _zz_36 = 1'b1;
    end
    if(when_Decoder_l40_6) begin
      _zz_36 = 1'b1;
    end
    if(when_Decoder_l40_7) begin
      _zz_36 = 1'b1;
    end
    if(when_Decoder_l40_9) begin
      _zz_36 = 1'b1;
    end
    if(when_Decoder_l40_10) begin
      _zz_36 = 1'b1;
    end
    if(when_Decoder_l40_11) begin
      _zz_36 = 1'b1;
    end
    if(when_Decoder_l40_12) begin
      _zz_36 = 1'b1;
    end
    if(when_Decoder_l40_13) begin
      _zz_36 = 1'b1;
    end
    if(when_Decoder_l40_14) begin
      _zz_36 = 1'b1;
    end
    if(when_Decoder_l40_15) begin
      _zz_36 = 1'b1;
    end
  end

  assign _zz_when_Bypass_l28_6 = _zz_when_Decoder_l40_1[9 : 5];
  assign _zz_when_Bypass_l39_4 = _zz_when_Decoder_l40_1[14 : 10];
  always @(*) begin
    _zz_when_RegisterFile_l36_7 = 1'b0;
    if(when_Decoder_l40) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_1) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_2) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_3) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_4) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_5) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_6) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_7) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_8) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_9) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_10) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_11) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_12) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_13) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_14) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_15) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
  end

  always @(*) begin
    _zz_35 = AluOp_add;
    if(when_Decoder_l40_1) begin
      _zz_35 = AluOp_sub;
    end
    if(when_Decoder_l40_4) begin
      _zz_35 = AluOp_slt;
    end
    if(when_Decoder_l40_5) begin
      _zz_35 = AluOp_sltu;
    end
    if(when_Decoder_l40_6) begin
      _zz_35 = AluOp_slt;
    end
    if(when_Decoder_l40_7) begin
      _zz_35 = AluOp_sltu;
    end
    if(when_Decoder_l40_9) begin
      _zz_35 = AluOp_and_1;
    end
    if(when_Decoder_l40_10) begin
      _zz_35 = AluOp_or_1;
    end
    if(when_Decoder_l40_11) begin
      _zz_35 = AluOp_nor_1;
    end
    if(when_Decoder_l40_12) begin
      _zz_35 = AluOp_xor_1;
    end
    if(when_Decoder_l40_13) begin
      _zz_35 = AluOp_and_1;
    end
    if(when_Decoder_l40_14) begin
      _zz_35 = AluOp_or_1;
    end
    if(when_Decoder_l40_15) begin
      _zz_35 = AluOp_xor_1;
    end
  end

  always @(*) begin
    _zz_34 = AluSrc1_rj;
    if(when_Decoder_l40_8) begin
      _zz_34 = AluSrc1_pc;
    end
  end

  always @(*) begin
    _zz_33 = AluSrc2_rk;
    if(when_Decoder_l40_2) begin
      _zz_33 = AluSrc2_luc;
    end
    if(when_Decoder_l40_6) begin
      _zz_33 = AluSrc2_luc;
    end
    if(when_Decoder_l40_7) begin
      _zz_33 = AluSrc2_luc;
    end
    if(when_Decoder_l40_8) begin
      _zz_33 = AluSrc2_luc;
    end
    if(when_Decoder_l40_13) begin
      _zz_33 = AluSrc2_luc;
    end
    if(when_Decoder_l40_14) begin
      _zz_33 = AluSrc2_luc;
    end
    if(when_Decoder_l40_15) begin
      _zz_33 = AluSrc2_luc;
    end
  end

  always @(*) begin
    _zz_32 = LucOp_si12;
    if(when_Decoder_l40_2) begin
      _zz_32 = LucOp_si12;
    end
    if(when_Decoder_l40_3) begin
      _zz_32 = LucOp_si20;
    end
    if(when_Decoder_l40_6) begin
      _zz_32 = LucOp_si12;
    end
    if(when_Decoder_l40_7) begin
      _zz_32 = LucOp_si12;
    end
    if(when_Decoder_l40_8) begin
      _zz_32 = LucOp_si20;
    end
    if(when_Decoder_l40_13) begin
      _zz_32 = LucOp_ui12;
    end
    if(when_Decoder_l40_14) begin
      _zz_32 = LucOp_ui12;
    end
    if(when_Decoder_l40_15) begin
      _zz_32 = LucOp_ui12;
    end
  end

  always @(*) begin
    _zz_31 = 1'b0;
    if(when_Decoder_l40_3) begin
      _zz_31 = 1'b1;
    end
  end

  always @(*) begin
    _zz_30 = 1'b0;
    if(when_Decoder_l40) begin
      _zz_30 = 1'b1;
    end
    if(when_Decoder_l40_1) begin
      _zz_30 = 1'b1;
    end
    if(when_Decoder_l40_2) begin
      _zz_30 = 1'b1;
    end
    if(when_Decoder_l40_4) begin
      _zz_30 = 1'b1;
    end
    if(when_Decoder_l40_5) begin
      _zz_30 = 1'b1;
    end
    if(when_Decoder_l40_6) begin
      _zz_30 = 1'b1;
    end
    if(when_Decoder_l40_7) begin
      _zz_30 = 1'b1;
    end
    if(when_Decoder_l40_8) begin
      _zz_30 = 1'b1;
    end
    if(when_Decoder_l40_9) begin
      _zz_30 = 1'b1;
    end
    if(when_Decoder_l40_10) begin
      _zz_30 = 1'b1;
    end
    if(when_Decoder_l40_11) begin
      _zz_30 = 1'b1;
    end
    if(when_Decoder_l40_12) begin
      _zz_30 = 1'b1;
    end
    if(when_Decoder_l40_13) begin
      _zz_30 = 1'b1;
    end
    if(when_Decoder_l40_14) begin
      _zz_30 = 1'b1;
    end
    if(when_Decoder_l40_15) begin
      _zz_30 = 1'b1;
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
  assign when_Decoder_l40_8 = ((_zz_when_Decoder_l40_1 & 32'hfe000000) == 32'h1c000000);
  assign when_Decoder_l40_9 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00148000);
  assign when_Decoder_l40_10 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00150000);
  assign when_Decoder_l40_11 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00140000);
  assign when_Decoder_l40_12 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00158000);
  assign when_Decoder_l40_13 = ((_zz_when_Decoder_l40_1 & 32'hffc00000) == 32'h03400000);
  assign when_Decoder_l40_14 = ((_zz_when_Decoder_l40_1 & 32'hffc00000) == 32'h03800000);
  assign when_Decoder_l40_15 = ((_zz_when_Decoder_l40_1 & 32'hffc00000) == 32'h03c00000);
  assign when_RegisterFile_l36 = (((_zz_when_RegisterFile_l36_6 && (_zz_when_RegisterFile_l36_5 != 5'h00)) && write_up_isFiring) && write_up_isValid);
  assign when_Bypass_l28 = (_zz_when_Bypass_l28_5 == _zz_when_Bypass_l28_4);
  assign execute_haltRequest_Bypass_l32 = _zz_execute_haltRequest_Bypass_l32_1;
  assign when_Bypass_l28_1 = (_zz_when_Bypass_l28_5 == _zz_when_RegisterFile_l36_5);
  assign execute_haltRequest_Bypass_l32_1 = _zz_execute_haltRequest_Bypass_l32;
  assign when_Bypass_l39 = (_zz_when_Bypass_l39_3 == _zz_when_Bypass_l28_4);
  assign execute_haltRequest_Bypass_l43 = _zz_execute_haltRequest_Bypass_l43_5;
  assign when_Bypass_l39_1 = (_zz_when_Bypass_l39_3 == _zz_when_RegisterFile_l36_5);
  assign execute_haltRequest_Bypass_l43_1 = _zz_execute_haltRequest_Bypass_l43_4;
  assign when_Bypass_l39_2 = (_zz_when_Bypass_l39_2 == _zz_when_RegisterFile_l36_5);
  assign memory_haltRequest_Bypass_l43 = _zz_memory_haltRequest_Bypass_l43_2;
  assign when_Bypass_l28_2 = (_zz_when_Bypass_l28_1 == _zz_when_RegisterFile_l36_5);
  assign memory_haltRequest_Bypass_l32 = _zz_memory_haltRequest_Bypass_l32;
  assign when_Bypass_l39_3 = (_zz_when_Bypass_l39_3 == _zz_when_Bypass_l28_4);
  assign execute_haltRequest_Bypass_l43_2 = _zz_execute_haltRequest_Bypass_l43_3;
  assign when_Bypass_l39_4 = (_zz_when_Bypass_l39_3 == _zz_when_RegisterFile_l36_5);
  assign execute_haltRequest_Bypass_l43_3 = _zz_execute_haltRequest_Bypass_l43_2;
  assign when_Bypass_l39_5 = (_zz_when_Bypass_l39_2 == _zz_when_RegisterFile_l36_5);
  assign memory_haltRequest_Bypass_l43_1 = _zz_memory_haltRequest_Bypass_l43_1;
  assign when_Bypass_l39_6 = (_zz_when_Bypass_l39_3 == _zz_when_Bypass_l28_4);
  assign execute_haltRequest_Bypass_l43_4 = _zz_execute_haltRequest_Bypass_l43_1;
  assign when_Bypass_l39_7 = (_zz_when_Bypass_l39_3 == _zz_when_RegisterFile_l36_5);
  assign execute_haltRequest_Bypass_l43_5 = _zz_execute_haltRequest_Bypass_l43;
  assign when_Bypass_l39_8 = (_zz_when_Bypass_l39_2 == _zz_when_RegisterFile_l36_5);
  assign memory_haltRequest_Bypass_l43_2 = _zz_memory_haltRequest_Bypass_l43;
  always @(*) begin
    case(_zz_32)
      LucOp_si12 : begin
        _zz_47 = _zz__zz_47;
      end
      LucOp_si20 : begin
        _zz_47 = {_zz_when_Decoder_l40_1[24 : 5],12'h000};
      end
      default : begin
        _zz_47 = _zz__zz_47_2;
      end
    endcase
  end

  assign _zz_21 = _zz_47;
  always @(*) begin
    case(_zz_19)
      AluSrc1_rj : begin
        _zz_50 = _zz_26;
      end
      default : begin
        _zz_50 = _zz_18;
      end
    endcase
  end

  assign _zz_48 = _zz_50;
  always @(*) begin
    case(_zz_17)
      AluSrc2_rk : begin
        _zz_51 = _zz_23;
      end
      default : begin
        _zz_51 = _zz_6;
      end
    endcase
  end

  assign _zz_49 = _zz_51;
  always @(*) begin
    case(_zz_16)
      AluOp_add : begin
        _zz_52 = _zz__zz_52;
      end
      AluOp_sub : begin
        _zz_52 = _zz__zz_52_1;
      end
      AluOp_slt : begin
        _zz_52 = (($signed(_zz__zz_52_2) < $signed(_zz__zz_52_3)) ? 32'h00000001 : 32'h00000000);
      end
      AluOp_sltu : begin
        _zz_52 = ((_zz_48 < _zz_49) ? 32'h00000001 : 32'h00000000);
      end
      AluOp_and_1 : begin
        _zz_52 = (_zz_48 & _zz_49);
      end
      AluOp_or_1 : begin
        _zz_52 = (_zz_48 | _zz_49);
      end
      AluOp_nor_1 : begin
        _zz_52 = (~ (_zz_48 | _zz_49));
      end
      default : begin
        _zz_52 = (_zz_48 ^ _zz_49);
      end
    endcase
  end

  assign _zz_39 = _zz_2;
  assign _zz_40 = _zz_when_RegisterFile_l36_6;
  assign _zz_41 = _zz_when_RegisterFile_l36_5;
  assign _zz_42 = _zz_29;
  assign fetch_up_ready = fetch_down_isReady;
  assign decode_up_ready = decode_down_isReady;
  assign _zz_when_Decoder_l40_1 = _zz_when_Decoder_l40;
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

  assign when_CtrlLink_l151 = (|{execute_haltRequest_Bypass_l43_5,{execute_haltRequest_Bypass_l43_4,{execute_haltRequest_Bypass_l43_3,{execute_haltRequest_Bypass_l43_2,{execute_haltRequest_Bypass_l43_1,{execute_haltRequest_Bypass_l43,{execute_haltRequest_Bypass_l32_1,execute_haltRequest_Bypass_l32}}}}}}});
  assign _zz_18 = _zz_12;
  assign _zz_27 = _zz_11;
  assign _zz_when_Bypass_l28_5 = _zz_when_Bypass_l28_3;
  assign _zz_when_Bypass_l39_3 = _zz_when_Bypass_l39_1;
  assign _zz_16 = _zz_10;
  assign _zz_19 = _zz_9;
  assign _zz_17 = _zz_8;
  always @(*) begin
    memory_down_valid = memory_up_valid;
    if(when_CtrlLink_l151_1) begin
      memory_down_valid = 1'b0;
    end
  end

  always @(*) begin
    memory_up_ready = memory_down_isReady;
    if(when_CtrlLink_l151_1) begin
      memory_up_ready = 1'b0;
    end
  end

  assign when_CtrlLink_l151_1 = (|{memory_haltRequest_Bypass_l43_2,{memory_haltRequest_Bypass_l43_1,{memory_haltRequest_Bypass_l32,memory_haltRequest_Bypass_l43}}});
  assign _zz_24 = _zz_4;
  assign _zz_when_Bypass_l39_2 = _zz_when_Bypass_l39;
  assign _zz_when_RegisterFile_l36_4 = _zz_when_RegisterFile_l36_2;
  assign _zz_when_Bypass_l28_4 = _zz_when_Bypass_l28;
  assign write_down_valid = write_up_valid;
  assign _zz_29 = _zz_1;
  assign _zz_when_RegisterFile_l36_6 = _zz_when_RegisterFile_l36_1;
  assign _zz_when_RegisterFile_l36_5 = _zz_when_RegisterFile_l36;
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
  always @(*) begin
    execute_down_ready = memory_up_ready;
    if(when_StageLink_l67_2) begin
      execute_down_ready = 1'b1;
    end
  end

  assign when_StageLink_l67_2 = (! memory_up_isValid);
  assign fetch_down_isReady = fetch_down_ready;
  assign decode_up_isValid = 1'b1;
  assign decode_down_isValid = 1'b1;
  assign decode_down_isReady = decode_down_ready;
  assign execute_up_isValid = execute_up_valid;
  assign execute_down_isValid = execute_down_valid;
  assign execute_down_isReady = execute_down_ready;
  assign memory_up_isValid = memory_up_valid;
  assign memory_down_isValid = memory_down_valid;
  assign memory_down_isReady = 1'b1;
  assign write_up_isFiring = (write_up_isValid && write_up_isReady);
  assign write_up_isValid = write_up_valid;
  assign write_up_isReady = 1'b1;
  always @(posedge clk) begin
    if(reset) begin
      _zz_when_Decoder_l40_3 <= 32'h00003000;
      execute_up_valid <= 1'b0;
      memory_up_valid <= 1'b0;
      write_up_valid <= 1'b0;
    end else begin
      _zz_when_Decoder_l40_3 <= (_zz_when_Decoder_l40_3 + 32'h00000004);
      if(decode_down_isReady) begin
        execute_up_valid <= decode_down_isValid;
      end
      if(execute_down_isReady) begin
        memory_up_valid <= execute_down_isValid;
      end
      write_up_valid <= memory_down_isValid;
    end
  end

  always @(posedge clk) begin
    if(fetch_down_isReady) begin
      _zz_13 <= _zz_when_Decoder_l40_2;
      _zz_when_Decoder_l40 <= _zz__zz_37_port0;
    end
    if(decode_down_isReady) begin
      _zz_12 <= _zz_13;
      _zz_14 <= _zz_20;
      _zz_11 <= _zz_36;
      _zz_when_Bypass_l28_3 <= _zz_when_Bypass_l28_6;
      _zz_when_Bypass_l39_1 <= _zz_when_Bypass_l39_4;
      _zz_when_RegisterFile_l36_3 <= _zz_when_RegisterFile_l36_7;
      _zz_when_Bypass_l28_2 <= _zz_when_Decoder_l40_1[4 : 0];
      _zz_10 <= _zz_35;
      _zz_9 <= _zz_34;
      _zz_8 <= _zz_33;
      _zz_7 <= _zz_30;
      _zz_25 <= ((_zz_when_Bypass_l28_6 != 5'h00) ? ((_zz_when_Bypass_l28_6 == _zz_when_RegisterFile_l36_5) ? _zz_29 : _zz__zz_38_port1) : 32'h00000000);
      _zz_22 <= ((_zz_when_Bypass_l39_4 != 5'h00) ? ((_zz_when_Bypass_l39_4 == _zz_when_RegisterFile_l36_5) ? _zz_29 : _zz__zz_38_port2) : 32'h00000000);
      _zz_6 <= _zz_21;
    end
    if(execute_down_isReady) begin
      _zz_5 <= _zz_18;
      _zz_4 <= _zz_15;
      _zz_3 <= _zz_27;
      _zz_when_Bypass_l28_1 <= _zz_when_Bypass_l28_5;
      _zz_when_Bypass_l39 <= _zz_when_Bypass_l39_3;
      _zz_when_RegisterFile_l36_2 <= _zz_when_RegisterFile_l36_3;
      _zz_when_Bypass_l28 <= _zz_when_Bypass_l28_2;
    end
    _zz_2 <= _zz_5;
    _zz_1 <= _zz_24;
    _zz_when_RegisterFile_l36_1 <= _zz_when_RegisterFile_l36_4;
    _zz_when_RegisterFile_l36 <= _zz_when_Bypass_l28_4;
  end


endmodule
