// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : LAS32
// Git hash  : 98408316b9a47a05436f2f5b61f9cad0942710f0

`timescale 1ns/1ps

module LAS32 (
  output wire [31:0]   _zz_54,
  output wire          _zz_55,
  output wire [4:0]    _zz_56,
  output wire [31:0]   _zz_57,
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
  localparam ComparerSrc2_registerVal2 = 1'd0;
  localparam ComparerSrc2_si12 = 1'd1;
  localparam ComparerOp_eq = 3'd0;
  localparam ComparerOp_ne = 3'd1;
  localparam ComparerOp_lt = 3'd2;
  localparam ComparerOp_ge = 3'd3;
  localparam ComparerOp_ltu = 3'd4;
  localparam ComparerOp_geu = 3'd5;
  localparam LucOp_si12 = 2'd0;
  localparam LucOp_si20 = 2'd1;
  localparam LucOp_ui12 = 2'd2;

  wire       [31:0]   _zz__zz_52_port0;
  wire       [31:0]   _zz__zz_53_port1;
  wire       [31:0]   _zz__zz_53_port2;
  wire       [31:0]   _zz__zz_53_port3;
  wire       [31:0]   _zz__zz_63;
  wire       [11:0]   _zz__zz_63_1;
  wire       [31:0]   _zz__zz_63_2;
  wire       [11:0]   _zz__zz_63_3;
  wire       [31:0]   _zz__zz_68;
  wire       [31:0]   _zz__zz_68_1;
  wire       [32:0]   _zz__zz_73;
  wire       [32:0]   _zz__zz_73_1;
  wire       [32:0]   _zz__zz_73_2;
  wire       [11:0]   _zz__zz_78;
  wire       [31:0]   _zz__zz_80;
  wire       [31:0]   _zz__zz_80_1;
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
  wire       [31:0]   _zz_17;
  wire       [31:0]   _zz_18;
  wire       [1:0]    _zz_19;
  wire       [0:0]    _zz_20;
  reg        [31:0]   _zz_21;
  reg        [31:0]   _zz_22;
  wire       [2:0]    _zz_23;
  wire       [0:0]    _zz_24;
  wire       [31:0]   _zz_25;
  wire       [0:0]    _zz_26;
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
  reg                 _zz_37;
  wire       [31:0]   _zz_38;
  wire                write_up_isValid;
  wire                write_up_isFiring;
  wire       [4:0]    _zz_when_RegisterFile_l36_5;
  wire                _zz_when_RegisterFile_l36_6;
  reg                 _zz_39;
  reg        [0:0]    _zz_40;
  reg        [2:0]    _zz_41;
  reg                 _zz_42;
  reg        [0:0]    _zz_43;
  reg        [1:0]    _zz_44;
  reg                 _zz_45;
  reg                 _zz_46;
  reg        [1:0]    _zz_47;
  reg        [0:0]    _zz_48;
  reg        [0:0]    _zz_49;
  reg        [2:0]    _zz_50;
  wire       [4:0]    _zz_when_Bypass_l27_6;
  reg                 _zz_when_RegisterFile_l36_7;
  wire       [4:0]    _zz_when_Bypass_l38_4;
  wire       [4:0]    _zz_when_Bypass_l27_7;
  wire       [31:0]   _zz_when_Decoder_l40_1;
  reg                 _zz_51;
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
  reg        [31:0]   _zz_63;
  wire       [31:0]   _zz_64;
  wire       [31:0]   _zz_65;
  reg        [31:0]   _zz_66;
  reg        [31:0]   _zz_67;
  reg        [31:0]   _zz_68;
  wire       [31:0]   _zz_69;
  reg        [4:0]    _zz_70;
  reg        [31:0]   _zz_71;
  reg        [31:0]   _zz_72;
  wire       [31:0]   _zz_73;
  reg        [31:0]   _zz_74;
  reg        [31:0]   _zz_75;
  wire       [31:0]   _zz_76;
  wire       [31:0]   _zz_77;
  reg        [31:0]   _zz_78;
  wire                _zz_79;
  wire                _zz_80;
  wire                _zz_81;
  reg                 _zz_82;
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
  reg [39:0] _zz_19_string;
  reg [23:0] _zz_20_string;
  reg [39:0] _zz_23_string;
  reg [23:0] _zz_24_string;
  reg [15:0] _zz_26_string;
  reg [95:0] _zz_40_string;
  reg [23:0] _zz_41_string;
  reg [23:0] _zz_43_string;
  reg [39:0] _zz_44_string;
  reg [31:0] _zz_47_string;
  reg [23:0] _zz_48_string;
  reg [15:0] _zz_49_string;
  reg [39:0] _zz_50_string;
  `endif

  reg [31:0] _zz_52 [0:32767];
  (* ram_style = "distributed" *) reg [31:0] _zz_53 [0:31];

  assign _zz__zz_63_1 = _zz_when_Decoder_l40_1[21 : 10];
  assign _zz__zz_63 = {{20{_zz__zz_63_1[11]}}, _zz__zz_63_1};
  assign _zz__zz_63_3 = _zz_when_Decoder_l40_1[21 : 10];
  assign _zz__zz_63_2 = {20'd0, _zz__zz_63_3};
  assign _zz__zz_68 = (_zz_64 + _zz_65);
  assign _zz__zz_68_1 = (_zz_64 - _zz_65);
  assign _zz__zz_73 = _zz__zz_73_1;
  assign _zz__zz_73_1 = ($signed(_zz__zz_73_2) >>> _zz_70);
  assign _zz__zz_73_2 = {((_zz_19 == ShifterOp_sra_1) && _zz_72[31]),_zz_72};
  assign _zz__zz_78 = _zz_when_Decoder_l40_1[21 : 10];
  assign _zz__zz_80 = _zz_76;
  assign _zz__zz_80_1 = _zz_77;
  assign _zz__zz_27 = _zz_82;
  assign _zz__zz_52_port0 = _zz_52[_zz_when_Decoder_l40_4];
  always @(posedge clk) begin
    if(_zz_37) begin
      _zz_53[_zz_when_RegisterFile_l36_5] <= _zz_38;
    end
  end

  assign _zz__zz_53_port1 = _zz_53[_zz_when_Bypass_l27_7];
  assign _zz__zz_53_port2 = _zz_53[_zz_when_Bypass_l38_4];
  assign _zz__zz_53_port3 = _zz_53[_zz_when_Bypass_l27_6];
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
    case(_zz_19)
      ShifterOp_sll_1 : _zz_19_string = "sll_1";
      ShifterOp_srl_1 : _zz_19_string = "srl_1";
      ShifterOp_sra_1 : _zz_19_string = "sra_1";
      default : _zz_19_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_20)
      ShifterSrc2_rk : _zz_20_string = "rk ";
      ShifterSrc2_ui5 : _zz_20_string = "ui5";
      default : _zz_20_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_23)
      AluOp_add : _zz_23_string = "add  ";
      AluOp_sub : _zz_23_string = "sub  ";
      AluOp_and_1 : _zz_23_string = "and_1";
      AluOp_or_1 : _zz_23_string = "or_1 ";
      AluOp_nor_1 : _zz_23_string = "nor_1";
      AluOp_xor_1 : _zz_23_string = "xor_1";
      default : _zz_23_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_24)
      AluSrc2_rk : _zz_24_string = "rk ";
      AluSrc2_luc : _zz_24_string = "luc";
      default : _zz_24_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_26)
      AluSrc1_rj : _zz_26_string = "rj";
      AluSrc1_pc : _zz_26_string = "pc";
      default : _zz_26_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_40)
      ComparerSrc2_registerVal2 : _zz_40_string = "registerVal2";
      ComparerSrc2_si12 : _zz_40_string = "si12        ";
      default : _zz_40_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_41)
      ComparerOp_eq : _zz_41_string = "eq ";
      ComparerOp_ne : _zz_41_string = "ne ";
      ComparerOp_lt : _zz_41_string = "lt ";
      ComparerOp_ge : _zz_41_string = "ge ";
      ComparerOp_ltu : _zz_41_string = "ltu";
      ComparerOp_geu : _zz_41_string = "geu";
      default : _zz_41_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_43)
      ShifterSrc2_rk : _zz_43_string = "rk ";
      ShifterSrc2_ui5 : _zz_43_string = "ui5";
      default : _zz_43_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_44)
      ShifterOp_sll_1 : _zz_44_string = "sll_1";
      ShifterOp_srl_1 : _zz_44_string = "srl_1";
      ShifterOp_sra_1 : _zz_44_string = "sra_1";
      default : _zz_44_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_47)
      LucOp_si12 : _zz_47_string = "si12";
      LucOp_si20 : _zz_47_string = "si20";
      LucOp_ui12 : _zz_47_string = "ui12";
      default : _zz_47_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_48)
      AluSrc2_rk : _zz_48_string = "rk ";
      AluSrc2_luc : _zz_48_string = "luc";
      default : _zz_48_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_49)
      AluSrc1_rj : _zz_49_string = "rj";
      AluSrc1_pc : _zz_49_string = "pc";
      default : _zz_49_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_50)
      AluOp_add : _zz_50_string = "add  ";
      AluOp_sub : _zz_50_string = "sub  ";
      AluOp_and_1 : _zz_50_string = "and_1";
      AluOp_or_1 : _zz_50_string = "or_1 ";
      AluOp_nor_1 : _zz_50_string = "nor_1";
      AluOp_xor_1 : _zz_50_string = "xor_1";
      default : _zz_50_string = "?????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_22 = _zz_21;
    if(_zz_10) begin
      _zz_22 = _zz_68;
    end
    if(_zz_7) begin
      _zz_22 = _zz_75;
    end
  end

  always @(*) begin
    _zz_27 = ((_zz_when_Bypass_l27_6 != 5'h00) ? ((_zz_when_Bypass_l27_6 == _zz_when_RegisterFile_l36_5) ? _zz_38 : _zz__zz_53_port3) : 32'h00000000);
    if(_zz_46) begin
      _zz_27 = _zz_28;
    end
    if(_zz_39) begin
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
        _zz_31 = _zz_38;
      end
    end
    if(when_Bypass_l38_3) begin
      if(_zz_when_RegisterFile_l36_4) begin
        _zz_31 = _zz_32;
      end
    end
    if(when_Bypass_l38_4) begin
      if(_zz_when_RegisterFile_l36_6) begin
        _zz_31 = _zz_38;
      end
    end
    if(when_Bypass_l38_6) begin
      if(_zz_when_RegisterFile_l36_4) begin
        _zz_31 = _zz_32;
      end
    end
    if(when_Bypass_l38_7) begin
      if(_zz_when_RegisterFile_l36_6) begin
        _zz_31 = _zz_38;
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
          _zz_35 = _zz_38;
        end
      end
    end
  end

  always @(*) begin
    _zz_37 = 1'b0;
    if(when_RegisterFile_l36) begin
      _zz_37 = 1'b1;
    end
  end

  assign _zz_when_Decoder_l40_2 = _zz_when_Decoder_l40_3;
  assign _zz_when_Decoder_l40_4 = _zz_when_Decoder_l40_2[16 : 2];
  always @(*) begin
    _zz_51 = 1'b0;
    if(when_Decoder_l40) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_1) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_2) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_5) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_6) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_7) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_8) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_9) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_10) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_11) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_12) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_13) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_14) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_15) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_16) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_17) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_18) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_19) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_20) begin
      _zz_51 = 1'b1;
    end
    if(when_Decoder_l40_21) begin
      _zz_51 = 1'b1;
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
    _zz_50 = AluOp_add;
    if(when_Decoder_l40_1) begin
      _zz_50 = AluOp_sub;
    end
    if(when_Decoder_l40_5) begin
      _zz_50 = AluOp_and_1;
    end
    if(when_Decoder_l40_6) begin
      _zz_50 = AluOp_or_1;
    end
    if(when_Decoder_l40_7) begin
      _zz_50 = AluOp_nor_1;
    end
    if(when_Decoder_l40_8) begin
      _zz_50 = AluOp_xor_1;
    end
    if(when_Decoder_l40_9) begin
      _zz_50 = AluOp_and_1;
    end
    if(when_Decoder_l40_10) begin
      _zz_50 = AluOp_or_1;
    end
    if(when_Decoder_l40_11) begin
      _zz_50 = AluOp_xor_1;
    end
  end

  always @(*) begin
    _zz_49 = AluSrc1_rj;
    if(when_Decoder_l40_4) begin
      _zz_49 = AluSrc1_pc;
    end
  end

  always @(*) begin
    _zz_48 = AluSrc2_rk;
    if(when_Decoder_l40_2) begin
      _zz_48 = AluSrc2_luc;
    end
    if(when_Decoder_l40_4) begin
      _zz_48 = AluSrc2_luc;
    end
    if(when_Decoder_l40_9) begin
      _zz_48 = AluSrc2_luc;
    end
    if(when_Decoder_l40_10) begin
      _zz_48 = AluSrc2_luc;
    end
    if(when_Decoder_l40_11) begin
      _zz_48 = AluSrc2_luc;
    end
  end

  always @(*) begin
    _zz_47 = LucOp_si12;
    if(when_Decoder_l40_2) begin
      _zz_47 = LucOp_si12;
    end
    if(when_Decoder_l40_3) begin
      _zz_47 = LucOp_si20;
    end
    if(when_Decoder_l40_4) begin
      _zz_47 = LucOp_si20;
    end
    if(when_Decoder_l40_9) begin
      _zz_47 = LucOp_ui12;
    end
    if(when_Decoder_l40_10) begin
      _zz_47 = LucOp_ui12;
    end
    if(when_Decoder_l40_11) begin
      _zz_47 = LucOp_ui12;
    end
  end

  always @(*) begin
    _zz_46 = 1'b0;
    if(when_Decoder_l40_3) begin
      _zz_46 = 1'b1;
    end
  end

  always @(*) begin
    _zz_45 = 1'b0;
    if(when_Decoder_l40) begin
      _zz_45 = 1'b1;
    end
    if(when_Decoder_l40_1) begin
      _zz_45 = 1'b1;
    end
    if(when_Decoder_l40_2) begin
      _zz_45 = 1'b1;
    end
    if(when_Decoder_l40_4) begin
      _zz_45 = 1'b1;
    end
    if(when_Decoder_l40_5) begin
      _zz_45 = 1'b1;
    end
    if(when_Decoder_l40_6) begin
      _zz_45 = 1'b1;
    end
    if(when_Decoder_l40_7) begin
      _zz_45 = 1'b1;
    end
    if(when_Decoder_l40_8) begin
      _zz_45 = 1'b1;
    end
    if(when_Decoder_l40_9) begin
      _zz_45 = 1'b1;
    end
    if(when_Decoder_l40_10) begin
      _zz_45 = 1'b1;
    end
    if(when_Decoder_l40_11) begin
      _zz_45 = 1'b1;
    end
  end

  always @(*) begin
    _zz_44 = ShifterOp_sll_1;
    if(when_Decoder_l40_13) begin
      _zz_44 = ShifterOp_srl_1;
    end
    if(when_Decoder_l40_14) begin
      _zz_44 = ShifterOp_sra_1;
    end
    if(when_Decoder_l40_16) begin
      _zz_44 = ShifterOp_srl_1;
    end
    if(when_Decoder_l40_17) begin
      _zz_44 = ShifterOp_sra_1;
    end
  end

  always @(*) begin
    _zz_43 = ShifterSrc2_rk;
    if(when_Decoder_l40_15) begin
      _zz_43 = ShifterSrc2_ui5;
    end
    if(when_Decoder_l40_16) begin
      _zz_43 = ShifterSrc2_ui5;
    end
    if(when_Decoder_l40_17) begin
      _zz_43 = ShifterSrc2_ui5;
    end
  end

  always @(*) begin
    _zz_42 = 1'b0;
    if(when_Decoder_l40_12) begin
      _zz_42 = 1'b1;
    end
    if(when_Decoder_l40_13) begin
      _zz_42 = 1'b1;
    end
    if(when_Decoder_l40_14) begin
      _zz_42 = 1'b1;
    end
    if(when_Decoder_l40_15) begin
      _zz_42 = 1'b1;
    end
    if(when_Decoder_l40_16) begin
      _zz_42 = 1'b1;
    end
    if(when_Decoder_l40_17) begin
      _zz_42 = 1'b1;
    end
  end

  always @(*) begin
    _zz_41 = ComparerOp_lt;
    if(when_Decoder_l40_18) begin
      _zz_41 = ComparerOp_lt;
    end
    if(when_Decoder_l40_19) begin
      _zz_41 = ComparerOp_ltu;
    end
    if(when_Decoder_l40_20) begin
      _zz_41 = ComparerOp_lt;
    end
    if(when_Decoder_l40_21) begin
      _zz_41 = ComparerOp_ltu;
    end
  end

  always @(*) begin
    _zz_40 = ComparerSrc2_registerVal2;
    if(when_Decoder_l40_20) begin
      _zz_40 = ComparerSrc2_si12;
    end
    if(when_Decoder_l40_21) begin
      _zz_40 = ComparerSrc2_si12;
    end
  end

  always @(*) begin
    _zz_39 = 1'b0;
    if(when_Decoder_l40_18) begin
      _zz_39 = 1'b1;
    end
    if(when_Decoder_l40_19) begin
      _zz_39 = 1'b1;
    end
    if(when_Decoder_l40_20) begin
      _zz_39 = 1'b1;
    end
    if(when_Decoder_l40_21) begin
      _zz_39 = 1'b1;
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
    case(_zz_47)
      LucOp_si12 : begin
        _zz_63 = _zz__zz_63;
      end
      LucOp_si20 : begin
        _zz_63 = {_zz_when_Decoder_l40_1[24 : 5],12'h000};
      end
      default : begin
        _zz_63 = _zz__zz_63_2;
      end
    endcase
  end

  assign _zz_28 = _zz_63;
  always @(*) begin
    case(_zz_26)
      AluSrc1_rj : begin
        _zz_66 = _zz_34;
      end
      default : begin
        _zz_66 = _zz_25;
      end
    endcase
  end

  assign _zz_64 = _zz_66;
  always @(*) begin
    case(_zz_24)
      AluSrc2_rk : begin
        _zz_67 = _zz_30;
      end
      default : begin
        _zz_67 = _zz_6;
      end
    endcase
  end

  assign _zz_65 = _zz_67;
  always @(*) begin
    case(_zz_23)
      AluOp_add : begin
        _zz_68 = _zz__zz_68;
      end
      AluOp_sub : begin
        _zz_68 = _zz__zz_68_1;
      end
      AluOp_and_1 : begin
        _zz_68 = (_zz_64 & _zz_65);
      end
      AluOp_or_1 : begin
        _zz_68 = (_zz_64 | _zz_65);
      end
      AluOp_nor_1 : begin
        _zz_68 = (~ (_zz_64 | _zz_65));
      end
      default : begin
        _zz_68 = (_zz_64 ^ _zz_65);
      end
    endcase
  end

  assign _zz_54 = _zz_2;
  assign _zz_55 = _zz_when_RegisterFile_l36_6;
  assign _zz_56 = _zz_when_RegisterFile_l36_5;
  assign _zz_57 = _zz_38;
  assign _zz_69 = _zz_34;
  always @(*) begin
    case(_zz_20)
      ShifterSrc2_rk : begin
        _zz_70 = _zz_30[4 : 0];
      end
      default : begin
        _zz_70 = _zz_when_Bypass_l38_3;
      end
    endcase
  end

  always @(*) begin
    _zz_71[0] = _zz_69[31];
    _zz_71[1] = _zz_69[30];
    _zz_71[2] = _zz_69[29];
    _zz_71[3] = _zz_69[28];
    _zz_71[4] = _zz_69[27];
    _zz_71[5] = _zz_69[26];
    _zz_71[6] = _zz_69[25];
    _zz_71[7] = _zz_69[24];
    _zz_71[8] = _zz_69[23];
    _zz_71[9] = _zz_69[22];
    _zz_71[10] = _zz_69[21];
    _zz_71[11] = _zz_69[20];
    _zz_71[12] = _zz_69[19];
    _zz_71[13] = _zz_69[18];
    _zz_71[14] = _zz_69[17];
    _zz_71[15] = _zz_69[16];
    _zz_71[16] = _zz_69[15];
    _zz_71[17] = _zz_69[14];
    _zz_71[18] = _zz_69[13];
    _zz_71[19] = _zz_69[12];
    _zz_71[20] = _zz_69[11];
    _zz_71[21] = _zz_69[10];
    _zz_71[22] = _zz_69[9];
    _zz_71[23] = _zz_69[8];
    _zz_71[24] = _zz_69[7];
    _zz_71[25] = _zz_69[6];
    _zz_71[26] = _zz_69[5];
    _zz_71[27] = _zz_69[4];
    _zz_71[28] = _zz_69[3];
    _zz_71[29] = _zz_69[2];
    _zz_71[30] = _zz_69[1];
    _zz_71[31] = _zz_69[0];
  end

  always @(*) begin
    case(_zz_19)
      ShifterOp_sll_1 : begin
        _zz_72 = _zz_71;
      end
      default : begin
        _zz_72 = _zz_69;
      end
    endcase
  end

  assign _zz_73 = _zz__zz_73[31 : 0];
  always @(*) begin
    _zz_74[0] = _zz_73[31];
    _zz_74[1] = _zz_73[30];
    _zz_74[2] = _zz_73[29];
    _zz_74[3] = _zz_73[28];
    _zz_74[4] = _zz_73[27];
    _zz_74[5] = _zz_73[26];
    _zz_74[6] = _zz_73[25];
    _zz_74[7] = _zz_73[24];
    _zz_74[8] = _zz_73[23];
    _zz_74[9] = _zz_73[22];
    _zz_74[10] = _zz_73[21];
    _zz_74[11] = _zz_73[20];
    _zz_74[12] = _zz_73[19];
    _zz_74[13] = _zz_73[18];
    _zz_74[14] = _zz_73[17];
    _zz_74[15] = _zz_73[16];
    _zz_74[16] = _zz_73[15];
    _zz_74[17] = _zz_73[14];
    _zz_74[18] = _zz_73[13];
    _zz_74[19] = _zz_73[12];
    _zz_74[20] = _zz_73[11];
    _zz_74[21] = _zz_73[10];
    _zz_74[22] = _zz_73[9];
    _zz_74[23] = _zz_73[8];
    _zz_74[24] = _zz_73[7];
    _zz_74[25] = _zz_73[6];
    _zz_74[26] = _zz_73[5];
    _zz_74[27] = _zz_73[4];
    _zz_74[28] = _zz_73[3];
    _zz_74[29] = _zz_73[2];
    _zz_74[30] = _zz_73[1];
    _zz_74[31] = _zz_73[0];
  end

  always @(*) begin
    case(_zz_19)
      ShifterOp_sll_1 : begin
        _zz_75 = _zz_74;
      end
      default : begin
        _zz_75 = _zz_73;
      end
    endcase
  end

  assign _zz_76 = _zz_18;
  always @(*) begin
    case(_zz_40)
      ComparerSrc2_registerVal2 : begin
        _zz_78 = _zz_17;
      end
      default : begin
        _zz_78 = {20'd0, _zz__zz_78};
      end
    endcase
  end

  assign _zz_77 = _zz_78;
  assign _zz_79 = (_zz_76 == _zz_77);
  assign _zz_80 = ($signed(_zz__zz_80) < $signed(_zz__zz_80_1));
  assign _zz_81 = (_zz_76 < _zz_77);
  always @(*) begin
    case(_zz_41)
      ComparerOp_eq : begin
        _zz_82 = _zz_79;
      end
      ComparerOp_ne : begin
        _zz_82 = (! _zz_79);
      end
      ComparerOp_lt : begin
        _zz_82 = _zz_80;
      end
      ComparerOp_ge : begin
        _zz_82 = (! _zz_80);
      end
      ComparerOp_ltu : begin
        _zz_82 = _zz_81;
      end
      default : begin
        _zz_82 = (! _zz_81);
      end
    endcase
  end

  assign fetch_up_ready = fetch_down_isReady;
  assign decode_up_ready = decode_down_isReady;
  assign _zz_when_Decoder_l40_1 = _zz_when_Decoder_l40;
  assign _zz_18 = ((_zz_when_Bypass_l27_7 != 5'h00) ? ((_zz_when_Bypass_l27_7 == _zz_when_RegisterFile_l36_5) ? _zz_38 : _zz__zz_53_port1) : 32'h00000000);
  assign _zz_17 = ((_zz_when_Bypass_l38_4 != 5'h00) ? ((_zz_when_Bypass_l38_4 == _zz_when_RegisterFile_l36_5) ? _zz_38 : _zz__zz_53_port2) : 32'h00000000);
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
  assign _zz_25 = _zz_15;
  assign _zz_36 = _zz_14;
  assign _zz_when_Bypass_l27_5 = _zz_when_Bypass_l27_3;
  assign _zz_when_Bypass_l38_3 = _zz_when_Bypass_l38_1;
  assign _zz_23 = _zz_13;
  assign _zz_26 = _zz_12;
  assign _zz_24 = _zz_11;
  assign _zz_19 = _zz_9;
  assign _zz_20 = _zz_8;
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
  assign _zz_38 = _zz_1;
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
      _zz_when_Decoder_l40 <= _zz__zz_52_port0;
    end
    if(decode_down_isReady) begin
      _zz_15 <= _zz_16;
      _zz_33 <= _zz_18;
      _zz_29 <= _zz_17;
      _zz_21 <= _zz_27;
      _zz_14 <= _zz_51;
      _zz_when_Bypass_l27_3 <= _zz_when_Bypass_l27_7;
      _zz_when_Bypass_l38_1 <= _zz_when_Bypass_l38_4;
      _zz_when_RegisterFile_l36_3 <= _zz_when_RegisterFile_l36_7;
      _zz_when_Bypass_l27_2 <= _zz_when_Bypass_l27_6;
      _zz_13 <= _zz_50;
      _zz_12 <= _zz_49;
      _zz_11 <= _zz_48;
      _zz_10 <= _zz_45;
      _zz_9 <= _zz_44;
      _zz_8 <= _zz_43;
      _zz_7 <= _zz_42;
      _zz_6 <= _zz_28;
    end
    if(execute_down_isReady) begin
      _zz_5 <= _zz_25;
      _zz_4 <= _zz_22;
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
