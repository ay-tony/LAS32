// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : LAS32
// Git hash  : 1aec11cdbfe9e3065664a7ed3a37f23605c18be3

`timescale 1ns/1ps

module LAS32 (
  output wire [31:0]   _zz_49,
  output wire          _zz_50,
  output wire [4:0]    _zz_51,
  output wire [31:0]   _zz_52,
  input  wire          clk,
  input  wire          reset
);
  localparam ShifterSrc2_rk = 1'd0;
  localparam ShifterSrc2_ui5 = 1'd1;
  localparam ShifterOp_sll_1 = 2'd0;
  localparam ShifterOp_srl_1 = 2'd1;
  localparam ShifterOp_sra_1 = 2'd2;
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

  wire       [31:0]   _zz__zz_47_port0;
  wire       [31:0]   _zz__zz_48_port1;
  wire       [31:0]   _zz__zz_48_port2;
  wire       [31:0]   _zz__zz_57;
  wire       [11:0]   _zz__zz_57_1;
  wire       [31:0]   _zz__zz_57_2;
  wire       [11:0]   _zz__zz_57_3;
  wire       [31:0]   _zz__zz_62;
  wire       [31:0]   _zz__zz_62_1;
  wire       [31:0]   _zz__zz_62_2;
  wire       [31:0]   _zz__zz_62_3;
  wire       [32:0]   _zz__zz_67;
  wire       [32:0]   _zz__zz_67_1;
  wire       [32:0]   _zz__zz_67_2;
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
  reg        [1:0]    _zz_9;
  reg                 _zz_10;
  reg        [0:0]    _zz_11;
  reg        [0:0]    _zz_12;
  reg        [2:0]    _zz_13;
  reg        [4:0]    _zz_when_Bypass_l28_2;
  reg                 _zz_when_RegisterFile_l36_3;
  reg        [4:0]    _zz_when_Bypass_l39_1;
  reg        [4:0]    _zz_when_Bypass_l28_3;
  reg                 _zz_14;
  reg        [31:0]   _zz_15;
  wire                execute_down_isReady;
  reg                 execute_up_valid;
  reg        [31:0]   _zz_when_Decoder_l40;
  reg        [31:0]   _zz_16;
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
  wire       [1:0]    _zz_17;
  wire       [0:0]    _zz_18;
  reg        [31:0]   _zz_19;
  reg        [31:0]   _zz_20;
  wire       [2:0]    _zz_21;
  wire       [0:0]    _zz_22;
  wire       [31:0]   _zz_23;
  wire       [0:0]    _zz_24;
  reg        [31:0]   _zz_25;
  wire       [31:0]   _zz_26;
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
  reg        [31:0]   _zz_27;
  wire       [31:0]   _zz_28;
  reg        [31:0]   _zz_29;
  wire       [4:0]    _zz_when_Bypass_l39_3;
  reg                 _zz_execute_haltRequest_Bypass_l32;
  reg                 _zz_execute_haltRequest_Bypass_l32_1;
  wire       [31:0]   _zz_30;
  reg        [31:0]   _zz_31;
  wire       [31:0]   _zz_32;
  reg        [31:0]   _zz_33;
  wire                _zz_when_RegisterFile_l36_4;
  wire       [4:0]    _zz_when_Bypass_l28_4;
  wire       [4:0]    _zz_when_Bypass_l28_5;
  wire                _zz_34;
  reg                 _zz_35;
  wire       [31:0]   _zz_36;
  wire                write_up_isValid;
  wire                write_up_isFiring;
  wire       [4:0]    _zz_when_RegisterFile_l36_5;
  wire                _zz_when_RegisterFile_l36_6;
  reg                 _zz_37;
  reg        [0:0]    _zz_38;
  reg        [1:0]    _zz_39;
  reg                 _zz_40;
  reg                 _zz_41;
  reg        [1:0]    _zz_42;
  reg        [0:0]    _zz_43;
  reg        [0:0]    _zz_44;
  reg        [2:0]    _zz_45;
  reg                 _zz_when_RegisterFile_l36_7;
  wire       [4:0]    _zz_when_Bypass_l39_4;
  wire       [4:0]    _zz_when_Bypass_l28_6;
  wire       [31:0]   _zz_when_Decoder_l40_1;
  reg                 _zz_46;
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
  wire                when_Decoder_l40_16;
  wire                when_Decoder_l40_17;
  wire                when_Decoder_l40_18;
  wire                when_Decoder_l40_19;
  wire                when_Decoder_l40_20;
  wire                when_Decoder_l40_21;
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
  reg        [31:0]   _zz_57;
  wire       [31:0]   _zz_58;
  wire       [31:0]   _zz_59;
  reg        [31:0]   _zz_60;
  reg        [31:0]   _zz_61;
  reg        [31:0]   _zz_62;
  wire       [31:0]   _zz_63;
  reg        [4:0]    _zz_64;
  reg        [31:0]   _zz_65;
  reg        [31:0]   _zz_66;
  wire       [31:0]   _zz_67;
  reg        [31:0]   _zz_68;
  reg        [31:0]   _zz_69;
  wire                when_CtrlLink_l151;
  wire                when_CtrlLink_l151_1;
  wire                when_StageLink_l67;
  wire                when_StageLink_l67_1;
  wire                when_StageLink_l67_2;
  `ifndef SYNTHESIS
  reg [23:0] _zz_8_string;
  reg [39:0] _zz_9_string;
  reg [23:0] _zz_11_string;
  reg [15:0] _zz_12_string;
  reg [39:0] _zz_13_string;
  reg [39:0] _zz_17_string;
  reg [23:0] _zz_18_string;
  reg [39:0] _zz_21_string;
  reg [23:0] _zz_22_string;
  reg [15:0] _zz_24_string;
  reg [23:0] _zz_38_string;
  reg [39:0] _zz_39_string;
  reg [31:0] _zz_42_string;
  reg [23:0] _zz_43_string;
  reg [15:0] _zz_44_string;
  reg [39:0] _zz_45_string;
  `endif

  reg [31:0] _zz_47 [0:32767];
  (* ram_style = "distributed" *) reg [31:0] _zz_48 [0:31];

  assign _zz__zz_57_1 = _zz_when_Decoder_l40_1[21 : 10];
  assign _zz__zz_57 = {{20{_zz__zz_57_1[11]}}, _zz__zz_57_1};
  assign _zz__zz_57_3 = _zz_when_Decoder_l40_1[21 : 10];
  assign _zz__zz_57_2 = {20'd0, _zz__zz_57_3};
  assign _zz__zz_62 = (_zz_58 + _zz_59);
  assign _zz__zz_62_1 = (_zz_58 - _zz_59);
  assign _zz__zz_62_2 = _zz_58;
  assign _zz__zz_62_3 = _zz_59;
  assign _zz__zz_67 = _zz__zz_67_1;
  assign _zz__zz_67_1 = ($signed(_zz__zz_67_2) >>> _zz_64);
  assign _zz__zz_67_2 = {((_zz_17 == ShifterOp_sra_1) && _zz_66[31]),_zz_66};
  assign _zz__zz_47_port0 = _zz_47[_zz_when_Decoder_l40_4];
  always @(posedge clk) begin
    if(_zz_35) begin
      _zz_48[_zz_when_RegisterFile_l36_5] <= _zz_36;
    end
  end

  assign _zz__zz_48_port1 = _zz_48[_zz_when_Bypass_l28_6];
  assign _zz__zz_48_port2 = _zz_48[_zz_when_Bypass_l39_4];
  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_8)
      ShifterSrc2_rk : _zz_8_string = "rk ";
      ShifterSrc2_ui5 : _zz_8_string = "ui5";
      default : _zz_8_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_9)
      ShifterOp_sll_1 : _zz_9_string = "sll_1";
      ShifterOp_srl_1 : _zz_9_string = "srl_1";
      ShifterOp_sra_1 : _zz_9_string = "sra_1";
      default : _zz_9_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_11)
      AluSrc2_rk : _zz_11_string = "rk ";
      AluSrc2_luc : _zz_11_string = "luc";
      default : _zz_11_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_12)
      AluSrc1_rj : _zz_12_string = "rj";
      AluSrc1_pc : _zz_12_string = "pc";
      default : _zz_12_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_13)
      AluOp_add : _zz_13_string = "add  ";
      AluOp_sub : _zz_13_string = "sub  ";
      AluOp_slt : _zz_13_string = "slt  ";
      AluOp_sltu : _zz_13_string = "sltu ";
      AluOp_and_1 : _zz_13_string = "and_1";
      AluOp_or_1 : _zz_13_string = "or_1 ";
      AluOp_nor_1 : _zz_13_string = "nor_1";
      AluOp_xor_1 : _zz_13_string = "xor_1";
      default : _zz_13_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_17)
      ShifterOp_sll_1 : _zz_17_string = "sll_1";
      ShifterOp_srl_1 : _zz_17_string = "srl_1";
      ShifterOp_sra_1 : _zz_17_string = "sra_1";
      default : _zz_17_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_18)
      ShifterSrc2_rk : _zz_18_string = "rk ";
      ShifterSrc2_ui5 : _zz_18_string = "ui5";
      default : _zz_18_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_21)
      AluOp_add : _zz_21_string = "add  ";
      AluOp_sub : _zz_21_string = "sub  ";
      AluOp_slt : _zz_21_string = "slt  ";
      AluOp_sltu : _zz_21_string = "sltu ";
      AluOp_and_1 : _zz_21_string = "and_1";
      AluOp_or_1 : _zz_21_string = "or_1 ";
      AluOp_nor_1 : _zz_21_string = "nor_1";
      AluOp_xor_1 : _zz_21_string = "xor_1";
      default : _zz_21_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_22)
      AluSrc2_rk : _zz_22_string = "rk ";
      AluSrc2_luc : _zz_22_string = "luc";
      default : _zz_22_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_24)
      AluSrc1_rj : _zz_24_string = "rj";
      AluSrc1_pc : _zz_24_string = "pc";
      default : _zz_24_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_38)
      ShifterSrc2_rk : _zz_38_string = "rk ";
      ShifterSrc2_ui5 : _zz_38_string = "ui5";
      default : _zz_38_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_39)
      ShifterOp_sll_1 : _zz_39_string = "sll_1";
      ShifterOp_srl_1 : _zz_39_string = "srl_1";
      ShifterOp_sra_1 : _zz_39_string = "sra_1";
      default : _zz_39_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_42)
      LucOp_si12 : _zz_42_string = "si12";
      LucOp_si20 : _zz_42_string = "si20";
      LucOp_ui12 : _zz_42_string = "ui12";
      default : _zz_42_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_43)
      AluSrc2_rk : _zz_43_string = "rk ";
      AluSrc2_luc : _zz_43_string = "luc";
      default : _zz_43_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_44)
      AluSrc1_rj : _zz_44_string = "rj";
      AluSrc1_pc : _zz_44_string = "pc";
      default : _zz_44_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_45)
      AluOp_add : _zz_45_string = "add  ";
      AluOp_sub : _zz_45_string = "sub  ";
      AluOp_slt : _zz_45_string = "slt  ";
      AluOp_sltu : _zz_45_string = "sltu ";
      AluOp_and_1 : _zz_45_string = "and_1";
      AluOp_or_1 : _zz_45_string = "or_1 ";
      AluOp_nor_1 : _zz_45_string = "nor_1";
      AluOp_xor_1 : _zz_45_string = "xor_1";
      default : _zz_45_string = "?????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_20 = _zz_19;
    if(_zz_10) begin
      _zz_20 = _zz_62;
    end
    if(_zz_7) begin
      _zz_20 = _zz_69;
    end
  end

  always @(*) begin
    _zz_25 = 32'h00000000;
    if(_zz_41) begin
      _zz_25 = _zz_26;
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

  assign _zz_28 = _zz_29;
  always @(*) begin
    _zz_29 = _zz_27;
    if(when_Bypass_l39) begin
      if(_zz_when_RegisterFile_l36_4) begin
        _zz_29 = _zz_30;
      end
    end
    if(when_Bypass_l39_1) begin
      if(_zz_when_RegisterFile_l36_6) begin
        _zz_29 = _zz_36;
      end
    end
    if(when_Bypass_l39_3) begin
      if(_zz_when_RegisterFile_l36_4) begin
        _zz_29 = _zz_30;
      end
    end
    if(when_Bypass_l39_4) begin
      if(_zz_when_RegisterFile_l36_6) begin
        _zz_29 = _zz_36;
      end
    end
    if(when_Bypass_l39_6) begin
      if(_zz_when_RegisterFile_l36_4) begin
        _zz_29 = _zz_30;
      end
    end
    if(when_Bypass_l39_7) begin
      if(_zz_when_RegisterFile_l36_6) begin
        _zz_29 = _zz_36;
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l32 = 1'b0;
    if(_zz_34) begin
      if(when_Bypass_l28_1) begin
        if(!_zz_when_RegisterFile_l36_6) begin
          _zz_execute_haltRequest_Bypass_l32 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l32_1 = 1'b0;
    if(_zz_34) begin
      if(when_Bypass_l28) begin
        if(!_zz_when_RegisterFile_l36_4) begin
          _zz_execute_haltRequest_Bypass_l32_1 = 1'b1;
        end
      end
    end
  end

  assign _zz_32 = _zz_33;
  always @(*) begin
    _zz_33 = _zz_31;
    if(_zz_34) begin
      if(when_Bypass_l28) begin
        if(_zz_when_RegisterFile_l36_4) begin
          _zz_33 = _zz_30;
        end
      end
      if(when_Bypass_l28_1) begin
        if(_zz_when_RegisterFile_l36_6) begin
          _zz_33 = _zz_36;
        end
      end
    end
  end

  always @(*) begin
    _zz_35 = 1'b0;
    if(when_RegisterFile_l36) begin
      _zz_35 = 1'b1;
    end
  end

  assign _zz_when_Decoder_l40_2 = _zz_when_Decoder_l40_3;
  assign _zz_when_Decoder_l40_4 = _zz_when_Decoder_l40_2[16 : 2];
  always @(*) begin
    _zz_46 = 1'b0;
    if(when_Decoder_l40) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_1) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_2) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_4) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_5) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_6) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_7) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_9) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_10) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_11) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_12) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_13) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_14) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_15) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_16) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_17) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_18) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_19) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_20) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l40_21) begin
      _zz_46 = 1'b1;
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
    if(when_Decoder_l40_16) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_17) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_18) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_19) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_20) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l40_21) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
  end

  always @(*) begin
    _zz_45 = AluOp_add;
    if(when_Decoder_l40_1) begin
      _zz_45 = AluOp_sub;
    end
    if(when_Decoder_l40_4) begin
      _zz_45 = AluOp_slt;
    end
    if(when_Decoder_l40_5) begin
      _zz_45 = AluOp_sltu;
    end
    if(when_Decoder_l40_6) begin
      _zz_45 = AluOp_slt;
    end
    if(when_Decoder_l40_7) begin
      _zz_45 = AluOp_sltu;
    end
    if(when_Decoder_l40_9) begin
      _zz_45 = AluOp_and_1;
    end
    if(when_Decoder_l40_10) begin
      _zz_45 = AluOp_or_1;
    end
    if(when_Decoder_l40_11) begin
      _zz_45 = AluOp_nor_1;
    end
    if(when_Decoder_l40_12) begin
      _zz_45 = AluOp_xor_1;
    end
    if(when_Decoder_l40_13) begin
      _zz_45 = AluOp_and_1;
    end
    if(when_Decoder_l40_14) begin
      _zz_45 = AluOp_or_1;
    end
    if(when_Decoder_l40_15) begin
      _zz_45 = AluOp_xor_1;
    end
  end

  always @(*) begin
    _zz_44 = AluSrc1_rj;
    if(when_Decoder_l40_8) begin
      _zz_44 = AluSrc1_pc;
    end
  end

  always @(*) begin
    _zz_43 = AluSrc2_rk;
    if(when_Decoder_l40_2) begin
      _zz_43 = AluSrc2_luc;
    end
    if(when_Decoder_l40_6) begin
      _zz_43 = AluSrc2_luc;
    end
    if(when_Decoder_l40_7) begin
      _zz_43 = AluSrc2_luc;
    end
    if(when_Decoder_l40_8) begin
      _zz_43 = AluSrc2_luc;
    end
    if(when_Decoder_l40_13) begin
      _zz_43 = AluSrc2_luc;
    end
    if(when_Decoder_l40_14) begin
      _zz_43 = AluSrc2_luc;
    end
    if(when_Decoder_l40_15) begin
      _zz_43 = AluSrc2_luc;
    end
  end

  always @(*) begin
    _zz_42 = LucOp_si12;
    if(when_Decoder_l40_2) begin
      _zz_42 = LucOp_si12;
    end
    if(when_Decoder_l40_3) begin
      _zz_42 = LucOp_si20;
    end
    if(when_Decoder_l40_6) begin
      _zz_42 = LucOp_si12;
    end
    if(when_Decoder_l40_7) begin
      _zz_42 = LucOp_si12;
    end
    if(when_Decoder_l40_8) begin
      _zz_42 = LucOp_si20;
    end
    if(when_Decoder_l40_13) begin
      _zz_42 = LucOp_ui12;
    end
    if(when_Decoder_l40_14) begin
      _zz_42 = LucOp_ui12;
    end
    if(when_Decoder_l40_15) begin
      _zz_42 = LucOp_ui12;
    end
  end

  always @(*) begin
    _zz_41 = 1'b0;
    if(when_Decoder_l40_3) begin
      _zz_41 = 1'b1;
    end
  end

  always @(*) begin
    _zz_40 = 1'b0;
    if(when_Decoder_l40) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l40_1) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l40_2) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l40_4) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l40_5) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l40_6) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l40_7) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l40_8) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l40_9) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l40_10) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l40_11) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l40_12) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l40_13) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l40_14) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l40_15) begin
      _zz_40 = 1'b1;
    end
  end

  always @(*) begin
    _zz_39 = ShifterOp_sll_1;
    if(when_Decoder_l40_17) begin
      _zz_39 = ShifterOp_srl_1;
    end
    if(when_Decoder_l40_18) begin
      _zz_39 = ShifterOp_sra_1;
    end
    if(when_Decoder_l40_20) begin
      _zz_39 = ShifterOp_srl_1;
    end
    if(when_Decoder_l40_21) begin
      _zz_39 = ShifterOp_sra_1;
    end
  end

  always @(*) begin
    _zz_38 = ShifterSrc2_rk;
    if(when_Decoder_l40_19) begin
      _zz_38 = ShifterSrc2_ui5;
    end
    if(when_Decoder_l40_20) begin
      _zz_38 = ShifterSrc2_ui5;
    end
    if(when_Decoder_l40_21) begin
      _zz_38 = ShifterSrc2_ui5;
    end
  end

  always @(*) begin
    _zz_37 = 1'b0;
    if(when_Decoder_l40_16) begin
      _zz_37 = 1'b1;
    end
    if(when_Decoder_l40_17) begin
      _zz_37 = 1'b1;
    end
    if(when_Decoder_l40_18) begin
      _zz_37 = 1'b1;
    end
    if(when_Decoder_l40_19) begin
      _zz_37 = 1'b1;
    end
    if(when_Decoder_l40_20) begin
      _zz_37 = 1'b1;
    end
    if(when_Decoder_l40_21) begin
      _zz_37 = 1'b1;
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
  assign when_Decoder_l40_16 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00170000);
  assign when_Decoder_l40_17 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00178000);
  assign when_Decoder_l40_18 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00180000);
  assign when_Decoder_l40_19 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00408000);
  assign when_Decoder_l40_20 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00448000);
  assign when_Decoder_l40_21 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00488000);
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
    case(_zz_42)
      LucOp_si12 : begin
        _zz_57 = _zz__zz_57;
      end
      LucOp_si20 : begin
        _zz_57 = {_zz_when_Decoder_l40_1[24 : 5],12'h000};
      end
      default : begin
        _zz_57 = _zz__zz_57_2;
      end
    endcase
  end

  assign _zz_26 = _zz_57;
  always @(*) begin
    case(_zz_24)
      AluSrc1_rj : begin
        _zz_60 = _zz_32;
      end
      default : begin
        _zz_60 = _zz_23;
      end
    endcase
  end

  assign _zz_58 = _zz_60;
  always @(*) begin
    case(_zz_22)
      AluSrc2_rk : begin
        _zz_61 = _zz_28;
      end
      default : begin
        _zz_61 = _zz_6;
      end
    endcase
  end

  assign _zz_59 = _zz_61;
  always @(*) begin
    case(_zz_21)
      AluOp_add : begin
        _zz_62 = _zz__zz_62;
      end
      AluOp_sub : begin
        _zz_62 = _zz__zz_62_1;
      end
      AluOp_slt : begin
        _zz_62 = (($signed(_zz__zz_62_2) < $signed(_zz__zz_62_3)) ? 32'h00000001 : 32'h00000000);
      end
      AluOp_sltu : begin
        _zz_62 = ((_zz_58 < _zz_59) ? 32'h00000001 : 32'h00000000);
      end
      AluOp_and_1 : begin
        _zz_62 = (_zz_58 & _zz_59);
      end
      AluOp_or_1 : begin
        _zz_62 = (_zz_58 | _zz_59);
      end
      AluOp_nor_1 : begin
        _zz_62 = (~ (_zz_58 | _zz_59));
      end
      default : begin
        _zz_62 = (_zz_58 ^ _zz_59);
      end
    endcase
  end

  assign _zz_49 = _zz_2;
  assign _zz_50 = _zz_when_RegisterFile_l36_6;
  assign _zz_51 = _zz_when_RegisterFile_l36_5;
  assign _zz_52 = _zz_36;
  assign _zz_63 = _zz_32;
  always @(*) begin
    case(_zz_18)
      ShifterSrc2_rk : begin
        _zz_64 = _zz_28[4 : 0];
      end
      default : begin
        _zz_64 = _zz_when_Bypass_l39_3;
      end
    endcase
  end

  always @(*) begin
    _zz_65[0] = _zz_63[31];
    _zz_65[1] = _zz_63[30];
    _zz_65[2] = _zz_63[29];
    _zz_65[3] = _zz_63[28];
    _zz_65[4] = _zz_63[27];
    _zz_65[5] = _zz_63[26];
    _zz_65[6] = _zz_63[25];
    _zz_65[7] = _zz_63[24];
    _zz_65[8] = _zz_63[23];
    _zz_65[9] = _zz_63[22];
    _zz_65[10] = _zz_63[21];
    _zz_65[11] = _zz_63[20];
    _zz_65[12] = _zz_63[19];
    _zz_65[13] = _zz_63[18];
    _zz_65[14] = _zz_63[17];
    _zz_65[15] = _zz_63[16];
    _zz_65[16] = _zz_63[15];
    _zz_65[17] = _zz_63[14];
    _zz_65[18] = _zz_63[13];
    _zz_65[19] = _zz_63[12];
    _zz_65[20] = _zz_63[11];
    _zz_65[21] = _zz_63[10];
    _zz_65[22] = _zz_63[9];
    _zz_65[23] = _zz_63[8];
    _zz_65[24] = _zz_63[7];
    _zz_65[25] = _zz_63[6];
    _zz_65[26] = _zz_63[5];
    _zz_65[27] = _zz_63[4];
    _zz_65[28] = _zz_63[3];
    _zz_65[29] = _zz_63[2];
    _zz_65[30] = _zz_63[1];
    _zz_65[31] = _zz_63[0];
  end

  always @(*) begin
    case(_zz_17)
      ShifterOp_sll_1 : begin
        _zz_66 = _zz_65;
      end
      default : begin
        _zz_66 = _zz_63;
      end
    endcase
  end

  assign _zz_67 = _zz__zz_67[31 : 0];
  always @(*) begin
    _zz_68[0] = _zz_67[31];
    _zz_68[1] = _zz_67[30];
    _zz_68[2] = _zz_67[29];
    _zz_68[3] = _zz_67[28];
    _zz_68[4] = _zz_67[27];
    _zz_68[5] = _zz_67[26];
    _zz_68[6] = _zz_67[25];
    _zz_68[7] = _zz_67[24];
    _zz_68[8] = _zz_67[23];
    _zz_68[9] = _zz_67[22];
    _zz_68[10] = _zz_67[21];
    _zz_68[11] = _zz_67[20];
    _zz_68[12] = _zz_67[19];
    _zz_68[13] = _zz_67[18];
    _zz_68[14] = _zz_67[17];
    _zz_68[15] = _zz_67[16];
    _zz_68[16] = _zz_67[15];
    _zz_68[17] = _zz_67[14];
    _zz_68[18] = _zz_67[13];
    _zz_68[19] = _zz_67[12];
    _zz_68[20] = _zz_67[11];
    _zz_68[21] = _zz_67[10];
    _zz_68[22] = _zz_67[9];
    _zz_68[23] = _zz_67[8];
    _zz_68[24] = _zz_67[7];
    _zz_68[25] = _zz_67[6];
    _zz_68[26] = _zz_67[5];
    _zz_68[27] = _zz_67[4];
    _zz_68[28] = _zz_67[3];
    _zz_68[29] = _zz_67[2];
    _zz_68[30] = _zz_67[1];
    _zz_68[31] = _zz_67[0];
  end

  always @(*) begin
    case(_zz_17)
      ShifterOp_sll_1 : begin
        _zz_69 = _zz_68;
      end
      default : begin
        _zz_69 = _zz_67;
      end
    endcase
  end

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
  assign _zz_23 = _zz_15;
  assign _zz_34 = _zz_14;
  assign _zz_when_Bypass_l28_5 = _zz_when_Bypass_l28_3;
  assign _zz_when_Bypass_l39_3 = _zz_when_Bypass_l39_1;
  assign _zz_21 = _zz_13;
  assign _zz_24 = _zz_12;
  assign _zz_22 = _zz_11;
  assign _zz_17 = _zz_9;
  assign _zz_18 = _zz_8;
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
  assign _zz_30 = _zz_4;
  assign _zz_when_Bypass_l39_2 = _zz_when_Bypass_l39;
  assign _zz_when_RegisterFile_l36_4 = _zz_when_RegisterFile_l36_2;
  assign _zz_when_Bypass_l28_4 = _zz_when_Bypass_l28;
  assign write_down_valid = write_up_valid;
  assign _zz_36 = _zz_1;
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
      _zz_16 <= _zz_when_Decoder_l40_2;
      _zz_when_Decoder_l40 <= _zz__zz_47_port0;
    end
    if(decode_down_isReady) begin
      _zz_15 <= _zz_16;
      _zz_19 <= _zz_25;
      _zz_14 <= _zz_46;
      _zz_when_Bypass_l28_3 <= _zz_when_Bypass_l28_6;
      _zz_when_Bypass_l39_1 <= _zz_when_Bypass_l39_4;
      _zz_when_RegisterFile_l36_3 <= _zz_when_RegisterFile_l36_7;
      _zz_when_Bypass_l28_2 <= _zz_when_Decoder_l40_1[4 : 0];
      _zz_13 <= _zz_45;
      _zz_12 <= _zz_44;
      _zz_11 <= _zz_43;
      _zz_10 <= _zz_40;
      _zz_9 <= _zz_39;
      _zz_8 <= _zz_38;
      _zz_7 <= _zz_37;
      _zz_31 <= ((_zz_when_Bypass_l28_6 != 5'h00) ? ((_zz_when_Bypass_l28_6 == _zz_when_RegisterFile_l36_5) ? _zz_36 : _zz__zz_48_port1) : 32'h00000000);
      _zz_27 <= ((_zz_when_Bypass_l39_4 != 5'h00) ? ((_zz_when_Bypass_l39_4 == _zz_when_RegisterFile_l36_5) ? _zz_36 : _zz__zz_48_port2) : 32'h00000000);
      _zz_6 <= _zz_26;
    end
    if(execute_down_isReady) begin
      _zz_5 <= _zz_23;
      _zz_4 <= _zz_20;
      _zz_3 <= _zz_34;
      _zz_when_Bypass_l28_1 <= _zz_when_Bypass_l28_5;
      _zz_when_Bypass_l39 <= _zz_when_Bypass_l39_3;
      _zz_when_RegisterFile_l36_2 <= _zz_when_RegisterFile_l36_3;
      _zz_when_Bypass_l28 <= _zz_when_Bypass_l28_2;
    end
    _zz_2 <= _zz_5;
    _zz_1 <= _zz_30;
    _zz_when_RegisterFile_l36_1 <= _zz_when_RegisterFile_l36_4;
    _zz_when_RegisterFile_l36 <= _zz_when_Bypass_l28_4;
  end


endmodule
