// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : LAS32
// Git hash  : 31d399ef71ddcf60f3668ee2e23ce086f0db975f

`timescale 1ns/1ps

module LAS32 (
  output wire [31:0]   _zz_57,
  output wire          _zz_58,
  output wire [4:0]    _zz_59,
  output wire [31:0]   _zz_60,
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
  localparam AluOp_and_1 = 3'd2;
  localparam AluOp_or_1 = 3'd3;
  localparam AluOp_nor_1 = 3'd4;
  localparam AluOp_xor_1 = 3'd5;
  localparam ComparerSrc2_rk = 2'd0;
  localparam ComparerSrc2_rd = 2'd1;
  localparam ComparerSrc2_si12 = 2'd2;
  localparam ComparerOp_eq = 3'd0;
  localparam ComparerOp_ne = 3'd1;
  localparam ComparerOp_lt = 3'd2;
  localparam ComparerOp_ge = 3'd3;
  localparam ComparerOp_ltu = 3'd4;
  localparam ComparerOp_geu = 3'd5;
  localparam LucOp_si12 = 2'd0;
  localparam LucOp_si20 = 2'd1;
  localparam LucOp_ui12 = 2'd2;

  wire       [31:0]   _zz__zz_55_port0;
  wire       [31:0]   _zz__zz_56_port1;
  wire       [31:0]   _zz__zz_56_port2;
  wire       [31:0]   _zz__zz_56_port3;
  wire       [31:0]   _zz__zz_66;
  wire       [11:0]   _zz__zz_66_1;
  wire       [31:0]   _zz__zz_66_2;
  wire       [11:0]   _zz__zz_66_3;
  wire       [31:0]   _zz__zz_71;
  wire       [31:0]   _zz__zz_71_1;
  wire       [32:0]   _zz__zz_76;
  wire       [32:0]   _zz__zz_76_1;
  wire       [32:0]   _zz__zz_76_2;
  wire       [11:0]   _zz__zz_81;
  wire       [31:0]   _zz__zz_83;
  wire       [31:0]   _zz__zz_83_1;
  wire       [0:0]    _zz__zz_27;
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
  reg        [4:0]    _zz_when_Bypass_l27;
  reg                 _zz_when_RegisterFile_l36_2;
  reg        [4:0]    _zz_when_Bypass_l38;
  reg        [4:0]    _zz_when_Bypass_l27_1;
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
  reg        [4:0]    _zz_when_Bypass_l27_2;
  reg                 _zz_when_RegisterFile_l36_3;
  reg        [4:0]    _zz_when_Bypass_l38_1;
  reg        [4:0]    _zz_when_Bypass_l27_3;
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
  wire       [31:0]   _zz_20;
  reg        [31:0]   _zz_21;
  wire       [2:0]    _zz_22;
  wire       [0:0]    _zz_23;
  wire       [31:0]   _zz_24;
  wire       [0:0]    _zz_25;
  wire       [31:0]   _zz_26;
  reg        [31:0]   _zz_27;
  wire       [31:0]   _zz_28;
  reg                 _zz_memory_haltRequest_Bypass_l42;
  reg                 _zz_execute_haltRequest_Bypass_l42;
  reg                 _zz_execute_haltRequest_Bypass_l42_1;
  reg                 _zz_memory_haltRequest_Bypass_l42_1;
  reg                 _zz_execute_haltRequest_Bypass_l42_2;
  reg                 _zz_execute_haltRequest_Bypass_l42_3;
  reg                 _zz_memory_haltRequest_Bypass_l31;
  reg                 _zz_memory_haltRequest_Bypass_l42_2;
  wire       [4:0]    _zz_when_Bypass_l38_2;
  reg                 _zz_execute_haltRequest_Bypass_l42_4;
  reg                 _zz_execute_haltRequest_Bypass_l42_5;
  reg        [31:0]   _zz_29;
  wire       [31:0]   _zz_30;
  reg        [31:0]   _zz_31;
  wire       [4:0]    _zz_when_Bypass_l38_3;
  reg                 _zz_execute_haltRequest_Bypass_l31;
  reg                 _zz_execute_haltRequest_Bypass_l31_1;
  wire       [31:0]   _zz_32;
  reg        [31:0]   _zz_33;
  wire       [31:0]   _zz_34;
  reg        [31:0]   _zz_35;
  wire                _zz_when_RegisterFile_l36_4;
  wire       [4:0]    _zz_when_Bypass_l27_4;
  wire       [4:0]    _zz_when_Bypass_l27_5;
  wire                _zz_36;
  wire       [31:0]   _zz_37;
  wire       [31:0]   _zz_38;
  wire       [31:0]   _zz_39;
  reg                 _zz_40;
  wire       [31:0]   _zz_41;
  wire                write_up_isValid;
  wire                write_up_isFiring;
  wire       [4:0]    _zz_when_RegisterFile_l36_5;
  wire                _zz_when_RegisterFile_l36_6;
  reg                 _zz_42;
  reg        [1:0]    _zz_43;
  reg        [2:0]    _zz_44;
  reg                 _zz_45;
  reg        [0:0]    _zz_46;
  reg        [1:0]    _zz_47;
  reg                 _zz_48;
  reg                 _zz_49;
  reg        [1:0]    _zz_50;
  reg        [0:0]    _zz_51;
  reg        [0:0]    _zz_52;
  reg        [2:0]    _zz_53;
  wire       [4:0]    _zz_when_Bypass_l27_6;
  reg                 _zz_when_RegisterFile_l36_7;
  wire       [4:0]    _zz_when_Bypass_l38_4;
  wire       [4:0]    _zz_when_Bypass_l27_7;
  wire       [31:0]   _zz_when_Decoder_l40_1;
  reg                 _zz_54;
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
  wire                when_Bypass_l27;
  wire                execute_haltRequest_Bypass_l31;
  wire                when_Bypass_l27_1;
  wire                execute_haltRequest_Bypass_l31_1;
  wire                when_Bypass_l38;
  wire                execute_haltRequest_Bypass_l42;
  wire                when_Bypass_l38_1;
  wire                execute_haltRequest_Bypass_l42_1;
  wire                when_Bypass_l38_2;
  wire                memory_haltRequest_Bypass_l42;
  wire                when_Bypass_l27_2;
  wire                memory_haltRequest_Bypass_l31;
  wire                when_Bypass_l38_3;
  wire                execute_haltRequest_Bypass_l42_2;
  wire                when_Bypass_l38_4;
  wire                execute_haltRequest_Bypass_l42_3;
  wire                when_Bypass_l38_5;
  wire                memory_haltRequest_Bypass_l42_1;
  wire                when_Bypass_l38_6;
  wire                execute_haltRequest_Bypass_l42_4;
  wire                when_Bypass_l38_7;
  wire                execute_haltRequest_Bypass_l42_5;
  wire                when_Bypass_l38_8;
  wire                memory_haltRequest_Bypass_l42_2;
  reg        [31:0]   _zz_66;
  wire       [31:0]   _zz_67;
  wire       [31:0]   _zz_68;
  reg        [31:0]   _zz_69;
  reg        [31:0]   _zz_70;
  reg        [31:0]   _zz_71;
  wire       [31:0]   _zz_72;
  reg        [4:0]    _zz_73;
  reg        [31:0]   _zz_74;
  reg        [31:0]   _zz_75;
  wire       [31:0]   _zz_76;
  reg        [31:0]   _zz_77;
  reg        [31:0]   _zz_78;
  wire       [31:0]   _zz_79;
  wire       [31:0]   _zz_80;
  reg        [31:0]   _zz_81;
  wire                _zz_82;
  wire                _zz_83;
  wire                _zz_84;
  reg                 _zz_85;
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
  reg [39:0] _zz_22_string;
  reg [23:0] _zz_23_string;
  reg [15:0] _zz_25_string;
  reg [31:0] _zz_43_string;
  reg [23:0] _zz_44_string;
  reg [23:0] _zz_46_string;
  reg [39:0] _zz_47_string;
  reg [31:0] _zz_50_string;
  reg [23:0] _zz_51_string;
  reg [15:0] _zz_52_string;
  reg [39:0] _zz_53_string;
  `endif

  reg [31:0] _zz_55 [0:32767];
  (* ram_style = "distributed" *) reg [31:0] _zz_56 [0:31];

  assign _zz__zz_66_1 = _zz_when_Decoder_l40_1[21 : 10];
  assign _zz__zz_66 = {{20{_zz__zz_66_1[11]}}, _zz__zz_66_1};
  assign _zz__zz_66_3 = _zz_when_Decoder_l40_1[21 : 10];
  assign _zz__zz_66_2 = {20'd0, _zz__zz_66_3};
  assign _zz__zz_71 = (_zz_67 + _zz_68);
  assign _zz__zz_71_1 = (_zz_67 - _zz_68);
  assign _zz__zz_76 = _zz__zz_76_1;
  assign _zz__zz_76_1 = ($signed(_zz__zz_76_2) >>> _zz_73);
  assign _zz__zz_76_2 = {((_zz_17 == ShifterOp_sra_1) && _zz_75[31]),_zz_75};
  assign _zz__zz_81 = _zz_when_Decoder_l40_1[21 : 10];
  assign _zz__zz_83 = _zz_79;
  assign _zz__zz_83_1 = _zz_80;
  assign _zz__zz_27 = _zz_85;
  assign _zz__zz_55_port0 = _zz_55[_zz_when_Decoder_l40_4];
  always @(posedge clk) begin
    if(_zz_40) begin
      _zz_56[_zz_when_RegisterFile_l36_5] <= _zz_41;
    end
  end

  assign _zz__zz_56_port1 = _zz_56[_zz_when_Bypass_l27_7];
  assign _zz__zz_56_port2 = _zz_56[_zz_when_Bypass_l38_4];
  assign _zz__zz_56_port3 = _zz_56[_zz_when_Bypass_l27_6];
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
    case(_zz_22)
      AluOp_add : _zz_22_string = "add  ";
      AluOp_sub : _zz_22_string = "sub  ";
      AluOp_and_1 : _zz_22_string = "and_1";
      AluOp_or_1 : _zz_22_string = "or_1 ";
      AluOp_nor_1 : _zz_22_string = "nor_1";
      AluOp_xor_1 : _zz_22_string = "xor_1";
      default : _zz_22_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_23)
      AluSrc2_rk : _zz_23_string = "rk ";
      AluSrc2_luc : _zz_23_string = "luc";
      default : _zz_23_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_25)
      AluSrc1_rj : _zz_25_string = "rj";
      AluSrc1_pc : _zz_25_string = "pc";
      default : _zz_25_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_43)
      ComparerSrc2_rk : _zz_43_string = "rk  ";
      ComparerSrc2_rd : _zz_43_string = "rd  ";
      ComparerSrc2_si12 : _zz_43_string = "si12";
      default : _zz_43_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_44)
      ComparerOp_eq : _zz_44_string = "eq ";
      ComparerOp_ne : _zz_44_string = "ne ";
      ComparerOp_lt : _zz_44_string = "lt ";
      ComparerOp_ge : _zz_44_string = "ge ";
      ComparerOp_ltu : _zz_44_string = "ltu";
      ComparerOp_geu : _zz_44_string = "geu";
      default : _zz_44_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_46)
      ShifterSrc2_rk : _zz_46_string = "rk ";
      ShifterSrc2_ui5 : _zz_46_string = "ui5";
      default : _zz_46_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_47)
      ShifterOp_sll_1 : _zz_47_string = "sll_1";
      ShifterOp_srl_1 : _zz_47_string = "srl_1";
      ShifterOp_sra_1 : _zz_47_string = "sra_1";
      default : _zz_47_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_50)
      LucOp_si12 : _zz_50_string = "si12";
      LucOp_si20 : _zz_50_string = "si20";
      LucOp_ui12 : _zz_50_string = "ui12";
      default : _zz_50_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_51)
      AluSrc2_rk : _zz_51_string = "rk ";
      AluSrc2_luc : _zz_51_string = "luc";
      default : _zz_51_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_52)
      AluSrc1_rj : _zz_52_string = "rj";
      AluSrc1_pc : _zz_52_string = "pc";
      default : _zz_52_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_53)
      AluOp_add : _zz_53_string = "add  ";
      AluOp_sub : _zz_53_string = "sub  ";
      AluOp_and_1 : _zz_53_string = "and_1";
      AluOp_or_1 : _zz_53_string = "or_1 ";
      AluOp_nor_1 : _zz_53_string = "nor_1";
      AluOp_xor_1 : _zz_53_string = "xor_1";
      default : _zz_53_string = "?????";
    endcase
  end
  `endif

  assign _zz_20 = _zz_21;
  always @(*) begin
    _zz_21 = _zz_19;
    if(_zz_10) begin
      _zz_21 = _zz_71;
    end
    if(_zz_7) begin
      _zz_21 = _zz_78;
    end
  end

  assign _zz_26 = _zz_27;
  always @(*) begin
    _zz_27 = _zz_37;
    if(_zz_49) begin
      _zz_27 = _zz_28;
    end
    if(_zz_42) begin
      _zz_27 = {31'd0, _zz__zz_27};
    end
  end

  always @(*) begin
    _zz_memory_haltRequest_Bypass_l42 = 1'b0;
    if(when_Bypass_l38_8) begin
      if(!_zz_when_RegisterFile_l36_6) begin
        _zz_memory_haltRequest_Bypass_l42 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l42 = 1'b0;
    if(when_Bypass_l38_7) begin
      if(!_zz_when_RegisterFile_l36_6) begin
        _zz_execute_haltRequest_Bypass_l42 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l42_1 = 1'b0;
    if(when_Bypass_l38_6) begin
      if(!_zz_when_RegisterFile_l36_4) begin
        _zz_execute_haltRequest_Bypass_l42_1 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_memory_haltRequest_Bypass_l42_1 = 1'b0;
    if(when_Bypass_l38_5) begin
      if(!_zz_when_RegisterFile_l36_6) begin
        _zz_memory_haltRequest_Bypass_l42_1 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l42_2 = 1'b0;
    if(when_Bypass_l38_4) begin
      if(!_zz_when_RegisterFile_l36_6) begin
        _zz_execute_haltRequest_Bypass_l42_2 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l42_3 = 1'b0;
    if(when_Bypass_l38_3) begin
      if(!_zz_when_RegisterFile_l36_4) begin
        _zz_execute_haltRequest_Bypass_l42_3 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_memory_haltRequest_Bypass_l31 = 1'b0;
    if(_zz_3) begin
      if(when_Bypass_l27_2) begin
        if(!_zz_when_RegisterFile_l36_6) begin
          _zz_memory_haltRequest_Bypass_l31 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_memory_haltRequest_Bypass_l42_2 = 1'b0;
    if(when_Bypass_l38_2) begin
      if(!_zz_when_RegisterFile_l36_6) begin
        _zz_memory_haltRequest_Bypass_l42_2 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l42_4 = 1'b0;
    if(when_Bypass_l38_1) begin
      if(!_zz_when_RegisterFile_l36_6) begin
        _zz_execute_haltRequest_Bypass_l42_4 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l42_5 = 1'b0;
    if(when_Bypass_l38) begin
      if(!_zz_when_RegisterFile_l36_4) begin
        _zz_execute_haltRequest_Bypass_l42_5 = 1'b1;
      end
    end
  end

  assign _zz_30 = _zz_31;
  always @(*) begin
    _zz_31 = _zz_29;
    if(when_Bypass_l38) begin
      if(_zz_when_RegisterFile_l36_4) begin
        _zz_31 = _zz_32;
      end
    end
    if(when_Bypass_l38_1) begin
      if(_zz_when_RegisterFile_l36_6) begin
        _zz_31 = _zz_41;
      end
    end
    if(when_Bypass_l38_3) begin
      if(_zz_when_RegisterFile_l36_4) begin
        _zz_31 = _zz_32;
      end
    end
    if(when_Bypass_l38_4) begin
      if(_zz_when_RegisterFile_l36_6) begin
        _zz_31 = _zz_41;
      end
    end
    if(when_Bypass_l38_6) begin
      if(_zz_when_RegisterFile_l36_4) begin
        _zz_31 = _zz_32;
      end
    end
    if(when_Bypass_l38_7) begin
      if(_zz_when_RegisterFile_l36_6) begin
        _zz_31 = _zz_41;
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l31 = 1'b0;
    if(_zz_36) begin
      if(when_Bypass_l27_1) begin
        if(!_zz_when_RegisterFile_l36_6) begin
          _zz_execute_haltRequest_Bypass_l31 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l31_1 = 1'b0;
    if(_zz_36) begin
      if(when_Bypass_l27) begin
        if(!_zz_when_RegisterFile_l36_4) begin
          _zz_execute_haltRequest_Bypass_l31_1 = 1'b1;
        end
      end
    end
  end

  assign _zz_34 = _zz_35;
  always @(*) begin
    _zz_35 = _zz_33;
    if(_zz_36) begin
      if(when_Bypass_l27) begin
        if(_zz_when_RegisterFile_l36_4) begin
          _zz_35 = _zz_32;
        end
      end
      if(when_Bypass_l27_1) begin
        if(_zz_when_RegisterFile_l36_6) begin
          _zz_35 = _zz_41;
        end
      end
    end
  end

  always @(*) begin
    _zz_40 = 1'b0;
    if(when_RegisterFile_l36) begin
      _zz_40 = 1'b1;
    end
  end

  assign _zz_when_Decoder_l40_2 = _zz_when_Decoder_l40_3;
  assign _zz_when_Decoder_l40_4 = _zz_when_Decoder_l40_2[16 : 2];
  always @(*) begin
    _zz_54 = 1'b0;
    if(when_Decoder_l40) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_1) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_2) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_5) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_6) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_7) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_8) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_9) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_10) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_11) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_12) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_13) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_14) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_15) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_16) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_17) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_18) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_19) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_20) begin
      _zz_54 = 1'b1;
    end
    if(when_Decoder_l40_21) begin
      _zz_54 = 1'b1;
    end
  end

  assign _zz_when_Bypass_l27_7 = _zz_when_Decoder_l40_1[9 : 5];
  assign _zz_when_Bypass_l38_4 = _zz_when_Decoder_l40_1[14 : 10];
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

  assign _zz_when_Bypass_l27_6 = _zz_when_Decoder_l40_1[4 : 0];
  always @(*) begin
    _zz_53 = AluOp_add;
    if(when_Decoder_l40_1) begin
      _zz_53 = AluOp_sub;
    end
    if(when_Decoder_l40_5) begin
      _zz_53 = AluOp_and_1;
    end
    if(when_Decoder_l40_6) begin
      _zz_53 = AluOp_or_1;
    end
    if(when_Decoder_l40_7) begin
      _zz_53 = AluOp_nor_1;
    end
    if(when_Decoder_l40_8) begin
      _zz_53 = AluOp_xor_1;
    end
    if(when_Decoder_l40_9) begin
      _zz_53 = AluOp_and_1;
    end
    if(when_Decoder_l40_10) begin
      _zz_53 = AluOp_or_1;
    end
    if(when_Decoder_l40_11) begin
      _zz_53 = AluOp_xor_1;
    end
  end

  always @(*) begin
    _zz_52 = AluSrc1_rj;
    if(when_Decoder_l40_4) begin
      _zz_52 = AluSrc1_pc;
    end
  end

  always @(*) begin
    _zz_51 = AluSrc2_rk;
    if(when_Decoder_l40_2) begin
      _zz_51 = AluSrc2_luc;
    end
    if(when_Decoder_l40_4) begin
      _zz_51 = AluSrc2_luc;
    end
    if(when_Decoder_l40_9) begin
      _zz_51 = AluSrc2_luc;
    end
    if(when_Decoder_l40_10) begin
      _zz_51 = AluSrc2_luc;
    end
    if(when_Decoder_l40_11) begin
      _zz_51 = AluSrc2_luc;
    end
  end

  always @(*) begin
    _zz_50 = LucOp_si12;
    if(when_Decoder_l40_2) begin
      _zz_50 = LucOp_si12;
    end
    if(when_Decoder_l40_3) begin
      _zz_50 = LucOp_si20;
    end
    if(when_Decoder_l40_4) begin
      _zz_50 = LucOp_si20;
    end
    if(when_Decoder_l40_9) begin
      _zz_50 = LucOp_ui12;
    end
    if(when_Decoder_l40_10) begin
      _zz_50 = LucOp_ui12;
    end
    if(when_Decoder_l40_11) begin
      _zz_50 = LucOp_ui12;
    end
  end

  always @(*) begin
    _zz_49 = 1'b0;
    if(when_Decoder_l40_3) begin
      _zz_49 = 1'b1;
    end
  end

  always @(*) begin
    _zz_48 = 1'b0;
    if(when_Decoder_l40) begin
      _zz_48 = 1'b1;
    end
    if(when_Decoder_l40_1) begin
      _zz_48 = 1'b1;
    end
    if(when_Decoder_l40_2) begin
      _zz_48 = 1'b1;
    end
    if(when_Decoder_l40_4) begin
      _zz_48 = 1'b1;
    end
    if(when_Decoder_l40_5) begin
      _zz_48 = 1'b1;
    end
    if(when_Decoder_l40_6) begin
      _zz_48 = 1'b1;
    end
    if(when_Decoder_l40_7) begin
      _zz_48 = 1'b1;
    end
    if(when_Decoder_l40_8) begin
      _zz_48 = 1'b1;
    end
    if(when_Decoder_l40_9) begin
      _zz_48 = 1'b1;
    end
    if(when_Decoder_l40_10) begin
      _zz_48 = 1'b1;
    end
    if(when_Decoder_l40_11) begin
      _zz_48 = 1'b1;
    end
  end

  always @(*) begin
    _zz_47 = ShifterOp_sll_1;
    if(when_Decoder_l40_13) begin
      _zz_47 = ShifterOp_srl_1;
    end
    if(when_Decoder_l40_14) begin
      _zz_47 = ShifterOp_sra_1;
    end
    if(when_Decoder_l40_16) begin
      _zz_47 = ShifterOp_srl_1;
    end
    if(when_Decoder_l40_17) begin
      _zz_47 = ShifterOp_sra_1;
    end
  end

  always @(*) begin
    _zz_46 = ShifterSrc2_rk;
    if(when_Decoder_l40_15) begin
      _zz_46 = ShifterSrc2_ui5;
    end
    if(when_Decoder_l40_16) begin
      _zz_46 = ShifterSrc2_ui5;
    end
    if(when_Decoder_l40_17) begin
      _zz_46 = ShifterSrc2_ui5;
    end
  end

  always @(*) begin
    _zz_45 = 1'b0;
    if(when_Decoder_l40_12) begin
      _zz_45 = 1'b1;
    end
    if(when_Decoder_l40_13) begin
      _zz_45 = 1'b1;
    end
    if(when_Decoder_l40_14) begin
      _zz_45 = 1'b1;
    end
    if(when_Decoder_l40_15) begin
      _zz_45 = 1'b1;
    end
    if(when_Decoder_l40_16) begin
      _zz_45 = 1'b1;
    end
    if(when_Decoder_l40_17) begin
      _zz_45 = 1'b1;
    end
  end

  always @(*) begin
    _zz_44 = ComparerOp_lt;
    if(when_Decoder_l40_18) begin
      _zz_44 = ComparerOp_lt;
    end
    if(when_Decoder_l40_19) begin
      _zz_44 = ComparerOp_ltu;
    end
    if(when_Decoder_l40_20) begin
      _zz_44 = ComparerOp_lt;
    end
    if(when_Decoder_l40_21) begin
      _zz_44 = ComparerOp_ltu;
    end
  end

  always @(*) begin
    _zz_43 = ComparerSrc2_rk;
    if(when_Decoder_l40_20) begin
      _zz_43 = ComparerSrc2_si12;
    end
    if(when_Decoder_l40_21) begin
      _zz_43 = ComparerSrc2_si12;
    end
  end

  always @(*) begin
    _zz_42 = 1'b0;
    if(when_Decoder_l40_18) begin
      _zz_42 = 1'b1;
    end
    if(when_Decoder_l40_19) begin
      _zz_42 = 1'b1;
    end
    if(when_Decoder_l40_20) begin
      _zz_42 = 1'b1;
    end
    if(when_Decoder_l40_21) begin
      _zz_42 = 1'b1;
    end
  end

  assign when_Decoder_l40 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00100000);
  assign when_Decoder_l40_1 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00110000);
  assign when_Decoder_l40_2 = ((_zz_when_Decoder_l40_1 & 32'hffc00000) == 32'h02800000);
  assign when_Decoder_l40_3 = ((_zz_when_Decoder_l40_1 & 32'hfe000000) == 32'h14000000);
  assign when_Decoder_l40_4 = ((_zz_when_Decoder_l40_1 & 32'hfe000000) == 32'h1c000000);
  assign when_Decoder_l40_5 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00148000);
  assign when_Decoder_l40_6 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00150000);
  assign when_Decoder_l40_7 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00140000);
  assign when_Decoder_l40_8 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00158000);
  assign when_Decoder_l40_9 = ((_zz_when_Decoder_l40_1 & 32'hffc00000) == 32'h03400000);
  assign when_Decoder_l40_10 = ((_zz_when_Decoder_l40_1 & 32'hffc00000) == 32'h03800000);
  assign when_Decoder_l40_11 = ((_zz_when_Decoder_l40_1 & 32'hffc00000) == 32'h03c00000);
  assign when_Decoder_l40_12 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00170000);
  assign when_Decoder_l40_13 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00178000);
  assign when_Decoder_l40_14 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00180000);
  assign when_Decoder_l40_15 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00408000);
  assign when_Decoder_l40_16 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00448000);
  assign when_Decoder_l40_17 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00488000);
  assign when_Decoder_l40_18 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00120000);
  assign when_Decoder_l40_19 = ((_zz_when_Decoder_l40_1 & 32'hffff8000) == 32'h00128000);
  assign when_Decoder_l40_20 = ((_zz_when_Decoder_l40_1 & 32'hffc00000) == 32'h02000000);
  assign when_Decoder_l40_21 = ((_zz_when_Decoder_l40_1 & 32'hffc00000) == 32'h02400000);
  assign when_RegisterFile_l36 = (((_zz_when_RegisterFile_l36_6 && (_zz_when_RegisterFile_l36_5 != 5'h00)) && write_up_isFiring) && write_up_isValid);
  assign _zz_39 = ((_zz_when_Bypass_l27_7 != 5'h00) ? ((_zz_when_Bypass_l27_7 == _zz_when_RegisterFile_l36_5) ? _zz_41 : _zz__zz_56_port1) : 32'h00000000);
  assign _zz_38 = ((_zz_when_Bypass_l38_4 != 5'h00) ? ((_zz_when_Bypass_l38_4 == _zz_when_RegisterFile_l36_5) ? _zz_41 : _zz__zz_56_port2) : 32'h00000000);
  assign _zz_37 = ((_zz_when_Bypass_l27_6 != 5'h00) ? ((_zz_when_Bypass_l27_6 == _zz_when_RegisterFile_l36_5) ? _zz_41 : _zz__zz_56_port3) : 32'h00000000);
  assign when_Bypass_l27 = (_zz_when_Bypass_l27_5 == _zz_when_Bypass_l27_4);
  assign execute_haltRequest_Bypass_l31 = _zz_execute_haltRequest_Bypass_l31_1;
  assign when_Bypass_l27_1 = (_zz_when_Bypass_l27_5 == _zz_when_RegisterFile_l36_5);
  assign execute_haltRequest_Bypass_l31_1 = _zz_execute_haltRequest_Bypass_l31;
  assign when_Bypass_l38 = (_zz_when_Bypass_l38_3 == _zz_when_Bypass_l27_4);
  assign execute_haltRequest_Bypass_l42 = _zz_execute_haltRequest_Bypass_l42_5;
  assign when_Bypass_l38_1 = (_zz_when_Bypass_l38_3 == _zz_when_RegisterFile_l36_5);
  assign execute_haltRequest_Bypass_l42_1 = _zz_execute_haltRequest_Bypass_l42_4;
  assign when_Bypass_l38_2 = (_zz_when_Bypass_l38_2 == _zz_when_RegisterFile_l36_5);
  assign memory_haltRequest_Bypass_l42 = _zz_memory_haltRequest_Bypass_l42_2;
  assign when_Bypass_l27_2 = (_zz_when_Bypass_l27_1 == _zz_when_RegisterFile_l36_5);
  assign memory_haltRequest_Bypass_l31 = _zz_memory_haltRequest_Bypass_l31;
  assign when_Bypass_l38_3 = (_zz_when_Bypass_l38_3 == _zz_when_Bypass_l27_4);
  assign execute_haltRequest_Bypass_l42_2 = _zz_execute_haltRequest_Bypass_l42_3;
  assign when_Bypass_l38_4 = (_zz_when_Bypass_l38_3 == _zz_when_RegisterFile_l36_5);
  assign execute_haltRequest_Bypass_l42_3 = _zz_execute_haltRequest_Bypass_l42_2;
  assign when_Bypass_l38_5 = (_zz_when_Bypass_l38_2 == _zz_when_RegisterFile_l36_5);
  assign memory_haltRequest_Bypass_l42_1 = _zz_memory_haltRequest_Bypass_l42_1;
  assign when_Bypass_l38_6 = (_zz_when_Bypass_l38_3 == _zz_when_Bypass_l27_4);
  assign execute_haltRequest_Bypass_l42_4 = _zz_execute_haltRequest_Bypass_l42_1;
  assign when_Bypass_l38_7 = (_zz_when_Bypass_l38_3 == _zz_when_RegisterFile_l36_5);
  assign execute_haltRequest_Bypass_l42_5 = _zz_execute_haltRequest_Bypass_l42;
  assign when_Bypass_l38_8 = (_zz_when_Bypass_l38_2 == _zz_when_RegisterFile_l36_5);
  assign memory_haltRequest_Bypass_l42_2 = _zz_memory_haltRequest_Bypass_l42;
  always @(*) begin
    case(_zz_50)
      LucOp_si12 : begin
        _zz_66 = _zz__zz_66;
      end
      LucOp_si20 : begin
        _zz_66 = {_zz_when_Decoder_l40_1[24 : 5],12'h000};
      end
      default : begin
        _zz_66 = _zz__zz_66_2;
      end
    endcase
  end

  assign _zz_28 = _zz_66;
  always @(*) begin
    case(_zz_25)
      AluSrc1_rj : begin
        _zz_69 = _zz_34;
      end
      default : begin
        _zz_69 = _zz_24;
      end
    endcase
  end

  assign _zz_67 = _zz_69;
  always @(*) begin
    case(_zz_23)
      AluSrc2_rk : begin
        _zz_70 = _zz_30;
      end
      default : begin
        _zz_70 = _zz_6;
      end
    endcase
  end

  assign _zz_68 = _zz_70;
  always @(*) begin
    case(_zz_22)
      AluOp_add : begin
        _zz_71 = _zz__zz_71;
      end
      AluOp_sub : begin
        _zz_71 = _zz__zz_71_1;
      end
      AluOp_and_1 : begin
        _zz_71 = (_zz_67 & _zz_68);
      end
      AluOp_or_1 : begin
        _zz_71 = (_zz_67 | _zz_68);
      end
      AluOp_nor_1 : begin
        _zz_71 = (~ (_zz_67 | _zz_68));
      end
      default : begin
        _zz_71 = (_zz_67 ^ _zz_68);
      end
    endcase
  end

  assign _zz_57 = _zz_2;
  assign _zz_58 = _zz_when_RegisterFile_l36_6;
  assign _zz_59 = _zz_when_RegisterFile_l36_5;
  assign _zz_60 = _zz_41;
  assign _zz_72 = _zz_34;
  always @(*) begin
    case(_zz_18)
      ShifterSrc2_rk : begin
        _zz_73 = _zz_30[4 : 0];
      end
      default : begin
        _zz_73 = _zz_when_Bypass_l38_3;
      end
    endcase
  end

  always @(*) begin
    _zz_74[0] = _zz_72[31];
    _zz_74[1] = _zz_72[30];
    _zz_74[2] = _zz_72[29];
    _zz_74[3] = _zz_72[28];
    _zz_74[4] = _zz_72[27];
    _zz_74[5] = _zz_72[26];
    _zz_74[6] = _zz_72[25];
    _zz_74[7] = _zz_72[24];
    _zz_74[8] = _zz_72[23];
    _zz_74[9] = _zz_72[22];
    _zz_74[10] = _zz_72[21];
    _zz_74[11] = _zz_72[20];
    _zz_74[12] = _zz_72[19];
    _zz_74[13] = _zz_72[18];
    _zz_74[14] = _zz_72[17];
    _zz_74[15] = _zz_72[16];
    _zz_74[16] = _zz_72[15];
    _zz_74[17] = _zz_72[14];
    _zz_74[18] = _zz_72[13];
    _zz_74[19] = _zz_72[12];
    _zz_74[20] = _zz_72[11];
    _zz_74[21] = _zz_72[10];
    _zz_74[22] = _zz_72[9];
    _zz_74[23] = _zz_72[8];
    _zz_74[24] = _zz_72[7];
    _zz_74[25] = _zz_72[6];
    _zz_74[26] = _zz_72[5];
    _zz_74[27] = _zz_72[4];
    _zz_74[28] = _zz_72[3];
    _zz_74[29] = _zz_72[2];
    _zz_74[30] = _zz_72[1];
    _zz_74[31] = _zz_72[0];
  end

  always @(*) begin
    case(_zz_17)
      ShifterOp_sll_1 : begin
        _zz_75 = _zz_74;
      end
      default : begin
        _zz_75 = _zz_72;
      end
    endcase
  end

  assign _zz_76 = _zz__zz_76[31 : 0];
  always @(*) begin
    _zz_77[0] = _zz_76[31];
    _zz_77[1] = _zz_76[30];
    _zz_77[2] = _zz_76[29];
    _zz_77[3] = _zz_76[28];
    _zz_77[4] = _zz_76[27];
    _zz_77[5] = _zz_76[26];
    _zz_77[6] = _zz_76[25];
    _zz_77[7] = _zz_76[24];
    _zz_77[8] = _zz_76[23];
    _zz_77[9] = _zz_76[22];
    _zz_77[10] = _zz_76[21];
    _zz_77[11] = _zz_76[20];
    _zz_77[12] = _zz_76[19];
    _zz_77[13] = _zz_76[18];
    _zz_77[14] = _zz_76[17];
    _zz_77[15] = _zz_76[16];
    _zz_77[16] = _zz_76[15];
    _zz_77[17] = _zz_76[14];
    _zz_77[18] = _zz_76[13];
    _zz_77[19] = _zz_76[12];
    _zz_77[20] = _zz_76[11];
    _zz_77[21] = _zz_76[10];
    _zz_77[22] = _zz_76[9];
    _zz_77[23] = _zz_76[8];
    _zz_77[24] = _zz_76[7];
    _zz_77[25] = _zz_76[6];
    _zz_77[26] = _zz_76[5];
    _zz_77[27] = _zz_76[4];
    _zz_77[28] = _zz_76[3];
    _zz_77[29] = _zz_76[2];
    _zz_77[30] = _zz_76[1];
    _zz_77[31] = _zz_76[0];
  end

  always @(*) begin
    case(_zz_17)
      ShifterOp_sll_1 : begin
        _zz_78 = _zz_77;
      end
      default : begin
        _zz_78 = _zz_76;
      end
    endcase
  end

  assign _zz_79 = _zz_39;
  always @(*) begin
    case(_zz_43)
      ComparerSrc2_rk : begin
        _zz_81 = _zz_38;
      end
      ComparerSrc2_rd : begin
        _zz_81 = _zz_26;
      end
      default : begin
        _zz_81 = {20'd0, _zz__zz_81};
      end
    endcase
  end

  assign _zz_80 = _zz_81;
  assign _zz_82 = (_zz_79 == _zz_80);
  assign _zz_83 = ($signed(_zz__zz_83) < $signed(_zz__zz_83_1));
  assign _zz_84 = (_zz_79 < _zz_80);
  always @(*) begin
    case(_zz_44)
      ComparerOp_eq : begin
        _zz_85 = _zz_82;
      end
      ComparerOp_ne : begin
        _zz_85 = (! _zz_82);
      end
      ComparerOp_lt : begin
        _zz_85 = _zz_83;
      end
      ComparerOp_ge : begin
        _zz_85 = (! _zz_83);
      end
      ComparerOp_ltu : begin
        _zz_85 = _zz_84;
      end
      default : begin
        _zz_85 = (! _zz_84);
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

  assign when_CtrlLink_l151 = (|{execute_haltRequest_Bypass_l42_5,{execute_haltRequest_Bypass_l42_4,{execute_haltRequest_Bypass_l42_3,{execute_haltRequest_Bypass_l42_2,{execute_haltRequest_Bypass_l42_1,{execute_haltRequest_Bypass_l42,{execute_haltRequest_Bypass_l31_1,execute_haltRequest_Bypass_l31}}}}}}});
  assign _zz_24 = _zz_15;
  assign _zz_36 = _zz_14;
  assign _zz_when_Bypass_l27_5 = _zz_when_Bypass_l27_3;
  assign _zz_when_Bypass_l38_3 = _zz_when_Bypass_l38_1;
  assign _zz_22 = _zz_13;
  assign _zz_25 = _zz_12;
  assign _zz_23 = _zz_11;
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

  assign when_CtrlLink_l151_1 = (|{memory_haltRequest_Bypass_l42_2,{memory_haltRequest_Bypass_l42_1,{memory_haltRequest_Bypass_l31,memory_haltRequest_Bypass_l42}}});
  assign _zz_32 = _zz_4;
  assign _zz_when_Bypass_l38_2 = _zz_when_Bypass_l38;
  assign _zz_when_RegisterFile_l36_4 = _zz_when_RegisterFile_l36_2;
  assign _zz_when_Bypass_l27_4 = _zz_when_Bypass_l27;
  assign write_down_valid = write_up_valid;
  assign _zz_41 = _zz_1;
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
      _zz_when_Decoder_l40 <= _zz__zz_55_port0;
    end
    if(decode_down_isReady) begin
      _zz_15 <= _zz_16;
      _zz_19 <= _zz_26;
      _zz_14 <= _zz_54;
      _zz_when_Bypass_l27_3 <= _zz_when_Bypass_l27_7;
      _zz_when_Bypass_l38_1 <= _zz_when_Bypass_l38_4;
      _zz_when_RegisterFile_l36_3 <= _zz_when_RegisterFile_l36_7;
      _zz_when_Bypass_l27_2 <= _zz_when_Bypass_l27_6;
      _zz_13 <= _zz_53;
      _zz_12 <= _zz_52;
      _zz_11 <= _zz_51;
      _zz_10 <= _zz_48;
      _zz_9 <= _zz_47;
      _zz_8 <= _zz_46;
      _zz_7 <= _zz_45;
      _zz_33 <= _zz_39;
      _zz_29 <= _zz_38;
      _zz_6 <= _zz_28;
    end
    if(execute_down_isReady) begin
      _zz_5 <= _zz_24;
      _zz_4 <= _zz_20;
      _zz_3 <= _zz_36;
      _zz_when_Bypass_l27_1 <= _zz_when_Bypass_l27_5;
      _zz_when_Bypass_l38 <= _zz_when_Bypass_l38_3;
      _zz_when_RegisterFile_l36_2 <= _zz_when_RegisterFile_l36_3;
      _zz_when_Bypass_l27 <= _zz_when_Bypass_l27_2;
    end
    _zz_2 <= _zz_5;
    _zz_1 <= _zz_32;
    _zz_when_RegisterFile_l36_1 <= _zz_when_RegisterFile_l36_4;
    _zz_when_RegisterFile_l36 <= _zz_when_Bypass_l27_4;
  end


endmodule
