// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : LAS32
// Git hash  : 04abf5b7cce341bd9423c9794043e1819fc639e3

`timescale 1ns/1ps

module LAS32 (
  output wire [31:0]   _zz_37,
  output wire          _zz_38,
  output wire [4:0]    _zz_39,
  output wire [31:0]   _zz_40,
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
  localparam NpcOp_pc4 = 2'd0;
  localparam NpcOp_offs16 = 2'd1;
  localparam NpcOp_offs26 = 2'd2;

  wire       [31:0]   _zz__zz_35_port0;
  wire       [31:0]   _zz__zz_36_port1;
  wire       [31:0]   _zz__zz_36_port2;
  wire       [31:0]   _zz__zz_36_port3;
  wire       [31:0]   _zz__zz_when_Decoder_l41_7;
  wire       [31:0]   _zz__zz_when_Decoder_l41_7_1;
  wire       [31:0]   _zz__zz_when_Decoder_l41_7_2;
  wire       [17:0]   _zz__zz_when_Decoder_l41_7_3;
  wire       [17:0]   _zz__zz_when_Decoder_l41_7_4;
  wire       [31:0]   _zz__zz_when_Decoder_l41_7_5;
  wire       [31:0]   _zz__zz_when_Decoder_l41_7_6;
  wire       [31:0]   _zz__zz_when_Decoder_l41_7_7;
  wire       [27:0]   _zz__zz_when_Decoder_l41_7_8;
  wire       [31:0]   _zz__zz_when_Pc_l134_21;
  wire       [0:0]    _zz__zz_when_Bypass_l26_6;
  wire       [31:0]   _zz__zz_when_Pc_l134_25;
  wire       [11:0]   _zz__zz_when_Pc_l134_25_1;
  wire       [31:0]   _zz__zz_when_Pc_l134_25_2;
  wire       [11:0]   _zz__zz_when_Pc_l134_25_3;
  wire       [31:0]   _zz__zz_when_Pc_l134_30;
  wire       [31:0]   _zz__zz_when_Pc_l134_30_1;
  wire       [32:0]   _zz__zz_when_Pc_l134_35;
  wire       [32:0]   _zz__zz_when_Pc_l134_35_1;
  wire       [32:0]   _zz__zz_when_Pc_l134_35_2;
  wire       [11:0]   _zz__zz_when_Pc_l134_40;
  wire       [31:0]   _zz__zz_when_Pc_l134_42;
  wire       [31:0]   _zz__zz_when_Pc_l134_42_1;
  wire       [0:0]    _zz__zz_when_Pc_l134_21_1;
  wire                write_up_isReady;
  wire                memory_down_isValid;
  wire                memory_up_isValid;
  wire                execute_down_isValid;
  wire                execute_up_isValid;
  wire                decode_down_isValid;
  wire                decode_up_isValid;
  reg        [4:0]    _zz_when_RegisterFile_l36;
  reg                 _zz_when_RegisterFile_l36_1;
  reg        [31:0]   _zz_when_Pc_l134;
  reg        [31:0]   _zz_1;
  reg        [4:0]    _zz_when_Bypass_l26;
  reg                 _zz_when_RegisterFile_l36_2;
  reg        [4:0]    _zz_when_Bypass_l39;
  reg        [4:0]    _zz_when_Bypass_l26_1;
  reg                 _zz_2;
  reg                 _zz_3;
  reg        [31:0]   _zz_when_Pc_l134_1;
  reg        [31:0]   _zz_4;
  wire                memory_down_isReady;
  reg        [31:0]   _zz_when_Pc_l134_2;
  reg                 _zz_5;
  reg        [0:0]    _zz_6;
  reg        [1:0]    _zz_when_Pc_l134_3;
  reg                 _zz_7;
  reg        [0:0]    _zz_8;
  reg        [0:0]    _zz_9;
  reg        [2:0]    _zz_10;
  reg        [4:0]    _zz_when_Bypass_l26_2;
  reg                 _zz_when_RegisterFile_l36_3;
  reg        [4:0]    _zz_when_Bypass_l39_1;
  reg        [4:0]    _zz_when_Bypass_l26_3;
  reg                 _zz_11;
  reg                 _zz_12;
  reg        [31:0]   _zz_when_Pc_l134_4;
  wire                execute_down_isReady;
  reg                 execute_up_valid;
  reg        [31:0]   _zz_when_Decoder_l41;
  reg        [31:0]   _zz_when_Decoder_l41_1;
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
  wire       [31:0]   _zz_when_Pc_l134_5;
  wire       [31:0]   _zz_when_Pc_l134_6;
  wire       [1:0]    _zz_when_Pc_l134_7;
  wire       [0:0]    _zz_13;
  reg        [31:0]   _zz_when_Pc_l134_8;
  reg        [31:0]   _zz_when_Pc_l134_9;
  wire       [2:0]    _zz_14;
  wire       [0:0]    _zz_15;
  wire       [31:0]   _zz_when_Pc_l134_10;
  wire       [0:0]    _zz_16;
  wire       [31:0]   _zz_when_Pc_l134_11;
  reg                 _zz_memory_haltRequest_Bypass_l43;
  reg                 _zz_execute_haltRequest_Bypass_l43;
  reg                 _zz_execute_haltRequest_Bypass_l43_1;
  reg        [31:0]   _zz_when_Pc_l134_12;
  wire       [31:0]   _zz_when_Pc_l134_13;
  reg        [31:0]   _zz_when_Pc_l134_14;
  wire       [4:0]    _zz_when_Bypass_l39_2;
  wire                _zz_17;
  reg                 _zz_memory_haltRequest_Bypass_l30;
  reg                 _zz_execute_haltRequest_Bypass_l30;
  wire       [31:0]   _zz_when_Pc_l134_15;
  wire                _zz_when_RegisterFile_l36_4;
  wire       [4:0]    _zz_when_Bypass_l26_4;
  reg                 _zz_execute_haltRequest_Bypass_l30_1;
  reg        [31:0]   _zz_when_Pc_l134_16;
  wire       [31:0]   _zz_when_Pc_l134_17;
  reg        [31:0]   _zz_when_Pc_l134_18;
  wire       [4:0]    _zz_when_Bypass_l26_5;
  wire                _zz_18;
  reg                 _zz_19;
  wire       [31:0]   _zz_when_Pc_l134_19;
  wire                write_up_isValid;
  wire                write_up_isFiring;
  wire       [4:0]    _zz_when_RegisterFile_l36_5;
  wire                _zz_when_RegisterFile_l36_6;
  reg                 _zz_20;
  reg        [0:0]    _zz_21;
  reg        [2:0]    _zz_22;
  reg                 _zz_23;
  reg        [0:0]    _zz_24;
  reg        [1:0]    _zz_when_Pc_l134_20;
  reg                 _zz_25;
  reg                 _zz_26;
  reg        [1:0]    _zz_27;
  reg        [0:0]    _zz_28;
  reg        [0:0]    _zz_29;
  reg        [2:0]    _zz_30;
  reg        [4:0]    _zz_when_Bypass_l26_6;
  reg                 _zz_when_RegisterFile_l36_7;
  reg        [4:0]    _zz_when_Bypass_l39_3;
  wire       [4:0]    _zz_when_Bypass_l26_7;
  reg                 _zz_31;
  reg                 _zz_32;
  reg        [31:0]   _zz_when_Pc_l134_21;
  reg                 _zz_33;
  wire       [31:0]   _zz_when_Decoder_l41_2;
  wire       [31:0]   _zz_when_Decoder_l41_3;
  reg        [1:0]    _zz_34;
  reg                 _zz_when_Pc_l134_22;
  wire                _zz_when_Pc_l134_23;
  reg                 _zz_when_Pc_l134_24;
  wire       [31:0]   _zz_when_Decoder_l41_4;
  reg        [31:0]   _zz_when_Decoder_l41_5;
  reg        [31:0]   _zz_when_Decoder_l41_6;
  wire                when_Pc_l134;
  reg        [31:0]   _zz_when_Decoder_l41_7;
  wire       [14:0]   _zz_when_Decoder_l41_8;
  wire                when_Decoder_l41;
  wire                when_Decoder_l41_1;
  wire                when_Decoder_l41_2;
  wire                when_Decoder_l41_3;
  wire                when_Decoder_l41_4;
  wire                when_Decoder_l41_5;
  wire                when_Decoder_l41_6;
  wire                when_Decoder_l41_7;
  wire                when_Decoder_l41_8;
  wire                when_Decoder_l41_9;
  wire                when_Decoder_l41_10;
  wire                when_Decoder_l41_11;
  wire                when_Decoder_l41_12;
  wire                when_Decoder_l41_13;
  wire                when_Decoder_l41_14;
  wire                when_Decoder_l41_15;
  wire                when_Decoder_l41_16;
  wire                when_Decoder_l41_17;
  wire                when_Decoder_l41_18;
  wire                when_Decoder_l41_19;
  wire                when_Decoder_l41_20;
  wire                when_Decoder_l41_21;
  wire                when_Decoder_l41_22;
  wire                when_Decoder_l41_23;
  wire                when_Decoder_l41_24;
  wire                when_Decoder_l41_25;
  wire                when_Decoder_l41_26;
  wire                when_Decoder_l41_27;
  wire                when_Decoder_l41_28;
  wire                when_Decoder_l41_29;
  wire                when_Decoder_l41_30;
  wire                when_RegisterFile_l36;
  wire                when_Bypass_l26;
  wire                execute_haltRequest_Bypass_l30;
  wire                when_Bypass_l26_1;
  wire                execute_haltRequest_Bypass_l30_1;
  wire                when_Bypass_l26_2;
  wire                memory_haltRequest_Bypass_l30;
  wire                when_Bypass_l39;
  wire                execute_haltRequest_Bypass_l43;
  wire                when_Bypass_l39_1;
  wire                execute_haltRequest_Bypass_l43_1;
  wire                when_Bypass_l39_2;
  wire                memory_haltRequest_Bypass_l43;
  reg        [31:0]   _zz_when_Pc_l134_25;
  wire       [31:0]   _zz_when_Pc_l134_26;
  wire       [31:0]   _zz_when_Pc_l134_27;
  reg        [31:0]   _zz_when_Pc_l134_28;
  reg        [31:0]   _zz_when_Pc_l134_29;
  reg        [31:0]   _zz_when_Pc_l134_30;
  wire       [31:0]   _zz_when_Pc_l134_31;
  reg        [4:0]    _zz_when_Pc_l134_32;
  reg        [31:0]   _zz_when_Pc_l134_33;
  reg        [31:0]   _zz_when_Pc_l134_34;
  wire       [31:0]   _zz_when_Pc_l134_35;
  reg        [31:0]   _zz_when_Pc_l134_36;
  reg        [31:0]   _zz_when_Pc_l134_37;
  wire       [31:0]   _zz_when_Pc_l134_38;
  wire       [31:0]   _zz_when_Pc_l134_39;
  reg        [31:0]   _zz_when_Pc_l134_40;
  wire                _zz_when_Pc_l134_41;
  wire                _zz_when_Pc_l134_42;
  wire                _zz_when_Pc_l134_43;
  reg                 _zz_when_Pc_l134_44;
  wire                when_CtrlLink_l151;
  wire                when_CtrlLink_l151_1;
  wire                when_StageLink_l67;
  wire                when_StageLink_l67_1;
  wire                when_StageLink_l67_2;
  `ifndef SYNTHESIS
  reg [23:0] _zz_6_string;
  reg [39:0] _zz_when_Pc_l134_3_string;
  reg [23:0] _zz_8_string;
  reg [15:0] _zz_9_string;
  reg [39:0] _zz_10_string;
  reg [39:0] _zz_when_Pc_l134_7_string;
  reg [23:0] _zz_13_string;
  reg [39:0] _zz_14_string;
  reg [23:0] _zz_15_string;
  reg [15:0] _zz_16_string;
  reg [95:0] _zz_21_string;
  reg [23:0] _zz_22_string;
  reg [23:0] _zz_24_string;
  reg [39:0] _zz_when_Pc_l134_20_string;
  reg [31:0] _zz_27_string;
  reg [23:0] _zz_28_string;
  reg [15:0] _zz_29_string;
  reg [39:0] _zz_30_string;
  reg [47:0] _zz_34_string;
  `endif

  reg [31:0] _zz_35 [0:32767];
  (* ram_style = "distributed" *) reg [31:0] _zz_36 [0:31];

  assign _zz__zz_when_Decoder_l41_7 = ($signed(_zz__zz_when_Decoder_l41_7_1) + $signed(_zz__zz_when_Decoder_l41_7_2));
  assign _zz__zz_when_Decoder_l41_7_1 = _zz_when_Decoder_l41_3;
  assign _zz__zz_when_Decoder_l41_7_3 = _zz__zz_when_Decoder_l41_7_4;
  assign _zz__zz_when_Decoder_l41_7_2 = {{14{_zz__zz_when_Decoder_l41_7_3[17]}}, _zz__zz_when_Decoder_l41_7_3};
  assign _zz__zz_when_Decoder_l41_7_4 = ({2'd0,_zz_when_Decoder_l41_2[25 : 10]} <<< 2'd2);
  assign _zz__zz_when_Decoder_l41_7_5 = ($signed(_zz__zz_when_Decoder_l41_7_6) + $signed(_zz__zz_when_Decoder_l41_7_7));
  assign _zz__zz_when_Decoder_l41_7_6 = _zz_when_Decoder_l41_3;
  assign _zz__zz_when_Decoder_l41_7_8 = {{_zz_when_Decoder_l41_2[9 : 0],_zz_when_Decoder_l41_2[25 : 10]},2'b00};
  assign _zz__zz_when_Decoder_l41_7_7 = {{4{_zz__zz_when_Decoder_l41_7_8[27]}}, _zz__zz_when_Decoder_l41_7_8};
  assign _zz__zz_when_Pc_l134_21 = (_zz_when_Decoder_l41_3 + 32'h00000004);
  assign _zz__zz_when_Bypass_l26_6 = 1'b1;
  assign _zz__zz_when_Pc_l134_25_1 = _zz_when_Decoder_l41_2[21 : 10];
  assign _zz__zz_when_Pc_l134_25 = {{20{_zz__zz_when_Pc_l134_25_1[11]}}, _zz__zz_when_Pc_l134_25_1};
  assign _zz__zz_when_Pc_l134_25_3 = _zz_when_Decoder_l41_2[21 : 10];
  assign _zz__zz_when_Pc_l134_25_2 = {20'd0, _zz__zz_when_Pc_l134_25_3};
  assign _zz__zz_when_Pc_l134_30 = (_zz_when_Pc_l134_26 + _zz_when_Pc_l134_27);
  assign _zz__zz_when_Pc_l134_30_1 = (_zz_when_Pc_l134_26 - _zz_when_Pc_l134_27);
  assign _zz__zz_when_Pc_l134_35 = _zz__zz_when_Pc_l134_35_1;
  assign _zz__zz_when_Pc_l134_35_1 = ($signed(_zz__zz_when_Pc_l134_35_2) >>> _zz_when_Pc_l134_32);
  assign _zz__zz_when_Pc_l134_35_2 = {((_zz_when_Pc_l134_7 == ShifterOp_sra_1) && _zz_when_Pc_l134_34[31]),_zz_when_Pc_l134_34};
  assign _zz__zz_when_Pc_l134_40 = _zz_when_Decoder_l41_2[21 : 10];
  assign _zz__zz_when_Pc_l134_42 = _zz_when_Pc_l134_38;
  assign _zz__zz_when_Pc_l134_42_1 = _zz_when_Pc_l134_39;
  assign _zz__zz_when_Pc_l134_21_1 = _zz_when_Pc_l134_23;
  assign _zz__zz_35_port0 = _zz_35[_zz_when_Decoder_l41_8];
  always @(posedge clk) begin
    if(_zz_19) begin
      _zz_36[_zz_when_RegisterFile_l36_5] <= _zz_when_Pc_l134_19;
    end
  end

  assign _zz__zz_36_port1 = _zz_36[_zz_when_Bypass_l26_7];
  assign _zz__zz_36_port2 = _zz_36[_zz_when_Bypass_l39_3];
  assign _zz__zz_36_port3 = _zz_36[_zz_when_Bypass_l26_6];
  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_6)
      ShifterSrc2_rk : _zz_6_string = "rk ";
      ShifterSrc2_ui5 : _zz_6_string = "ui5";
      default : _zz_6_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_when_Pc_l134_3)
      ShifterOp_sll_1 : _zz_when_Pc_l134_3_string = "sll_1";
      ShifterOp_srl_1 : _zz_when_Pc_l134_3_string = "srl_1";
      ShifterOp_sra_1 : _zz_when_Pc_l134_3_string = "sra_1";
      default : _zz_when_Pc_l134_3_string = "?????";
    endcase
  end
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
      AluOp_and_1 : _zz_10_string = "and_1";
      AluOp_or_1 : _zz_10_string = "or_1 ";
      AluOp_nor_1 : _zz_10_string = "nor_1";
      AluOp_xor_1 : _zz_10_string = "xor_1";
      default : _zz_10_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_when_Pc_l134_7)
      ShifterOp_sll_1 : _zz_when_Pc_l134_7_string = "sll_1";
      ShifterOp_srl_1 : _zz_when_Pc_l134_7_string = "srl_1";
      ShifterOp_sra_1 : _zz_when_Pc_l134_7_string = "sra_1";
      default : _zz_when_Pc_l134_7_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_13)
      ShifterSrc2_rk : _zz_13_string = "rk ";
      ShifterSrc2_ui5 : _zz_13_string = "ui5";
      default : _zz_13_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_14)
      AluOp_add : _zz_14_string = "add  ";
      AluOp_sub : _zz_14_string = "sub  ";
      AluOp_and_1 : _zz_14_string = "and_1";
      AluOp_or_1 : _zz_14_string = "or_1 ";
      AluOp_nor_1 : _zz_14_string = "nor_1";
      AluOp_xor_1 : _zz_14_string = "xor_1";
      default : _zz_14_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_15)
      AluSrc2_rk : _zz_15_string = "rk ";
      AluSrc2_luc : _zz_15_string = "luc";
      default : _zz_15_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_16)
      AluSrc1_rj : _zz_16_string = "rj";
      AluSrc1_pc : _zz_16_string = "pc";
      default : _zz_16_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_21)
      ComparerSrc2_registerVal2 : _zz_21_string = "registerVal2";
      ComparerSrc2_si12 : _zz_21_string = "si12        ";
      default : _zz_21_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_22)
      ComparerOp_eq : _zz_22_string = "eq ";
      ComparerOp_ne : _zz_22_string = "ne ";
      ComparerOp_lt : _zz_22_string = "lt ";
      ComparerOp_ge : _zz_22_string = "ge ";
      ComparerOp_ltu : _zz_22_string = "ltu";
      ComparerOp_geu : _zz_22_string = "geu";
      default : _zz_22_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_24)
      ShifterSrc2_rk : _zz_24_string = "rk ";
      ShifterSrc2_ui5 : _zz_24_string = "ui5";
      default : _zz_24_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_when_Pc_l134_20)
      ShifterOp_sll_1 : _zz_when_Pc_l134_20_string = "sll_1";
      ShifterOp_srl_1 : _zz_when_Pc_l134_20_string = "srl_1";
      ShifterOp_sra_1 : _zz_when_Pc_l134_20_string = "sra_1";
      default : _zz_when_Pc_l134_20_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_27)
      LucOp_si12 : _zz_27_string = "si12";
      LucOp_si20 : _zz_27_string = "si20";
      LucOp_ui12 : _zz_27_string = "ui12";
      default : _zz_27_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_28)
      AluSrc2_rk : _zz_28_string = "rk ";
      AluSrc2_luc : _zz_28_string = "luc";
      default : _zz_28_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_29)
      AluSrc1_rj : _zz_29_string = "rj";
      AluSrc1_pc : _zz_29_string = "pc";
      default : _zz_29_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_30)
      AluOp_add : _zz_30_string = "add  ";
      AluOp_sub : _zz_30_string = "sub  ";
      AluOp_and_1 : _zz_30_string = "and_1";
      AluOp_or_1 : _zz_30_string = "or_1 ";
      AluOp_nor_1 : _zz_30_string = "nor_1";
      AluOp_xor_1 : _zz_30_string = "xor_1";
      default : _zz_30_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_34)
      NpcOp_pc4 : _zz_34_string = "pc4   ";
      NpcOp_offs16 : _zz_34_string = "offs16";
      NpcOp_offs26 : _zz_34_string = "offs26";
      default : _zz_34_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_when_Pc_l134_9 = _zz_when_Pc_l134_8;
    if(_zz_7) begin
      _zz_when_Pc_l134_9 = _zz_when_Pc_l134_30;
    end
    if(_zz_5) begin
      _zz_when_Pc_l134_9 = _zz_when_Pc_l134_37;
    end
  end

  always @(*) begin
    _zz_memory_haltRequest_Bypass_l43 = 1'b0;
    if(_zz_2) begin
      if(when_Bypass_l39_2) begin
        if(!_zz_when_RegisterFile_l36_6) begin
          _zz_memory_haltRequest_Bypass_l43 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l43 = 1'b0;
    if(_zz_17) begin
      if(when_Bypass_l39_1) begin
        if(!_zz_when_RegisterFile_l36_4) begin
          _zz_execute_haltRequest_Bypass_l43 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l43_1 = 1'b0;
    if(_zz_17) begin
      if(when_Bypass_l39) begin
        if(!_zz_when_RegisterFile_l36_6) begin
          _zz_execute_haltRequest_Bypass_l43_1 = 1'b1;
        end
      end
    end
  end

  assign _zz_when_Pc_l134_13 = _zz_when_Pc_l134_14;
  always @(*) begin
    _zz_when_Pc_l134_14 = _zz_when_Pc_l134_12;
    if(_zz_17) begin
      if(when_Bypass_l39) begin
        if(_zz_when_RegisterFile_l36_6) begin
          _zz_when_Pc_l134_14 = _zz_when_Pc_l134_19;
        end
      end
      if(when_Bypass_l39_1) begin
        if(_zz_when_RegisterFile_l36_4) begin
          _zz_when_Pc_l134_14 = _zz_when_Pc_l134_15;
        end
      end
    end
  end

  always @(*) begin
    _zz_memory_haltRequest_Bypass_l30 = 1'b0;
    if(_zz_3) begin
      if(when_Bypass_l26_2) begin
        if(!_zz_when_RegisterFile_l36_6) begin
          _zz_memory_haltRequest_Bypass_l30 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l30 = 1'b0;
    if(_zz_18) begin
      if(when_Bypass_l26_1) begin
        if(!_zz_when_RegisterFile_l36_4) begin
          _zz_execute_haltRequest_Bypass_l30 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l30_1 = 1'b0;
    if(_zz_18) begin
      if(when_Bypass_l26) begin
        if(!_zz_when_RegisterFile_l36_6) begin
          _zz_execute_haltRequest_Bypass_l30_1 = 1'b1;
        end
      end
    end
  end

  assign _zz_when_Pc_l134_17 = _zz_when_Pc_l134_18;
  always @(*) begin
    _zz_when_Pc_l134_18 = _zz_when_Pc_l134_16;
    if(_zz_18) begin
      if(when_Bypass_l26) begin
        if(_zz_when_RegisterFile_l36_6) begin
          _zz_when_Pc_l134_18 = _zz_when_Pc_l134_19;
        end
      end
      if(when_Bypass_l26_1) begin
        if(_zz_when_RegisterFile_l36_4) begin
          _zz_when_Pc_l134_18 = _zz_when_Pc_l134_15;
        end
      end
    end
  end

  always @(*) begin
    _zz_19 = 1'b0;
    if(when_RegisterFile_l36) begin
      _zz_19 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Pc_l134_21 = ((_zz_when_Bypass_l26_6 != 5'h00) ? ((_zz_when_Bypass_l26_6 == _zz_when_RegisterFile_l36_5) ? _zz_when_Pc_l134_19 : _zz__zz_36_port3) : 32'h00000000);
    if(_zz_33) begin
      _zz_when_Pc_l134_21 = _zz__zz_when_Pc_l134_21;
    end
    if(_zz_26) begin
      _zz_when_Pc_l134_21 = _zz_when_Pc_l134_11;
    end
    if(_zz_20) begin
      _zz_when_Pc_l134_21 = {31'd0, _zz__zz_when_Pc_l134_21_1};
    end
  end

  assign _zz_when_Decoder_l41_4 = _zz_when_Decoder_l41_6;
  always @(*) begin
    _zz_when_Decoder_l41_5 = (_zz_when_Decoder_l41_4 + 32'h00000004);
    if(when_Pc_l134) begin
      _zz_when_Decoder_l41_5 = _zz_when_Decoder_l41_7;
    end
  end

  assign when_Pc_l134 = (_zz_when_Pc_l134_24 && (_zz_when_Pc_l134_23 || _zz_when_Pc_l134_22));
  always @(*) begin
    case(_zz_34)
      NpcOp_pc4 : begin
        _zz_when_Decoder_l41_7 = (_zz_when_Decoder_l41_4 + 32'h00000004);
      end
      NpcOp_offs16 : begin
        _zz_when_Decoder_l41_7 = _zz__zz_when_Decoder_l41_7;
      end
      default : begin
        _zz_when_Decoder_l41_7 = _zz__zz_when_Decoder_l41_7_5;
      end
    endcase
  end

  assign _zz_when_Decoder_l41_8 = _zz_when_Decoder_l41_4[16 : 2];
  always @(*) begin
    _zz_34 = NpcOp_pc4;
    if(when_Decoder_l41_6) begin
      _zz_34 = NpcOp_offs26;
    end
    if(when_Decoder_l41_7) begin
      _zz_34 = NpcOp_offs26;
    end
    if(when_Decoder_l41_8) begin
      _zz_34 = NpcOp_offs16;
    end
  end

  always @(*) begin
    _zz_when_Pc_l134_24 = 1'b0;
    if(when_Decoder_l41) begin
      _zz_when_Pc_l134_24 = 1'b1;
    end
    if(when_Decoder_l41_1) begin
      _zz_when_Pc_l134_24 = 1'b1;
    end
    if(when_Decoder_l41_2) begin
      _zz_when_Pc_l134_24 = 1'b1;
    end
    if(when_Decoder_l41_3) begin
      _zz_when_Pc_l134_24 = 1'b1;
    end
    if(when_Decoder_l41_4) begin
      _zz_when_Pc_l134_24 = 1'b1;
    end
    if(when_Decoder_l41_5) begin
      _zz_when_Pc_l134_24 = 1'b1;
    end
    if(when_Decoder_l41_6) begin
      _zz_when_Pc_l134_24 = 1'b1;
    end
    if(when_Decoder_l41_7) begin
      _zz_when_Pc_l134_24 = 1'b1;
    end
    if(when_Decoder_l41_8) begin
      _zz_when_Pc_l134_24 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Pc_l134_22 = 1'b0;
    if(when_Decoder_l41_6) begin
      _zz_when_Pc_l134_22 = 1'b1;
    end
    if(when_Decoder_l41_7) begin
      _zz_when_Pc_l134_22 = 1'b1;
    end
    if(when_Decoder_l41_8) begin
      _zz_when_Pc_l134_22 = 1'b1;
    end
  end

  always @(*) begin
    _zz_33 = 1'b0;
    if(when_Decoder_l41_7) begin
      _zz_33 = 1'b1;
    end
    if(when_Decoder_l41_8) begin
      _zz_33 = 1'b1;
    end
  end

  always @(*) begin
    _zz_32 = 1'b0;
    if(when_Decoder_l41) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_1) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_2) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_3) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_4) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_5) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_9) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_10) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_11) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_14) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_15) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_16) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_17) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_18) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_19) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_20) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_21) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_22) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_23) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_24) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_25) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_26) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_27) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_28) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_29) begin
      _zz_32 = 1'b1;
    end
    if(when_Decoder_l41_30) begin
      _zz_32 = 1'b1;
    end
  end

  always @(*) begin
    _zz_31 = 1'b0;
    if(when_Decoder_l41) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_1) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_2) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_3) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_4) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_5) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_9) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_10) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_14) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_15) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_16) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_17) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_21) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_22) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_23) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_27) begin
      _zz_31 = 1'b1;
    end
    if(when_Decoder_l41_28) begin
      _zz_31 = 1'b1;
    end
  end

  assign _zz_when_Bypass_l26_7 = _zz_when_Decoder_l41_2[9 : 5];
  always @(*) begin
    _zz_when_Bypass_l39_3 = _zz_when_Decoder_l41_2[14 : 10];
    if(when_Decoder_l41) begin
      _zz_when_Bypass_l39_3 = _zz_when_Decoder_l41_2[4 : 0];
    end
    if(when_Decoder_l41_1) begin
      _zz_when_Bypass_l39_3 = _zz_when_Decoder_l41_2[4 : 0];
    end
    if(when_Decoder_l41_2) begin
      _zz_when_Bypass_l39_3 = _zz_when_Decoder_l41_2[4 : 0];
    end
    if(when_Decoder_l41_3) begin
      _zz_when_Bypass_l39_3 = _zz_when_Decoder_l41_2[4 : 0];
    end
    if(when_Decoder_l41_4) begin
      _zz_when_Bypass_l39_3 = _zz_when_Decoder_l41_2[4 : 0];
    end
    if(when_Decoder_l41_5) begin
      _zz_when_Bypass_l39_3 = _zz_when_Decoder_l41_2[4 : 0];
    end
  end

  always @(*) begin
    _zz_when_RegisterFile_l36_7 = 1'b0;
    if(when_Decoder_l41_9) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_10) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_11) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_12) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_13) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_14) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_15) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_16) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_17) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_18) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_19) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_20) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_21) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_22) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_23) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_24) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_25) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_26) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_27) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_28) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_29) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_30) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Bypass_l26_6 = _zz_when_Decoder_l41_2[4 : 0];
    if(when_Decoder_l41_7) begin
      _zz_when_Bypass_l26_6 = {4'd0, _zz__zz_when_Bypass_l26_6};
    end
  end

  always @(*) begin
    _zz_30 = AluOp_add;
    if(when_Decoder_l41_10) begin
      _zz_30 = AluOp_sub;
    end
    if(when_Decoder_l41_14) begin
      _zz_30 = AluOp_and_1;
    end
    if(when_Decoder_l41_15) begin
      _zz_30 = AluOp_or_1;
    end
    if(when_Decoder_l41_16) begin
      _zz_30 = AluOp_nor_1;
    end
    if(when_Decoder_l41_17) begin
      _zz_30 = AluOp_xor_1;
    end
    if(when_Decoder_l41_18) begin
      _zz_30 = AluOp_and_1;
    end
    if(when_Decoder_l41_19) begin
      _zz_30 = AluOp_or_1;
    end
    if(when_Decoder_l41_20) begin
      _zz_30 = AluOp_xor_1;
    end
  end

  always @(*) begin
    _zz_29 = AluSrc1_rj;
    if(when_Decoder_l41_13) begin
      _zz_29 = AluSrc1_pc;
    end
  end

  always @(*) begin
    _zz_28 = AluSrc2_rk;
    if(when_Decoder_l41_11) begin
      _zz_28 = AluSrc2_luc;
    end
    if(when_Decoder_l41_13) begin
      _zz_28 = AluSrc2_luc;
    end
    if(when_Decoder_l41_18) begin
      _zz_28 = AluSrc2_luc;
    end
    if(when_Decoder_l41_19) begin
      _zz_28 = AluSrc2_luc;
    end
    if(when_Decoder_l41_20) begin
      _zz_28 = AluSrc2_luc;
    end
  end

  always @(*) begin
    _zz_27 = LucOp_si12;
    if(when_Decoder_l41_11) begin
      _zz_27 = LucOp_si12;
    end
    if(when_Decoder_l41_12) begin
      _zz_27 = LucOp_si20;
    end
    if(when_Decoder_l41_13) begin
      _zz_27 = LucOp_si20;
    end
    if(when_Decoder_l41_18) begin
      _zz_27 = LucOp_ui12;
    end
    if(when_Decoder_l41_19) begin
      _zz_27 = LucOp_ui12;
    end
    if(when_Decoder_l41_20) begin
      _zz_27 = LucOp_ui12;
    end
  end

  always @(*) begin
    _zz_26 = 1'b0;
    if(when_Decoder_l41_12) begin
      _zz_26 = 1'b1;
    end
  end

  always @(*) begin
    _zz_25 = 1'b0;
    if(when_Decoder_l41_9) begin
      _zz_25 = 1'b1;
    end
    if(when_Decoder_l41_10) begin
      _zz_25 = 1'b1;
    end
    if(when_Decoder_l41_11) begin
      _zz_25 = 1'b1;
    end
    if(when_Decoder_l41_13) begin
      _zz_25 = 1'b1;
    end
    if(when_Decoder_l41_14) begin
      _zz_25 = 1'b1;
    end
    if(when_Decoder_l41_15) begin
      _zz_25 = 1'b1;
    end
    if(when_Decoder_l41_16) begin
      _zz_25 = 1'b1;
    end
    if(when_Decoder_l41_17) begin
      _zz_25 = 1'b1;
    end
    if(when_Decoder_l41_18) begin
      _zz_25 = 1'b1;
    end
    if(when_Decoder_l41_19) begin
      _zz_25 = 1'b1;
    end
    if(when_Decoder_l41_20) begin
      _zz_25 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Pc_l134_20 = ShifterOp_sll_1;
    if(when_Decoder_l41_22) begin
      _zz_when_Pc_l134_20 = ShifterOp_srl_1;
    end
    if(when_Decoder_l41_23) begin
      _zz_when_Pc_l134_20 = ShifterOp_sra_1;
    end
    if(when_Decoder_l41_25) begin
      _zz_when_Pc_l134_20 = ShifterOp_srl_1;
    end
    if(when_Decoder_l41_26) begin
      _zz_when_Pc_l134_20 = ShifterOp_sra_1;
    end
  end

  always @(*) begin
    _zz_24 = ShifterSrc2_rk;
    if(when_Decoder_l41_24) begin
      _zz_24 = ShifterSrc2_ui5;
    end
    if(when_Decoder_l41_25) begin
      _zz_24 = ShifterSrc2_ui5;
    end
    if(when_Decoder_l41_26) begin
      _zz_24 = ShifterSrc2_ui5;
    end
  end

  always @(*) begin
    _zz_23 = 1'b0;
    if(when_Decoder_l41_21) begin
      _zz_23 = 1'b1;
    end
    if(when_Decoder_l41_22) begin
      _zz_23 = 1'b1;
    end
    if(when_Decoder_l41_23) begin
      _zz_23 = 1'b1;
    end
    if(when_Decoder_l41_24) begin
      _zz_23 = 1'b1;
    end
    if(when_Decoder_l41_25) begin
      _zz_23 = 1'b1;
    end
    if(when_Decoder_l41_26) begin
      _zz_23 = 1'b1;
    end
  end

  always @(*) begin
    _zz_22 = ComparerOp_lt;
    if(when_Decoder_l41) begin
      _zz_22 = ComparerOp_eq;
    end
    if(when_Decoder_l41_1) begin
      _zz_22 = ComparerOp_ne;
    end
    if(when_Decoder_l41_2) begin
      _zz_22 = ComparerOp_lt;
    end
    if(when_Decoder_l41_3) begin
      _zz_22 = ComparerOp_ge;
    end
    if(when_Decoder_l41_4) begin
      _zz_22 = ComparerOp_ltu;
    end
    if(when_Decoder_l41_5) begin
      _zz_22 = ComparerOp_geu;
    end
    if(when_Decoder_l41_27) begin
      _zz_22 = ComparerOp_lt;
    end
    if(when_Decoder_l41_28) begin
      _zz_22 = ComparerOp_ltu;
    end
    if(when_Decoder_l41_29) begin
      _zz_22 = ComparerOp_lt;
    end
    if(when_Decoder_l41_30) begin
      _zz_22 = ComparerOp_ltu;
    end
  end

  always @(*) begin
    _zz_21 = ComparerSrc2_registerVal2;
    if(when_Decoder_l41_29) begin
      _zz_21 = ComparerSrc2_si12;
    end
    if(when_Decoder_l41_30) begin
      _zz_21 = ComparerSrc2_si12;
    end
  end

  always @(*) begin
    _zz_20 = 1'b0;
    if(when_Decoder_l41_27) begin
      _zz_20 = 1'b1;
    end
    if(when_Decoder_l41_28) begin
      _zz_20 = 1'b1;
    end
    if(when_Decoder_l41_29) begin
      _zz_20 = 1'b1;
    end
    if(when_Decoder_l41_30) begin
      _zz_20 = 1'b1;
    end
  end

  assign when_Decoder_l41 = ((_zz_when_Decoder_l41_2 & 32'hfc000000) == 32'h58000000);
  assign when_Decoder_l41_1 = ((_zz_when_Decoder_l41_2 & 32'hfc000000) == 32'h5c000000);
  assign when_Decoder_l41_2 = ((_zz_when_Decoder_l41_2 & 32'hfc000000) == 32'h60000000);
  assign when_Decoder_l41_3 = ((_zz_when_Decoder_l41_2 & 32'hfc000000) == 32'h64000000);
  assign when_Decoder_l41_4 = ((_zz_when_Decoder_l41_2 & 32'hfc000000) == 32'h68000000);
  assign when_Decoder_l41_5 = ((_zz_when_Decoder_l41_2 & 32'hfc000000) == 32'h6c000000);
  assign when_Decoder_l41_6 = ((_zz_when_Decoder_l41_2 & 32'hfc000000) == 32'h50000000);
  assign when_Decoder_l41_7 = ((_zz_when_Decoder_l41_2 & 32'hfc000000) == 32'h54000000);
  assign when_Decoder_l41_8 = ((_zz_when_Decoder_l41_2 & 32'hfc000000) == 32'h4c000000);
  assign when_Decoder_l41_9 = ((_zz_when_Decoder_l41_2 & 32'hffff8000) == 32'h00100000);
  assign when_Decoder_l41_10 = ((_zz_when_Decoder_l41_2 & 32'hffff8000) == 32'h00110000);
  assign when_Decoder_l41_11 = ((_zz_when_Decoder_l41_2 & 32'hffc00000) == 32'h02800000);
  assign when_Decoder_l41_12 = ((_zz_when_Decoder_l41_2 & 32'hfe000000) == 32'h14000000);
  assign when_Decoder_l41_13 = ((_zz_when_Decoder_l41_2 & 32'hfe000000) == 32'h1c000000);
  assign when_Decoder_l41_14 = ((_zz_when_Decoder_l41_2 & 32'hffff8000) == 32'h00148000);
  assign when_Decoder_l41_15 = ((_zz_when_Decoder_l41_2 & 32'hffff8000) == 32'h00150000);
  assign when_Decoder_l41_16 = ((_zz_when_Decoder_l41_2 & 32'hffff8000) == 32'h00140000);
  assign when_Decoder_l41_17 = ((_zz_when_Decoder_l41_2 & 32'hffff8000) == 32'h00158000);
  assign when_Decoder_l41_18 = ((_zz_when_Decoder_l41_2 & 32'hffc00000) == 32'h03400000);
  assign when_Decoder_l41_19 = ((_zz_when_Decoder_l41_2 & 32'hffc00000) == 32'h03800000);
  assign when_Decoder_l41_20 = ((_zz_when_Decoder_l41_2 & 32'hffc00000) == 32'h03c00000);
  assign when_Decoder_l41_21 = ((_zz_when_Decoder_l41_2 & 32'hffff8000) == 32'h00170000);
  assign when_Decoder_l41_22 = ((_zz_when_Decoder_l41_2 & 32'hffff8000) == 32'h00178000);
  assign when_Decoder_l41_23 = ((_zz_when_Decoder_l41_2 & 32'hffff8000) == 32'h00180000);
  assign when_Decoder_l41_24 = ((_zz_when_Decoder_l41_2 & 32'hffff8000) == 32'h00408000);
  assign when_Decoder_l41_25 = ((_zz_when_Decoder_l41_2 & 32'hffff8000) == 32'h00448000);
  assign when_Decoder_l41_26 = ((_zz_when_Decoder_l41_2 & 32'hffff8000) == 32'h00488000);
  assign when_Decoder_l41_27 = ((_zz_when_Decoder_l41_2 & 32'hffff8000) == 32'h00120000);
  assign when_Decoder_l41_28 = ((_zz_when_Decoder_l41_2 & 32'hffff8000) == 32'h00128000);
  assign when_Decoder_l41_29 = ((_zz_when_Decoder_l41_2 & 32'hffc00000) == 32'h02000000);
  assign when_Decoder_l41_30 = ((_zz_when_Decoder_l41_2 & 32'hffc00000) == 32'h02400000);
  assign when_RegisterFile_l36 = (((_zz_when_RegisterFile_l36_6 && (_zz_when_RegisterFile_l36_5 != 5'h00)) && write_up_isFiring) && write_up_isValid);
  assign when_Bypass_l26 = (_zz_when_Bypass_l26_5 == _zz_when_RegisterFile_l36_5);
  assign execute_haltRequest_Bypass_l30 = _zz_execute_haltRequest_Bypass_l30_1;
  assign when_Bypass_l26_1 = (_zz_when_Bypass_l26_5 == _zz_when_Bypass_l26_4);
  assign execute_haltRequest_Bypass_l30_1 = _zz_execute_haltRequest_Bypass_l30;
  assign when_Bypass_l26_2 = (_zz_when_Bypass_l26_1 == _zz_when_RegisterFile_l36_5);
  assign memory_haltRequest_Bypass_l30 = _zz_memory_haltRequest_Bypass_l30;
  assign when_Bypass_l39 = (_zz_when_Bypass_l39_2 == _zz_when_RegisterFile_l36_5);
  assign execute_haltRequest_Bypass_l43 = _zz_execute_haltRequest_Bypass_l43_1;
  assign when_Bypass_l39_1 = (_zz_when_Bypass_l39_2 == _zz_when_Bypass_l26_4);
  assign execute_haltRequest_Bypass_l43_1 = _zz_execute_haltRequest_Bypass_l43;
  assign when_Bypass_l39_2 = (_zz_when_Bypass_l39 == _zz_when_RegisterFile_l36_5);
  assign memory_haltRequest_Bypass_l43 = _zz_memory_haltRequest_Bypass_l43;
  always @(*) begin
    case(_zz_27)
      LucOp_si12 : begin
        _zz_when_Pc_l134_25 = _zz__zz_when_Pc_l134_25;
      end
      LucOp_si20 : begin
        _zz_when_Pc_l134_25 = {_zz_when_Decoder_l41_2[24 : 5],12'h000};
      end
      default : begin
        _zz_when_Pc_l134_25 = _zz__zz_when_Pc_l134_25_2;
      end
    endcase
  end

  assign _zz_when_Pc_l134_11 = _zz_when_Pc_l134_25;
  always @(*) begin
    case(_zz_16)
      AluSrc1_rj : begin
        _zz_when_Pc_l134_28 = _zz_when_Pc_l134_17;
      end
      default : begin
        _zz_when_Pc_l134_28 = _zz_when_Pc_l134_10;
      end
    endcase
  end

  assign _zz_when_Pc_l134_26 = _zz_when_Pc_l134_28;
  always @(*) begin
    case(_zz_15)
      AluSrc2_rk : begin
        _zz_when_Pc_l134_29 = _zz_when_Pc_l134_13;
      end
      default : begin
        _zz_when_Pc_l134_29 = _zz_when_Pc_l134_2;
      end
    endcase
  end

  assign _zz_when_Pc_l134_27 = _zz_when_Pc_l134_29;
  always @(*) begin
    case(_zz_14)
      AluOp_add : begin
        _zz_when_Pc_l134_30 = _zz__zz_when_Pc_l134_30;
      end
      AluOp_sub : begin
        _zz_when_Pc_l134_30 = _zz__zz_when_Pc_l134_30_1;
      end
      AluOp_and_1 : begin
        _zz_when_Pc_l134_30 = (_zz_when_Pc_l134_26 & _zz_when_Pc_l134_27);
      end
      AluOp_or_1 : begin
        _zz_when_Pc_l134_30 = (_zz_when_Pc_l134_26 | _zz_when_Pc_l134_27);
      end
      AluOp_nor_1 : begin
        _zz_when_Pc_l134_30 = (~ (_zz_when_Pc_l134_26 | _zz_when_Pc_l134_27));
      end
      default : begin
        _zz_when_Pc_l134_30 = (_zz_when_Pc_l134_26 ^ _zz_when_Pc_l134_27);
      end
    endcase
  end

  assign _zz_37 = _zz_1;
  assign _zz_38 = _zz_when_RegisterFile_l36_6;
  assign _zz_39 = _zz_when_RegisterFile_l36_5;
  assign _zz_40 = _zz_when_Pc_l134_19;
  assign _zz_when_Pc_l134_31 = _zz_when_Pc_l134_17;
  always @(*) begin
    case(_zz_13)
      ShifterSrc2_rk : begin
        _zz_when_Pc_l134_32 = _zz_when_Pc_l134_13[4 : 0];
      end
      default : begin
        _zz_when_Pc_l134_32 = _zz_when_Bypass_l39_2;
      end
    endcase
  end

  always @(*) begin
    _zz_when_Pc_l134_33[0] = _zz_when_Pc_l134_31[31];
    _zz_when_Pc_l134_33[1] = _zz_when_Pc_l134_31[30];
    _zz_when_Pc_l134_33[2] = _zz_when_Pc_l134_31[29];
    _zz_when_Pc_l134_33[3] = _zz_when_Pc_l134_31[28];
    _zz_when_Pc_l134_33[4] = _zz_when_Pc_l134_31[27];
    _zz_when_Pc_l134_33[5] = _zz_when_Pc_l134_31[26];
    _zz_when_Pc_l134_33[6] = _zz_when_Pc_l134_31[25];
    _zz_when_Pc_l134_33[7] = _zz_when_Pc_l134_31[24];
    _zz_when_Pc_l134_33[8] = _zz_when_Pc_l134_31[23];
    _zz_when_Pc_l134_33[9] = _zz_when_Pc_l134_31[22];
    _zz_when_Pc_l134_33[10] = _zz_when_Pc_l134_31[21];
    _zz_when_Pc_l134_33[11] = _zz_when_Pc_l134_31[20];
    _zz_when_Pc_l134_33[12] = _zz_when_Pc_l134_31[19];
    _zz_when_Pc_l134_33[13] = _zz_when_Pc_l134_31[18];
    _zz_when_Pc_l134_33[14] = _zz_when_Pc_l134_31[17];
    _zz_when_Pc_l134_33[15] = _zz_when_Pc_l134_31[16];
    _zz_when_Pc_l134_33[16] = _zz_when_Pc_l134_31[15];
    _zz_when_Pc_l134_33[17] = _zz_when_Pc_l134_31[14];
    _zz_when_Pc_l134_33[18] = _zz_when_Pc_l134_31[13];
    _zz_when_Pc_l134_33[19] = _zz_when_Pc_l134_31[12];
    _zz_when_Pc_l134_33[20] = _zz_when_Pc_l134_31[11];
    _zz_when_Pc_l134_33[21] = _zz_when_Pc_l134_31[10];
    _zz_when_Pc_l134_33[22] = _zz_when_Pc_l134_31[9];
    _zz_when_Pc_l134_33[23] = _zz_when_Pc_l134_31[8];
    _zz_when_Pc_l134_33[24] = _zz_when_Pc_l134_31[7];
    _zz_when_Pc_l134_33[25] = _zz_when_Pc_l134_31[6];
    _zz_when_Pc_l134_33[26] = _zz_when_Pc_l134_31[5];
    _zz_when_Pc_l134_33[27] = _zz_when_Pc_l134_31[4];
    _zz_when_Pc_l134_33[28] = _zz_when_Pc_l134_31[3];
    _zz_when_Pc_l134_33[29] = _zz_when_Pc_l134_31[2];
    _zz_when_Pc_l134_33[30] = _zz_when_Pc_l134_31[1];
    _zz_when_Pc_l134_33[31] = _zz_when_Pc_l134_31[0];
  end

  always @(*) begin
    case(_zz_when_Pc_l134_7)
      ShifterOp_sll_1 : begin
        _zz_when_Pc_l134_34 = _zz_when_Pc_l134_33;
      end
      default : begin
        _zz_when_Pc_l134_34 = _zz_when_Pc_l134_31;
      end
    endcase
  end

  assign _zz_when_Pc_l134_35 = _zz__zz_when_Pc_l134_35[31 : 0];
  always @(*) begin
    _zz_when_Pc_l134_36[0] = _zz_when_Pc_l134_35[31];
    _zz_when_Pc_l134_36[1] = _zz_when_Pc_l134_35[30];
    _zz_when_Pc_l134_36[2] = _zz_when_Pc_l134_35[29];
    _zz_when_Pc_l134_36[3] = _zz_when_Pc_l134_35[28];
    _zz_when_Pc_l134_36[4] = _zz_when_Pc_l134_35[27];
    _zz_when_Pc_l134_36[5] = _zz_when_Pc_l134_35[26];
    _zz_when_Pc_l134_36[6] = _zz_when_Pc_l134_35[25];
    _zz_when_Pc_l134_36[7] = _zz_when_Pc_l134_35[24];
    _zz_when_Pc_l134_36[8] = _zz_when_Pc_l134_35[23];
    _zz_when_Pc_l134_36[9] = _zz_when_Pc_l134_35[22];
    _zz_when_Pc_l134_36[10] = _zz_when_Pc_l134_35[21];
    _zz_when_Pc_l134_36[11] = _zz_when_Pc_l134_35[20];
    _zz_when_Pc_l134_36[12] = _zz_when_Pc_l134_35[19];
    _zz_when_Pc_l134_36[13] = _zz_when_Pc_l134_35[18];
    _zz_when_Pc_l134_36[14] = _zz_when_Pc_l134_35[17];
    _zz_when_Pc_l134_36[15] = _zz_when_Pc_l134_35[16];
    _zz_when_Pc_l134_36[16] = _zz_when_Pc_l134_35[15];
    _zz_when_Pc_l134_36[17] = _zz_when_Pc_l134_35[14];
    _zz_when_Pc_l134_36[18] = _zz_when_Pc_l134_35[13];
    _zz_when_Pc_l134_36[19] = _zz_when_Pc_l134_35[12];
    _zz_when_Pc_l134_36[20] = _zz_when_Pc_l134_35[11];
    _zz_when_Pc_l134_36[21] = _zz_when_Pc_l134_35[10];
    _zz_when_Pc_l134_36[22] = _zz_when_Pc_l134_35[9];
    _zz_when_Pc_l134_36[23] = _zz_when_Pc_l134_35[8];
    _zz_when_Pc_l134_36[24] = _zz_when_Pc_l134_35[7];
    _zz_when_Pc_l134_36[25] = _zz_when_Pc_l134_35[6];
    _zz_when_Pc_l134_36[26] = _zz_when_Pc_l134_35[5];
    _zz_when_Pc_l134_36[27] = _zz_when_Pc_l134_35[4];
    _zz_when_Pc_l134_36[28] = _zz_when_Pc_l134_35[3];
    _zz_when_Pc_l134_36[29] = _zz_when_Pc_l134_35[2];
    _zz_when_Pc_l134_36[30] = _zz_when_Pc_l134_35[1];
    _zz_when_Pc_l134_36[31] = _zz_when_Pc_l134_35[0];
  end

  always @(*) begin
    case(_zz_when_Pc_l134_7)
      ShifterOp_sll_1 : begin
        _zz_when_Pc_l134_37 = _zz_when_Pc_l134_36;
      end
      default : begin
        _zz_when_Pc_l134_37 = _zz_when_Pc_l134_35;
      end
    endcase
  end

  assign _zz_when_Pc_l134_38 = _zz_when_Pc_l134_6;
  always @(*) begin
    case(_zz_21)
      ComparerSrc2_registerVal2 : begin
        _zz_when_Pc_l134_40 = _zz_when_Pc_l134_5;
      end
      default : begin
        _zz_when_Pc_l134_40 = {20'd0, _zz__zz_when_Pc_l134_40};
      end
    endcase
  end

  assign _zz_when_Pc_l134_39 = _zz_when_Pc_l134_40;
  assign _zz_when_Pc_l134_41 = (_zz_when_Pc_l134_38 == _zz_when_Pc_l134_39);
  assign _zz_when_Pc_l134_42 = ($signed(_zz__zz_when_Pc_l134_42) < $signed(_zz__zz_when_Pc_l134_42_1));
  assign _zz_when_Pc_l134_43 = (_zz_when_Pc_l134_38 < _zz_when_Pc_l134_39);
  always @(*) begin
    case(_zz_22)
      ComparerOp_eq : begin
        _zz_when_Pc_l134_44 = _zz_when_Pc_l134_41;
      end
      ComparerOp_ne : begin
        _zz_when_Pc_l134_44 = (! _zz_when_Pc_l134_41);
      end
      ComparerOp_lt : begin
        _zz_when_Pc_l134_44 = _zz_when_Pc_l134_42;
      end
      ComparerOp_ge : begin
        _zz_when_Pc_l134_44 = (! _zz_when_Pc_l134_42);
      end
      ComparerOp_ltu : begin
        _zz_when_Pc_l134_44 = _zz_when_Pc_l134_43;
      end
      default : begin
        _zz_when_Pc_l134_44 = (! _zz_when_Pc_l134_43);
      end
    endcase
  end

  assign _zz_when_Pc_l134_23 = _zz_when_Pc_l134_44;
  assign fetch_up_ready = fetch_down_isReady;
  assign decode_up_ready = decode_down_isReady;
  assign _zz_when_Decoder_l41_3 = _zz_when_Decoder_l41_1;
  assign _zz_when_Decoder_l41_2 = _zz_when_Decoder_l41;
  assign _zz_when_Pc_l134_6 = ((_zz_when_Bypass_l26_7 != 5'h00) ? ((_zz_when_Bypass_l26_7 == _zz_when_RegisterFile_l36_5) ? _zz_when_Pc_l134_19 : _zz__zz_36_port1) : 32'h00000000);
  assign _zz_when_Pc_l134_5 = ((_zz_when_Bypass_l39_3 != 5'h00) ? ((_zz_when_Bypass_l39_3 == _zz_when_RegisterFile_l36_5) ? _zz_when_Pc_l134_19 : _zz__zz_36_port2) : 32'h00000000);
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

  assign when_CtrlLink_l151 = (|{execute_haltRequest_Bypass_l43_1,{execute_haltRequest_Bypass_l43,{execute_haltRequest_Bypass_l30_1,execute_haltRequest_Bypass_l30}}});
  assign _zz_when_Pc_l134_10 = _zz_when_Pc_l134_4;
  assign _zz_18 = _zz_12;
  assign _zz_17 = _zz_11;
  assign _zz_when_Bypass_l26_5 = _zz_when_Bypass_l26_3;
  assign _zz_when_Bypass_l39_2 = _zz_when_Bypass_l39_1;
  assign _zz_14 = _zz_10;
  assign _zz_16 = _zz_9;
  assign _zz_15 = _zz_8;
  assign _zz_when_Pc_l134_7 = _zz_when_Pc_l134_3;
  assign _zz_13 = _zz_6;
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

  assign when_CtrlLink_l151_1 = (|{memory_haltRequest_Bypass_l43,memory_haltRequest_Bypass_l30});
  assign _zz_when_Pc_l134_15 = _zz_when_Pc_l134_1;
  assign _zz_when_RegisterFile_l36_4 = _zz_when_RegisterFile_l36_2;
  assign _zz_when_Bypass_l26_4 = _zz_when_Bypass_l26;
  assign write_down_valid = write_up_valid;
  assign _zz_when_Pc_l134_19 = _zz_when_Pc_l134;
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
      _zz_when_Decoder_l41_6 <= 32'h00003000;
      execute_up_valid <= 1'b0;
      memory_up_valid <= 1'b0;
      write_up_valid <= 1'b0;
    end else begin
      _zz_when_Decoder_l41_6 <= _zz_when_Decoder_l41_5;
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
      _zz_when_Decoder_l41_1 <= _zz_when_Decoder_l41_4;
      _zz_when_Decoder_l41 <= _zz__zz_35_port0;
    end
    if(decode_down_isReady) begin
      _zz_when_Pc_l134_4 <= _zz_when_Decoder_l41_3;
      _zz_when_Pc_l134_8 <= _zz_when_Pc_l134_21;
      _zz_when_Pc_l134_16 <= _zz_when_Pc_l134_6;
      _zz_when_Pc_l134_12 <= _zz_when_Pc_l134_5;
      _zz_12 <= _zz_32;
      _zz_11 <= _zz_31;
      _zz_when_Bypass_l26_3 <= _zz_when_Bypass_l26_7;
      _zz_when_Bypass_l39_1 <= _zz_when_Bypass_l39_3;
      _zz_when_RegisterFile_l36_3 <= _zz_when_RegisterFile_l36_7;
      _zz_when_Bypass_l26_2 <= _zz_when_Bypass_l26_6;
      _zz_10 <= _zz_30;
      _zz_9 <= _zz_29;
      _zz_8 <= _zz_28;
      _zz_7 <= _zz_25;
      _zz_when_Pc_l134_3 <= _zz_when_Pc_l134_20;
      _zz_6 <= _zz_24;
      _zz_5 <= _zz_23;
      _zz_when_Pc_l134_2 <= _zz_when_Pc_l134_11;
    end
    if(execute_down_isReady) begin
      _zz_4 <= _zz_when_Pc_l134_10;
      _zz_when_Pc_l134_1 <= _zz_when_Pc_l134_9;
      _zz_3 <= _zz_18;
      _zz_2 <= _zz_17;
      _zz_when_Bypass_l26_1 <= _zz_when_Bypass_l26_5;
      _zz_when_Bypass_l39 <= _zz_when_Bypass_l39_2;
      _zz_when_RegisterFile_l36_2 <= _zz_when_RegisterFile_l36_3;
      _zz_when_Bypass_l26 <= _zz_when_Bypass_l26_2;
    end
    _zz_1 <= _zz_4;
    _zz_when_Pc_l134 <= _zz_when_Pc_l134_15;
    _zz_when_RegisterFile_l36_1 <= _zz_when_RegisterFile_l36_4;
    _zz_when_RegisterFile_l36 <= _zz_when_Bypass_l26_4;
  end


endmodule
