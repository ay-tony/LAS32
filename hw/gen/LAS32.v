// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : LAS32
// Git hash  : 0555b121f761b32fb1fd478dc051e83b08f2c921

`timescale 1ns/1ps

module LAS32 (
  output wire [31:0]   _zz_52,
  output wire          _zz_53,
  output wire [4:0]    _zz_54,
  output wire [31:0]   _zz_55,
  input  wire          clk,
  input  wire          reset
);
  localparam DcacheReadType_b = 3'd0;
  localparam DcacheReadType_bu = 3'd1;
  localparam DcacheReadType_h = 3'd2;
  localparam DcacheReadType_hu = 3'd3;
  localparam DcacheReadType_w = 3'd4;
  localparam DcacheStoreType_b = 2'd0;
  localparam DcacheStoreType_h = 2'd1;
  localparam DcacheStoreType_w = 2'd2;
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

  wire       [31:0]   _zz__zz_50_port0;
  wire       [31:0]   _zz__zz_51_port1;
  wire       [31:0]   _zz__zz_51_port2;
  wire       [31:0]   _zz__zz_51_port3;
  wire       [31:0]   _zz__zz_56_port1;
  wire       [31:0]   _zz__zz_when_Decoder_l41_7;
  wire       [31:0]   _zz__zz_when_Decoder_l41_7_1;
  wire       [31:0]   _zz__zz_when_Decoder_l41_7_2;
  wire       [17:0]   _zz__zz_when_Decoder_l41_7_3;
  wire       [17:0]   _zz__zz_when_Decoder_l41_7_4;
  wire       [31:0]   _zz__zz_when_Decoder_l41_7_5;
  wire       [31:0]   _zz__zz_when_Decoder_l41_7_6;
  wire       [31:0]   _zz__zz_when_Decoder_l41_7_7;
  wire       [27:0]   _zz__zz_when_Decoder_l41_7_8;
  wire       [31:0]   _zz__zz_when_Pc_l134_12;
  wire       [0:0]    _zz__zz_when_Bypass_l26_6;
  wire       [31:0]   _zz__zz_switch_Misc_l241_13;
  wire       [11:0]   _zz__zz_switch_Misc_l241_13_1;
  wire       [31:0]   _zz__zz_switch_Misc_l241_13_2;
  wire       [11:0]   _zz__zz_switch_Misc_l241_13_3;
  wire       [31:0]   _zz__zz_switch_Misc_l241_18;
  wire       [31:0]   _zz__zz_switch_Misc_l241_18_1;
  wire       [32:0]   _zz__zz_when_Pc_l134_20;
  wire       [32:0]   _zz__zz_when_Pc_l134_20_1;
  wire       [32:0]   _zz__zz_when_Pc_l134_20_2;
  wire       [11:0]   _zz__zz_when_Pc_l134_25;
  wire       [31:0]   _zz__zz_when_Pc_l134_27;
  wire       [31:0]   _zz__zz_when_Pc_l134_27_1;
  wire       [0:0]    _zz__zz_when_Pc_l134_12_1;
  wire       [39:0]   _zz__zz_65;
  wire       [47:0]   _zz__zz_65_1;
  wire       [55:0]   _zz__zz_65_2;
  wire       [14:0]   _zz__zz_56_port;
  wire       [29:0]   _zz__zz_56_port_1;
  wire       [29:0]   _zz__zz_when_Pc_l134_30;
  wire       [31:0]   _zz__zz_when_Pc_l134_32;
  wire       [7:0]    _zz__zz_when_Pc_l134_32_1;
  wire       [31:0]   _zz__zz_when_Pc_l134_32_2;
  wire       [7:0]    _zz__zz_when_Pc_l134_32_3;
  wire       [31:0]   _zz__zz_when_Pc_l134_32_4;
  wire       [7:0]    _zz__zz_when_Pc_l134_32_5;
  wire       [31:0]   _zz__zz_when_Pc_l134_32_6;
  wire       [7:0]    _zz__zz_when_Pc_l134_32_7;
  wire       [7:0]    _zz__zz_when_Pc_l134_33;
  wire       [7:0]    _zz__zz_when_Pc_l134_33_1;
  wire       [7:0]    _zz__zz_when_Pc_l134_33_2;
  wire       [7:0]    _zz__zz_when_Pc_l134_33_3;
  wire       [31:0]   _zz__zz_when_Pc_l134_34;
  wire       [15:0]   _zz__zz_when_Pc_l134_34_1;
  wire       [31:0]   _zz__zz_when_Pc_l134_34_2;
  wire       [16:0]   _zz__zz_when_Pc_l134_34_3;
  wire       [15:0]   _zz__zz_when_Pc_l134_35;
  wire       [16:0]   _zz__zz_when_Pc_l134_35_1;
  wire                write_up_isReady;
  wire                memory_up_isReady;
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
  reg        [31:0]   _zz_switch_Misc_l241;
  reg                 _zz_when_Dcache_l187;
  reg        [2:0]    _zz_2;
  reg        [1:0]    _zz_3;
  reg                 _zz_when_Dcache_l150;
  reg        [4:0]    _zz_when_Bypass_l26;
  reg                 _zz_when_RegisterFile_l36_2;
  reg        [4:0]    _zz_when_Bypass_l39;
  reg        [4:0]    _zz_when_Bypass_l26_1;
  reg                 _zz_4;
  reg                 _zz_5;
  reg        [31:0]   _zz_6;
  wire                memory_down_isReady;
  reg        [31:0]   _zz_switch_Misc_l241_1;
  reg                 _zz_when_Dcache_l187_1;
  reg        [2:0]    _zz_7;
  wire       [2:0]    _zz_8;
  reg        [1:0]    _zz_9;
  wire       [1:0]    _zz_10;
  reg                 _zz_when_Dcache_l150_1;
  reg                 _zz_11;
  reg        [0:0]    _zz_12;
  reg        [1:0]    _zz_when_Pc_l134_1;
  reg                 _zz_13;
  reg        [0:0]    _zz_14;
  reg        [0:0]    _zz_15;
  reg        [2:0]    _zz_16;
  reg        [4:0]    _zz_when_Bypass_l26_2;
  reg                 _zz_when_RegisterFile_l36_3;
  reg        [4:0]    _zz_when_Bypass_l39_1;
  reg        [4:0]    _zz_when_Bypass_l26_3;
  reg                 _zz_17;
  reg                 _zz_18;
  reg        [31:0]   _zz_switch_Misc_l241_2;
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
  reg        [31:0]   _zz_when_Pc_l134_2;
  reg        [31:0]   _zz_when_Pc_l134_3;
  wire       [2:0]    _zz_19;
  reg                 _zz_20;
  wire                memory_up_isFiring;
  wire       [31:0]   _zz_switch_Misc_l241_3;
  wire       [1:0]    _zz_21;
  wire       [3:0]    _zz_22;
  wire       [31:0]   _zz_when_Pc_l134_4;
  wire       [31:0]   _zz_when_Pc_l134_5;
  wire       [1:0]    _zz_when_Pc_l134_6;
  wire       [0:0]    _zz_23;
  reg        [31:0]   _zz_when_Pc_l134_7;
  reg        [31:0]   _zz_when_Pc_l134_8;
  wire       [2:0]    _zz_24;
  wire       [31:0]   _zz_switch_Misc_l241_4;
  wire       [0:0]    _zz_25;
  wire       [31:0]   _zz_switch_Misc_l241_5;
  wire       [0:0]    _zz_26;
  wire       [31:0]   _zz_switch_Misc_l241_6;
  reg                 _zz_memory_haltRequest_Bypass_l43;
  reg        [31:0]   _zz_27;
  wire       [31:0]   _zz_28;
  reg        [31:0]   _zz_29;
  reg                 _zz_execute_haltRequest_Bypass_l43;
  reg                 _zz_execute_haltRequest_Bypass_l43_1;
  reg        [31:0]   _zz_switch_Misc_l241_7;
  wire       [31:0]   _zz_switch_Misc_l241_8;
  reg        [31:0]   _zz_switch_Misc_l241_9;
  wire       [4:0]    _zz_when_Bypass_l39_2;
  wire                _zz_30;
  reg                 _zz_memory_haltRequest_Bypass_l30;
  reg                 _zz_execute_haltRequest_Bypass_l30;
  wire       [31:0]   _zz_when_Pc_l134_9;
  wire                _zz_when_RegisterFile_l36_4;
  wire       [4:0]    _zz_when_Bypass_l26_4;
  reg                 _zz_execute_haltRequest_Bypass_l30_1;
  reg        [31:0]   _zz_switch_Misc_l241_10;
  wire       [31:0]   _zz_switch_Misc_l241_11;
  reg        [31:0]   _zz_switch_Misc_l241_12;
  wire       [4:0]    _zz_when_Bypass_l26_5;
  wire                _zz_31;
  reg                 _zz_32;
  wire       [31:0]   _zz_when_Pc_l134_10;
  wire                write_up_isValid;
  wire                write_up_isFiring;
  wire       [4:0]    _zz_when_RegisterFile_l36_5;
  wire                _zz_when_RegisterFile_l36_6;
  reg                 _zz_when_Dcache_l187_2;
  reg        [2:0]    _zz_33;
  reg        [1:0]    _zz_34;
  reg                 _zz_when_Dcache_l150_2;
  reg                 _zz_35;
  reg        [0:0]    _zz_36;
  reg        [2:0]    _zz_37;
  reg                 _zz_38;
  reg        [0:0]    _zz_39;
  reg        [1:0]    _zz_when_Pc_l134_11;
  reg                 _zz_40;
  reg                 _zz_41;
  reg        [1:0]    _zz_42;
  reg        [0:0]    _zz_43;
  reg        [0:0]    _zz_44;
  reg        [2:0]    _zz_45;
  reg        [4:0]    _zz_when_Bypass_l26_6;
  reg                 _zz_when_RegisterFile_l36_7;
  reg        [4:0]    _zz_when_Bypass_l39_3;
  wire       [4:0]    _zz_when_Bypass_l26_7;
  reg                 _zz_46;
  reg                 _zz_47;
  reg        [31:0]   _zz_when_Pc_l134_12;
  reg                 _zz_48;
  wire       [31:0]   _zz_when_Decoder_l41_2;
  wire       [31:0]   _zz_when_Decoder_l41_3;
  reg        [1:0]    _zz_49;
  reg                 _zz_when_Pc_l134_13;
  wire                _zz_when_Pc_l134_14;
  reg                 _zz_when_Pc_l134_15;
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
  wire                when_Decoder_l41_31;
  wire                when_Decoder_l41_32;
  wire                when_Decoder_l41_33;
  wire                when_Decoder_l41_34;
  wire                when_Decoder_l41_35;
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
  reg        [31:0]   _zz_switch_Misc_l241_13;
  wire       [31:0]   _zz_switch_Misc_l241_14;
  wire       [31:0]   _zz_switch_Misc_l241_15;
  reg        [31:0]   _zz_switch_Misc_l241_16;
  reg        [31:0]   _zz_switch_Misc_l241_17;
  reg        [31:0]   _zz_switch_Misc_l241_18;
  wire       [31:0]   _zz_when_Pc_l134_16;
  reg        [4:0]    _zz_when_Pc_l134_17;
  reg        [31:0]   _zz_when_Pc_l134_18;
  reg        [31:0]   _zz_when_Pc_l134_19;
  wire       [31:0]   _zz_when_Pc_l134_20;
  reg        [31:0]   _zz_when_Pc_l134_21;
  reg        [31:0]   _zz_when_Pc_l134_22;
  wire       [31:0]   _zz_when_Pc_l134_23;
  wire       [31:0]   _zz_when_Pc_l134_24;
  reg        [31:0]   _zz_when_Pc_l134_25;
  wire                _zz_when_Pc_l134_26;
  wire                _zz_when_Pc_l134_27;
  wire                _zz_when_Pc_l134_28;
  reg                 _zz_when_Pc_l134_29;
  wire       [1:0]    switch_Misc_l241;
  reg        [3:0]    _zz_62;
  wire       [0:0]    switch_Misc_l241_1;
  reg        [3:0]    _zz_63;
  reg        [3:0]    _zz_64;
  reg        [31:0]   _zz_65;
  wire                when_Dcache_l150;
  wire       [14:0]   _zz_when_Pc_l134_30;
  wire       [31:0]   _zz_when_Pc_l134_31;
  wire       [1:0]    _zz_switch_Misc_l241_19;
  reg        [31:0]   _zz_when_Pc_l134_32;
  reg        [31:0]   _zz_when_Pc_l134_33;
  wire       [0:0]    switch_Misc_l241_2;
  reg        [31:0]   _zz_when_Pc_l134_34;
  wire       [0:0]    switch_Misc_l241_3;
  reg        [31:0]   _zz_when_Pc_l134_35;
  reg        [31:0]   _zz_when_Pc_l134_36;
  wire                when_Dcache_l187;
  wire                when_CtrlLink_l151;
  wire                when_CtrlLink_l151_1;
  wire                when_StageLink_l67;
  wire                when_StageLink_l67_1;
  wire                when_StageLink_l67_2;
  `ifndef SYNTHESIS
  reg [15:0] _zz_2_string;
  reg [7:0] _zz_3_string;
  reg [15:0] _zz_7_string;
  reg [15:0] _zz_8_string;
  reg [7:0] _zz_9_string;
  reg [7:0] _zz_10_string;
  reg [23:0] _zz_12_string;
  reg [39:0] _zz_when_Pc_l134_1_string;
  reg [23:0] _zz_14_string;
  reg [15:0] _zz_15_string;
  reg [39:0] _zz_16_string;
  reg [15:0] _zz_19_string;
  reg [7:0] _zz_21_string;
  reg [39:0] _zz_when_Pc_l134_6_string;
  reg [23:0] _zz_23_string;
  reg [39:0] _zz_24_string;
  reg [23:0] _zz_25_string;
  reg [15:0] _zz_26_string;
  reg [15:0] _zz_33_string;
  reg [7:0] _zz_34_string;
  reg [95:0] _zz_36_string;
  reg [23:0] _zz_37_string;
  reg [23:0] _zz_39_string;
  reg [39:0] _zz_when_Pc_l134_11_string;
  reg [31:0] _zz_42_string;
  reg [23:0] _zz_43_string;
  reg [15:0] _zz_44_string;
  reg [39:0] _zz_45_string;
  reg [47:0] _zz_49_string;
  `endif

  reg [31:0] _zz_50 [0:32767];
  (* ram_style = "distributed" *) reg [31:0] _zz_51 [0:31];
  (* ram_style = "distributed" *) reg [7:0] _zz_56_symbol0 [0:32767];
  (* ram_style = "distributed" *) reg [7:0] _zz_56_symbol1 [0:32767];
  (* ram_style = "distributed" *) reg [7:0] _zz_56_symbol2 [0:32767];
  (* ram_style = "distributed" *) reg [7:0] _zz_56_symbol3 [0:32767];

  assign _zz__zz_when_Decoder_l41_7 = ($signed(_zz__zz_when_Decoder_l41_7_1) + $signed(_zz__zz_when_Decoder_l41_7_2));
  assign _zz__zz_when_Decoder_l41_7_1 = _zz_when_Decoder_l41_3;
  assign _zz__zz_when_Decoder_l41_7_3 = _zz__zz_when_Decoder_l41_7_4;
  assign _zz__zz_when_Decoder_l41_7_2 = {{14{_zz__zz_when_Decoder_l41_7_3[17]}}, _zz__zz_when_Decoder_l41_7_3};
  assign _zz__zz_when_Decoder_l41_7_4 = ({2'd0,_zz_when_Decoder_l41_2[25 : 10]} <<< 2'd2);
  assign _zz__zz_when_Decoder_l41_7_5 = ($signed(_zz__zz_when_Decoder_l41_7_6) + $signed(_zz__zz_when_Decoder_l41_7_7));
  assign _zz__zz_when_Decoder_l41_7_6 = _zz_when_Decoder_l41_3;
  assign _zz__zz_when_Decoder_l41_7_8 = {{_zz_when_Decoder_l41_2[9 : 0],_zz_when_Decoder_l41_2[25 : 10]},2'b00};
  assign _zz__zz_when_Decoder_l41_7_7 = {{4{_zz__zz_when_Decoder_l41_7_8[27]}}, _zz__zz_when_Decoder_l41_7_8};
  assign _zz__zz_when_Pc_l134_12 = (_zz_when_Decoder_l41_3 + 32'h00000004);
  assign _zz__zz_when_Bypass_l26_6 = 1'b1;
  assign _zz__zz_switch_Misc_l241_13_1 = _zz_when_Decoder_l41_2[21 : 10];
  assign _zz__zz_switch_Misc_l241_13 = {{20{_zz__zz_switch_Misc_l241_13_1[11]}}, _zz__zz_switch_Misc_l241_13_1};
  assign _zz__zz_switch_Misc_l241_13_3 = _zz_when_Decoder_l41_2[21 : 10];
  assign _zz__zz_switch_Misc_l241_13_2 = {20'd0, _zz__zz_switch_Misc_l241_13_3};
  assign _zz__zz_switch_Misc_l241_18 = (_zz_switch_Misc_l241_14 + _zz_switch_Misc_l241_15);
  assign _zz__zz_switch_Misc_l241_18_1 = (_zz_switch_Misc_l241_14 - _zz_switch_Misc_l241_15);
  assign _zz__zz_when_Pc_l134_20 = _zz__zz_when_Pc_l134_20_1;
  assign _zz__zz_when_Pc_l134_20_1 = ($signed(_zz__zz_when_Pc_l134_20_2) >>> _zz_when_Pc_l134_17);
  assign _zz__zz_when_Pc_l134_20_2 = {((_zz_when_Pc_l134_6 == ShifterOp_sra_1) && _zz_when_Pc_l134_19[31]),_zz_when_Pc_l134_19};
  assign _zz__zz_when_Pc_l134_25 = _zz_when_Decoder_l41_2[21 : 10];
  assign _zz__zz_when_Pc_l134_27 = _zz_when_Pc_l134_23;
  assign _zz__zz_when_Pc_l134_27_1 = _zz_when_Pc_l134_24;
  assign _zz__zz_when_Pc_l134_12_1 = _zz_when_Pc_l134_14;
  assign _zz__zz_65 = ({8'd0,_zz_28} <<< 4'd8);
  assign _zz__zz_65_1 = ({16'd0,_zz_28} <<< 5'd16);
  assign _zz__zz_65_2 = ({24'd0,_zz_28} <<< 5'd24);
  assign _zz__zz_56_port_1 = _zz_switch_Misc_l241_3[31 : 2];
  assign _zz__zz_56_port = _zz__zz_56_port_1[14:0];
  assign _zz__zz_when_Pc_l134_30 = _zz_switch_Misc_l241_3[31 : 2];
  assign _zz__zz_when_Pc_l134_32_1 = _zz_when_Pc_l134_31[7 : 0];
  assign _zz__zz_when_Pc_l134_32 = {{24{_zz__zz_when_Pc_l134_32_1[7]}}, _zz__zz_when_Pc_l134_32_1};
  assign _zz__zz_when_Pc_l134_32_3 = _zz_when_Pc_l134_31[15 : 8];
  assign _zz__zz_when_Pc_l134_32_2 = {{24{_zz__zz_when_Pc_l134_32_3[7]}}, _zz__zz_when_Pc_l134_32_3};
  assign _zz__zz_when_Pc_l134_32_5 = _zz_when_Pc_l134_31[23 : 16];
  assign _zz__zz_when_Pc_l134_32_4 = {{24{_zz__zz_when_Pc_l134_32_5[7]}}, _zz__zz_when_Pc_l134_32_5};
  assign _zz__zz_when_Pc_l134_32_7 = _zz_when_Pc_l134_31[31 : 24];
  assign _zz__zz_when_Pc_l134_32_6 = {{24{_zz__zz_when_Pc_l134_32_7[7]}}, _zz__zz_when_Pc_l134_32_7};
  assign _zz__zz_when_Pc_l134_33 = _zz_when_Pc_l134_31[7 : 0];
  assign _zz__zz_when_Pc_l134_33_1 = _zz_when_Pc_l134_31[15 : 8];
  assign _zz__zz_when_Pc_l134_33_2 = _zz_when_Pc_l134_31[23 : 16];
  assign _zz__zz_when_Pc_l134_33_3 = _zz_when_Pc_l134_31[31 : 24];
  assign _zz__zz_when_Pc_l134_34_1 = _zz_when_Pc_l134_31[15 : 0];
  assign _zz__zz_when_Pc_l134_34 = {{16{_zz__zz_when_Pc_l134_34_1[15]}}, _zz__zz_when_Pc_l134_34_1};
  assign _zz__zz_when_Pc_l134_34_3 = _zz_when_Pc_l134_31[31 : 15];
  assign _zz__zz_when_Pc_l134_34_2 = {{15{_zz__zz_when_Pc_l134_34_3[16]}}, _zz__zz_when_Pc_l134_34_3};
  assign _zz__zz_when_Pc_l134_35 = _zz_when_Pc_l134_31[15 : 0];
  assign _zz__zz_when_Pc_l134_35_1 = _zz_when_Pc_l134_31[31 : 15];
  assign _zz__zz_50_port0 = _zz_50[_zz_when_Decoder_l41_8];
  always @(posedge clk) begin
    if(_zz_32) begin
      _zz_51[_zz_when_RegisterFile_l36_5] <= _zz_when_Pc_l134_10;
    end
  end

  assign _zz__zz_51_port1 = _zz_51[_zz_when_Bypass_l26_7];
  assign _zz__zz_51_port2 = _zz_51[_zz_when_Bypass_l39_3];
  assign _zz__zz_51_port3 = _zz_51[_zz_when_Bypass_l26_6];
  always @(posedge clk) begin
    if(_zz_22[0] && _zz_20) begin
      _zz_56_symbol0[_zz__zz_56_port] <= _zz_65[7 : 0];
    end
    if(_zz_22[1] && _zz_20) begin
      _zz_56_symbol1[_zz__zz_56_port] <= _zz_65[15 : 8];
    end
    if(_zz_22[2] && _zz_20) begin
      _zz_56_symbol2[_zz__zz_56_port] <= _zz_65[23 : 16];
    end
    if(_zz_22[3] && _zz_20) begin
      _zz_56_symbol3[_zz__zz_56_port] <= _zz_65[31 : 24];
    end
  end

  assign _zz__zz_56_port1[7 : 0] = _zz_56_symbol0[_zz_when_Pc_l134_30];
  assign _zz__zz_56_port1[15 : 8] = _zz_56_symbol1[_zz_when_Pc_l134_30];
  assign _zz__zz_56_port1[23 : 16] = _zz_56_symbol2[_zz_when_Pc_l134_30];
  assign _zz__zz_56_port1[31 : 24] = _zz_56_symbol3[_zz_when_Pc_l134_30];
  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_2)
      DcacheReadType_b : _zz_2_string = "b ";
      DcacheReadType_bu : _zz_2_string = "bu";
      DcacheReadType_h : _zz_2_string = "h ";
      DcacheReadType_hu : _zz_2_string = "hu";
      DcacheReadType_w : _zz_2_string = "w ";
      default : _zz_2_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_3)
      DcacheStoreType_b : _zz_3_string = "b";
      DcacheStoreType_h : _zz_3_string = "h";
      DcacheStoreType_w : _zz_3_string = "w";
      default : _zz_3_string = "?";
    endcase
  end
  always @(*) begin
    case(_zz_7)
      DcacheReadType_b : _zz_7_string = "b ";
      DcacheReadType_bu : _zz_7_string = "bu";
      DcacheReadType_h : _zz_7_string = "h ";
      DcacheReadType_hu : _zz_7_string = "hu";
      DcacheReadType_w : _zz_7_string = "w ";
      default : _zz_7_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_8)
      DcacheReadType_b : _zz_8_string = "b ";
      DcacheReadType_bu : _zz_8_string = "bu";
      DcacheReadType_h : _zz_8_string = "h ";
      DcacheReadType_hu : _zz_8_string = "hu";
      DcacheReadType_w : _zz_8_string = "w ";
      default : _zz_8_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_9)
      DcacheStoreType_b : _zz_9_string = "b";
      DcacheStoreType_h : _zz_9_string = "h";
      DcacheStoreType_w : _zz_9_string = "w";
      default : _zz_9_string = "?";
    endcase
  end
  always @(*) begin
    case(_zz_10)
      DcacheStoreType_b : _zz_10_string = "b";
      DcacheStoreType_h : _zz_10_string = "h";
      DcacheStoreType_w : _zz_10_string = "w";
      default : _zz_10_string = "?";
    endcase
  end
  always @(*) begin
    case(_zz_12)
      ShifterSrc2_rk : _zz_12_string = "rk ";
      ShifterSrc2_ui5 : _zz_12_string = "ui5";
      default : _zz_12_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_when_Pc_l134_1)
      ShifterOp_sll_1 : _zz_when_Pc_l134_1_string = "sll_1";
      ShifterOp_srl_1 : _zz_when_Pc_l134_1_string = "srl_1";
      ShifterOp_sra_1 : _zz_when_Pc_l134_1_string = "sra_1";
      default : _zz_when_Pc_l134_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_14)
      AluSrc2_rk : _zz_14_string = "rk ";
      AluSrc2_luc : _zz_14_string = "luc";
      default : _zz_14_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_15)
      AluSrc1_rj : _zz_15_string = "rj";
      AluSrc1_pc : _zz_15_string = "pc";
      default : _zz_15_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_16)
      AluOp_add : _zz_16_string = "add  ";
      AluOp_sub : _zz_16_string = "sub  ";
      AluOp_and_1 : _zz_16_string = "and_1";
      AluOp_or_1 : _zz_16_string = "or_1 ";
      AluOp_nor_1 : _zz_16_string = "nor_1";
      AluOp_xor_1 : _zz_16_string = "xor_1";
      default : _zz_16_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_19)
      DcacheReadType_b : _zz_19_string = "b ";
      DcacheReadType_bu : _zz_19_string = "bu";
      DcacheReadType_h : _zz_19_string = "h ";
      DcacheReadType_hu : _zz_19_string = "hu";
      DcacheReadType_w : _zz_19_string = "w ";
      default : _zz_19_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_21)
      DcacheStoreType_b : _zz_21_string = "b";
      DcacheStoreType_h : _zz_21_string = "h";
      DcacheStoreType_w : _zz_21_string = "w";
      default : _zz_21_string = "?";
    endcase
  end
  always @(*) begin
    case(_zz_when_Pc_l134_6)
      ShifterOp_sll_1 : _zz_when_Pc_l134_6_string = "sll_1";
      ShifterOp_srl_1 : _zz_when_Pc_l134_6_string = "srl_1";
      ShifterOp_sra_1 : _zz_when_Pc_l134_6_string = "sra_1";
      default : _zz_when_Pc_l134_6_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_23)
      ShifterSrc2_rk : _zz_23_string = "rk ";
      ShifterSrc2_ui5 : _zz_23_string = "ui5";
      default : _zz_23_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_24)
      AluOp_add : _zz_24_string = "add  ";
      AluOp_sub : _zz_24_string = "sub  ";
      AluOp_and_1 : _zz_24_string = "and_1";
      AluOp_or_1 : _zz_24_string = "or_1 ";
      AluOp_nor_1 : _zz_24_string = "nor_1";
      AluOp_xor_1 : _zz_24_string = "xor_1";
      default : _zz_24_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_25)
      AluSrc2_rk : _zz_25_string = "rk ";
      AluSrc2_luc : _zz_25_string = "luc";
      default : _zz_25_string = "???";
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
    case(_zz_33)
      DcacheReadType_b : _zz_33_string = "b ";
      DcacheReadType_bu : _zz_33_string = "bu";
      DcacheReadType_h : _zz_33_string = "h ";
      DcacheReadType_hu : _zz_33_string = "hu";
      DcacheReadType_w : _zz_33_string = "w ";
      default : _zz_33_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_34)
      DcacheStoreType_b : _zz_34_string = "b";
      DcacheStoreType_h : _zz_34_string = "h";
      DcacheStoreType_w : _zz_34_string = "w";
      default : _zz_34_string = "?";
    endcase
  end
  always @(*) begin
    case(_zz_36)
      ComparerSrc2_registerVal2 : _zz_36_string = "registerVal2";
      ComparerSrc2_si12 : _zz_36_string = "si12        ";
      default : _zz_36_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_37)
      ComparerOp_eq : _zz_37_string = "eq ";
      ComparerOp_ne : _zz_37_string = "ne ";
      ComparerOp_lt : _zz_37_string = "lt ";
      ComparerOp_ge : _zz_37_string = "ge ";
      ComparerOp_ltu : _zz_37_string = "ltu";
      ComparerOp_geu : _zz_37_string = "geu";
      default : _zz_37_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_39)
      ShifterSrc2_rk : _zz_39_string = "rk ";
      ShifterSrc2_ui5 : _zz_39_string = "ui5";
      default : _zz_39_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_when_Pc_l134_11)
      ShifterOp_sll_1 : _zz_when_Pc_l134_11_string = "sll_1";
      ShifterOp_srl_1 : _zz_when_Pc_l134_11_string = "srl_1";
      ShifterOp_sra_1 : _zz_when_Pc_l134_11_string = "sra_1";
      default : _zz_when_Pc_l134_11_string = "?????";
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
      AluOp_and_1 : _zz_45_string = "and_1";
      AluOp_or_1 : _zz_45_string = "or_1 ";
      AluOp_nor_1 : _zz_45_string = "nor_1";
      AluOp_xor_1 : _zz_45_string = "xor_1";
      default : _zz_45_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_49)
      NpcOp_pc4 : _zz_49_string = "pc4   ";
      NpcOp_offs16 : _zz_49_string = "offs16";
      NpcOp_offs26 : _zz_49_string = "offs26";
      default : _zz_49_string = "??????";
    endcase
  end
  `endif

  assign _zz_when_Pc_l134_9 = _zz_when_Pc_l134_3;
  always @(*) begin
    _zz_when_Pc_l134_3 = _zz_when_Pc_l134_2;
    if(when_Dcache_l187) begin
      _zz_when_Pc_l134_3 = _zz_when_Pc_l134_36;
    end
  end

  always @(*) begin
    _zz_20 = 1'b0;
    if(when_Dcache_l150) begin
      _zz_20 = 1'b1;
    end
  end

  assign _zz_22 = _zz_64;
  always @(*) begin
    _zz_when_Pc_l134_8 = _zz_when_Pc_l134_7;
    if(_zz_13) begin
      _zz_when_Pc_l134_8 = _zz_switch_Misc_l241_4;
    end
    if(_zz_11) begin
      _zz_when_Pc_l134_8 = _zz_when_Pc_l134_22;
    end
  end

  always @(*) begin
    _zz_memory_haltRequest_Bypass_l43 = 1'b0;
    if(_zz_4) begin
      if(when_Bypass_l39_2) begin
        if(!_zz_when_RegisterFile_l36_6) begin
          _zz_memory_haltRequest_Bypass_l43 = 1'b1;
        end
      end
    end
  end

  assign _zz_28 = _zz_29;
  always @(*) begin
    _zz_29 = _zz_27;
    if(_zz_4) begin
      if(when_Bypass_l39_2) begin
        if(_zz_when_RegisterFile_l36_6) begin
          _zz_29 = _zz_when_Pc_l134_10;
        end
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l43 = 1'b0;
    if(_zz_30) begin
      if(when_Bypass_l39_1) begin
        if(!_zz_when_RegisterFile_l36_4) begin
          _zz_execute_haltRequest_Bypass_l43 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l43_1 = 1'b0;
    if(_zz_30) begin
      if(when_Bypass_l39) begin
        if(!_zz_when_RegisterFile_l36_6) begin
          _zz_execute_haltRequest_Bypass_l43_1 = 1'b1;
        end
      end
    end
  end

  assign _zz_switch_Misc_l241_8 = _zz_switch_Misc_l241_9;
  always @(*) begin
    _zz_switch_Misc_l241_9 = _zz_switch_Misc_l241_7;
    if(_zz_30) begin
      if(when_Bypass_l39) begin
        if(_zz_when_RegisterFile_l36_6) begin
          _zz_switch_Misc_l241_9 = _zz_when_Pc_l134_10;
        end
      end
      if(when_Bypass_l39_1) begin
        if(_zz_when_RegisterFile_l36_4) begin
          _zz_switch_Misc_l241_9 = _zz_when_Pc_l134_9;
        end
      end
    end
  end

  always @(*) begin
    _zz_memory_haltRequest_Bypass_l30 = 1'b0;
    if(_zz_5) begin
      if(when_Bypass_l26_2) begin
        if(!_zz_when_RegisterFile_l36_6) begin
          _zz_memory_haltRequest_Bypass_l30 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l30 = 1'b0;
    if(_zz_31) begin
      if(when_Bypass_l26_1) begin
        if(!_zz_when_RegisterFile_l36_4) begin
          _zz_execute_haltRequest_Bypass_l30 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_execute_haltRequest_Bypass_l30_1 = 1'b0;
    if(_zz_31) begin
      if(when_Bypass_l26) begin
        if(!_zz_when_RegisterFile_l36_6) begin
          _zz_execute_haltRequest_Bypass_l30_1 = 1'b1;
        end
      end
    end
  end

  assign _zz_switch_Misc_l241_11 = _zz_switch_Misc_l241_12;
  always @(*) begin
    _zz_switch_Misc_l241_12 = _zz_switch_Misc_l241_10;
    if(_zz_31) begin
      if(when_Bypass_l26) begin
        if(_zz_when_RegisterFile_l36_6) begin
          _zz_switch_Misc_l241_12 = _zz_when_Pc_l134_10;
        end
      end
      if(when_Bypass_l26_1) begin
        if(_zz_when_RegisterFile_l36_4) begin
          _zz_switch_Misc_l241_12 = _zz_when_Pc_l134_9;
        end
      end
    end
  end

  always @(*) begin
    _zz_32 = 1'b0;
    if(when_RegisterFile_l36) begin
      _zz_32 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Pc_l134_12 = ((_zz_when_Bypass_l26_6 != 5'h00) ? ((_zz_when_Bypass_l26_6 == _zz_when_RegisterFile_l36_5) ? _zz_when_Pc_l134_10 : _zz__zz_51_port3) : 32'h00000000);
    if(_zz_48) begin
      _zz_when_Pc_l134_12 = _zz__zz_when_Pc_l134_12;
    end
    if(_zz_41) begin
      _zz_when_Pc_l134_12 = _zz_switch_Misc_l241_6;
    end
    if(_zz_35) begin
      _zz_when_Pc_l134_12 = {31'd0, _zz__zz_when_Pc_l134_12_1};
    end
  end

  assign _zz_when_Decoder_l41_4 = _zz_when_Decoder_l41_6;
  always @(*) begin
    _zz_when_Decoder_l41_5 = (_zz_when_Decoder_l41_4 + 32'h00000004);
    if(when_Pc_l134) begin
      _zz_when_Decoder_l41_5 = _zz_when_Decoder_l41_7;
    end
  end

  assign when_Pc_l134 = (_zz_when_Pc_l134_15 && (_zz_when_Pc_l134_14 || _zz_when_Pc_l134_13));
  always @(*) begin
    case(_zz_49)
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
    _zz_49 = NpcOp_pc4;
    if(when_Decoder_l41_6) begin
      _zz_49 = NpcOp_offs26;
    end
    if(when_Decoder_l41_7) begin
      _zz_49 = NpcOp_offs26;
    end
    if(when_Decoder_l41_8) begin
      _zz_49 = NpcOp_offs16;
    end
  end

  always @(*) begin
    _zz_when_Pc_l134_15 = 1'b0;
    if(when_Decoder_l41) begin
      _zz_when_Pc_l134_15 = 1'b1;
    end
    if(when_Decoder_l41_1) begin
      _zz_when_Pc_l134_15 = 1'b1;
    end
    if(when_Decoder_l41_2) begin
      _zz_when_Pc_l134_15 = 1'b1;
    end
    if(when_Decoder_l41_3) begin
      _zz_when_Pc_l134_15 = 1'b1;
    end
    if(when_Decoder_l41_4) begin
      _zz_when_Pc_l134_15 = 1'b1;
    end
    if(when_Decoder_l41_5) begin
      _zz_when_Pc_l134_15 = 1'b1;
    end
    if(when_Decoder_l41_6) begin
      _zz_when_Pc_l134_15 = 1'b1;
    end
    if(when_Decoder_l41_7) begin
      _zz_when_Pc_l134_15 = 1'b1;
    end
    if(when_Decoder_l41_8) begin
      _zz_when_Pc_l134_15 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Pc_l134_13 = 1'b0;
    if(when_Decoder_l41_6) begin
      _zz_when_Pc_l134_13 = 1'b1;
    end
    if(when_Decoder_l41_7) begin
      _zz_when_Pc_l134_13 = 1'b1;
    end
    if(when_Decoder_l41_8) begin
      _zz_when_Pc_l134_13 = 1'b1;
    end
  end

  always @(*) begin
    _zz_48 = 1'b0;
    if(when_Decoder_l41_7) begin
      _zz_48 = 1'b1;
    end
    if(when_Decoder_l41_8) begin
      _zz_48 = 1'b1;
    end
  end

  always @(*) begin
    _zz_47 = 1'b0;
    if(when_Decoder_l41) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_1) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_2) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_3) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_4) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_5) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_9) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_10) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_11) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_14) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_15) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_16) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_17) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_18) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_19) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_20) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_21) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_22) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_23) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_24) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_25) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_26) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_27) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_28) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_29) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_30) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_31) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_32) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_33) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_34) begin
      _zz_47 = 1'b1;
    end
    if(when_Decoder_l41_35) begin
      _zz_47 = 1'b1;
    end
  end

  always @(*) begin
    _zz_46 = 1'b0;
    if(when_Decoder_l41) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_1) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_2) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_3) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_4) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_5) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_9) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_10) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_14) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_15) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_16) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_17) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_21) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_22) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_23) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_27) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_28) begin
      _zz_46 = 1'b1;
    end
    if(when_Decoder_l41_35) begin
      _zz_46 = 1'b1;
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
    if(when_Decoder_l41_35) begin
      _zz_when_Bypass_l39_3 = _zz_when_Decoder_l41_2[14 : 10];
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
    if(when_Decoder_l41_31) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_32) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_33) begin
      _zz_when_RegisterFile_l36_7 = 1'b1;
    end
    if(when_Decoder_l41_34) begin
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
    _zz_45 = AluOp_add;
    if(when_Decoder_l41_10) begin
      _zz_45 = AluOp_sub;
    end
    if(when_Decoder_l41_14) begin
      _zz_45 = AluOp_and_1;
    end
    if(when_Decoder_l41_15) begin
      _zz_45 = AluOp_or_1;
    end
    if(when_Decoder_l41_16) begin
      _zz_45 = AluOp_nor_1;
    end
    if(when_Decoder_l41_17) begin
      _zz_45 = AluOp_xor_1;
    end
    if(when_Decoder_l41_18) begin
      _zz_45 = AluOp_and_1;
    end
    if(when_Decoder_l41_19) begin
      _zz_45 = AluOp_or_1;
    end
    if(when_Decoder_l41_20) begin
      _zz_45 = AluOp_xor_1;
    end
    if(when_Decoder_l41_31) begin
      _zz_45 = AluOp_add;
    end
    if(when_Decoder_l41_32) begin
      _zz_45 = AluOp_add;
    end
    if(when_Decoder_l41_33) begin
      _zz_45 = AluOp_add;
    end
    if(when_Decoder_l41_34) begin
      _zz_45 = AluOp_add;
    end
    if(when_Decoder_l41_35) begin
      _zz_45 = AluOp_add;
    end
  end

  always @(*) begin
    _zz_44 = AluSrc1_rj;
    if(when_Decoder_l41_13) begin
      _zz_44 = AluSrc1_pc;
    end
  end

  always @(*) begin
    _zz_43 = AluSrc2_rk;
    if(when_Decoder_l41_11) begin
      _zz_43 = AluSrc2_luc;
    end
    if(when_Decoder_l41_13) begin
      _zz_43 = AluSrc2_luc;
    end
    if(when_Decoder_l41_18) begin
      _zz_43 = AluSrc2_luc;
    end
    if(when_Decoder_l41_19) begin
      _zz_43 = AluSrc2_luc;
    end
    if(when_Decoder_l41_20) begin
      _zz_43 = AluSrc2_luc;
    end
    if(when_Decoder_l41_31) begin
      _zz_43 = AluSrc2_luc;
    end
    if(when_Decoder_l41_32) begin
      _zz_43 = AluSrc2_luc;
    end
    if(when_Decoder_l41_33) begin
      _zz_43 = AluSrc2_luc;
    end
    if(when_Decoder_l41_34) begin
      _zz_43 = AluSrc2_luc;
    end
    if(when_Decoder_l41_35) begin
      _zz_43 = AluSrc2_luc;
    end
  end

  always @(*) begin
    _zz_42 = LucOp_si12;
    if(when_Decoder_l41_11) begin
      _zz_42 = LucOp_si12;
    end
    if(when_Decoder_l41_12) begin
      _zz_42 = LucOp_si20;
    end
    if(when_Decoder_l41_13) begin
      _zz_42 = LucOp_si20;
    end
    if(when_Decoder_l41_18) begin
      _zz_42 = LucOp_ui12;
    end
    if(when_Decoder_l41_19) begin
      _zz_42 = LucOp_ui12;
    end
    if(when_Decoder_l41_20) begin
      _zz_42 = LucOp_ui12;
    end
    if(when_Decoder_l41_31) begin
      _zz_42 = LucOp_si12;
    end
    if(when_Decoder_l41_32) begin
      _zz_42 = LucOp_si12;
    end
    if(when_Decoder_l41_33) begin
      _zz_42 = LucOp_si12;
    end
    if(when_Decoder_l41_34) begin
      _zz_42 = LucOp_si12;
    end
    if(when_Decoder_l41_35) begin
      _zz_42 = LucOp_si12;
    end
  end

  always @(*) begin
    _zz_41 = 1'b0;
    if(when_Decoder_l41_12) begin
      _zz_41 = 1'b1;
    end
  end

  always @(*) begin
    _zz_40 = 1'b0;
    if(when_Decoder_l41_9) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l41_10) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l41_11) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l41_13) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l41_14) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l41_15) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l41_16) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l41_17) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l41_18) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l41_19) begin
      _zz_40 = 1'b1;
    end
    if(when_Decoder_l41_20) begin
      _zz_40 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Pc_l134_11 = ShifterOp_sll_1;
    if(when_Decoder_l41_22) begin
      _zz_when_Pc_l134_11 = ShifterOp_srl_1;
    end
    if(when_Decoder_l41_23) begin
      _zz_when_Pc_l134_11 = ShifterOp_sra_1;
    end
    if(when_Decoder_l41_25) begin
      _zz_when_Pc_l134_11 = ShifterOp_srl_1;
    end
    if(when_Decoder_l41_26) begin
      _zz_when_Pc_l134_11 = ShifterOp_sra_1;
    end
  end

  always @(*) begin
    _zz_39 = ShifterSrc2_rk;
    if(when_Decoder_l41_24) begin
      _zz_39 = ShifterSrc2_ui5;
    end
    if(when_Decoder_l41_25) begin
      _zz_39 = ShifterSrc2_ui5;
    end
    if(when_Decoder_l41_26) begin
      _zz_39 = ShifterSrc2_ui5;
    end
  end

  always @(*) begin
    _zz_38 = 1'b0;
    if(when_Decoder_l41_21) begin
      _zz_38 = 1'b1;
    end
    if(when_Decoder_l41_22) begin
      _zz_38 = 1'b1;
    end
    if(when_Decoder_l41_23) begin
      _zz_38 = 1'b1;
    end
    if(when_Decoder_l41_24) begin
      _zz_38 = 1'b1;
    end
    if(when_Decoder_l41_25) begin
      _zz_38 = 1'b1;
    end
    if(when_Decoder_l41_26) begin
      _zz_38 = 1'b1;
    end
  end

  always @(*) begin
    _zz_37 = ComparerOp_lt;
    if(when_Decoder_l41) begin
      _zz_37 = ComparerOp_eq;
    end
    if(when_Decoder_l41_1) begin
      _zz_37 = ComparerOp_ne;
    end
    if(when_Decoder_l41_2) begin
      _zz_37 = ComparerOp_lt;
    end
    if(when_Decoder_l41_3) begin
      _zz_37 = ComparerOp_ge;
    end
    if(when_Decoder_l41_4) begin
      _zz_37 = ComparerOp_ltu;
    end
    if(when_Decoder_l41_5) begin
      _zz_37 = ComparerOp_geu;
    end
    if(when_Decoder_l41_27) begin
      _zz_37 = ComparerOp_lt;
    end
    if(when_Decoder_l41_28) begin
      _zz_37 = ComparerOp_ltu;
    end
    if(when_Decoder_l41_29) begin
      _zz_37 = ComparerOp_lt;
    end
    if(when_Decoder_l41_30) begin
      _zz_37 = ComparerOp_ltu;
    end
  end

  always @(*) begin
    _zz_36 = ComparerSrc2_registerVal2;
    if(when_Decoder_l41_29) begin
      _zz_36 = ComparerSrc2_si12;
    end
    if(when_Decoder_l41_30) begin
      _zz_36 = ComparerSrc2_si12;
    end
  end

  always @(*) begin
    _zz_35 = 1'b0;
    if(when_Decoder_l41_27) begin
      _zz_35 = 1'b1;
    end
    if(when_Decoder_l41_28) begin
      _zz_35 = 1'b1;
    end
    if(when_Decoder_l41_29) begin
      _zz_35 = 1'b1;
    end
    if(when_Decoder_l41_30) begin
      _zz_35 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Dcache_l150_2 = 1'b0;
    if(when_Decoder_l41_35) begin
      _zz_when_Dcache_l150_2 = 1'b1;
    end
  end

  always @(*) begin
    _zz_34 = DcacheStoreType_w;
    if(when_Decoder_l41_35) begin
      _zz_34 = DcacheStoreType_w;
    end
  end

  always @(*) begin
    _zz_33 = DcacheReadType_w;
    if(when_Decoder_l41_31) begin
      _zz_33 = DcacheReadType_b;
    end
    if(when_Decoder_l41_32) begin
      _zz_33 = DcacheReadType_bu;
    end
    if(when_Decoder_l41_33) begin
      _zz_33 = DcacheReadType_h;
    end
    if(when_Decoder_l41_34) begin
      _zz_33 = DcacheReadType_hu;
    end
  end

  always @(*) begin
    _zz_when_Dcache_l187_2 = 1'b0;
    if(when_Decoder_l41_31) begin
      _zz_when_Dcache_l187_2 = 1'b1;
    end
    if(when_Decoder_l41_32) begin
      _zz_when_Dcache_l187_2 = 1'b1;
    end
    if(when_Decoder_l41_33) begin
      _zz_when_Dcache_l187_2 = 1'b1;
    end
    if(when_Decoder_l41_34) begin
      _zz_when_Dcache_l187_2 = 1'b1;
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
  assign when_Decoder_l41_31 = ((_zz_when_Decoder_l41_2 & 32'hffc00000) == 32'h28000000);
  assign when_Decoder_l41_32 = ((_zz_when_Decoder_l41_2 & 32'hffc00000) == 32'h2a000000);
  assign when_Decoder_l41_33 = ((_zz_when_Decoder_l41_2 & 32'hffc00000) == 32'h28400000);
  assign when_Decoder_l41_34 = ((_zz_when_Decoder_l41_2 & 32'hffc00000) == 32'h2a400000);
  assign when_Decoder_l41_35 = ((_zz_when_Decoder_l41_2 & 32'hffc00000) == 32'h28800000);
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
    case(_zz_42)
      LucOp_si12 : begin
        _zz_switch_Misc_l241_13 = _zz__zz_switch_Misc_l241_13;
      end
      LucOp_si20 : begin
        _zz_switch_Misc_l241_13 = {_zz_when_Decoder_l41_2[24 : 5],12'h000};
      end
      default : begin
        _zz_switch_Misc_l241_13 = _zz__zz_switch_Misc_l241_13_2;
      end
    endcase
  end

  assign _zz_switch_Misc_l241_6 = _zz_switch_Misc_l241_13;
  always @(*) begin
    case(_zz_26)
      AluSrc1_rj : begin
        _zz_switch_Misc_l241_16 = _zz_switch_Misc_l241_11;
      end
      default : begin
        _zz_switch_Misc_l241_16 = _zz_switch_Misc_l241_5;
      end
    endcase
  end

  assign _zz_switch_Misc_l241_14 = _zz_switch_Misc_l241_16;
  always @(*) begin
    case(_zz_25)
      AluSrc2_rk : begin
        _zz_switch_Misc_l241_17 = _zz_switch_Misc_l241_8;
      end
      default : begin
        _zz_switch_Misc_l241_17 = _zz_switch_Misc_l241_1;
      end
    endcase
  end

  assign _zz_switch_Misc_l241_15 = _zz_switch_Misc_l241_17;
  always @(*) begin
    case(_zz_24)
      AluOp_add : begin
        _zz_switch_Misc_l241_18 = _zz__zz_switch_Misc_l241_18;
      end
      AluOp_sub : begin
        _zz_switch_Misc_l241_18 = _zz__zz_switch_Misc_l241_18_1;
      end
      AluOp_and_1 : begin
        _zz_switch_Misc_l241_18 = (_zz_switch_Misc_l241_14 & _zz_switch_Misc_l241_15);
      end
      AluOp_or_1 : begin
        _zz_switch_Misc_l241_18 = (_zz_switch_Misc_l241_14 | _zz_switch_Misc_l241_15);
      end
      AluOp_nor_1 : begin
        _zz_switch_Misc_l241_18 = (~ (_zz_switch_Misc_l241_14 | _zz_switch_Misc_l241_15));
      end
      default : begin
        _zz_switch_Misc_l241_18 = (_zz_switch_Misc_l241_14 ^ _zz_switch_Misc_l241_15);
      end
    endcase
  end

  assign _zz_switch_Misc_l241_4 = _zz_switch_Misc_l241_18;
  assign _zz_52 = _zz_1;
  assign _zz_53 = _zz_when_RegisterFile_l36_6;
  assign _zz_54 = _zz_when_RegisterFile_l36_5;
  assign _zz_55 = _zz_when_Pc_l134_10;
  assign _zz_when_Pc_l134_16 = _zz_switch_Misc_l241_11;
  always @(*) begin
    case(_zz_23)
      ShifterSrc2_rk : begin
        _zz_when_Pc_l134_17 = _zz_switch_Misc_l241_8[4 : 0];
      end
      default : begin
        _zz_when_Pc_l134_17 = _zz_when_Bypass_l39_2;
      end
    endcase
  end

  always @(*) begin
    _zz_when_Pc_l134_18[0] = _zz_when_Pc_l134_16[31];
    _zz_when_Pc_l134_18[1] = _zz_when_Pc_l134_16[30];
    _zz_when_Pc_l134_18[2] = _zz_when_Pc_l134_16[29];
    _zz_when_Pc_l134_18[3] = _zz_when_Pc_l134_16[28];
    _zz_when_Pc_l134_18[4] = _zz_when_Pc_l134_16[27];
    _zz_when_Pc_l134_18[5] = _zz_when_Pc_l134_16[26];
    _zz_when_Pc_l134_18[6] = _zz_when_Pc_l134_16[25];
    _zz_when_Pc_l134_18[7] = _zz_when_Pc_l134_16[24];
    _zz_when_Pc_l134_18[8] = _zz_when_Pc_l134_16[23];
    _zz_when_Pc_l134_18[9] = _zz_when_Pc_l134_16[22];
    _zz_when_Pc_l134_18[10] = _zz_when_Pc_l134_16[21];
    _zz_when_Pc_l134_18[11] = _zz_when_Pc_l134_16[20];
    _zz_when_Pc_l134_18[12] = _zz_when_Pc_l134_16[19];
    _zz_when_Pc_l134_18[13] = _zz_when_Pc_l134_16[18];
    _zz_when_Pc_l134_18[14] = _zz_when_Pc_l134_16[17];
    _zz_when_Pc_l134_18[15] = _zz_when_Pc_l134_16[16];
    _zz_when_Pc_l134_18[16] = _zz_when_Pc_l134_16[15];
    _zz_when_Pc_l134_18[17] = _zz_when_Pc_l134_16[14];
    _zz_when_Pc_l134_18[18] = _zz_when_Pc_l134_16[13];
    _zz_when_Pc_l134_18[19] = _zz_when_Pc_l134_16[12];
    _zz_when_Pc_l134_18[20] = _zz_when_Pc_l134_16[11];
    _zz_when_Pc_l134_18[21] = _zz_when_Pc_l134_16[10];
    _zz_when_Pc_l134_18[22] = _zz_when_Pc_l134_16[9];
    _zz_when_Pc_l134_18[23] = _zz_when_Pc_l134_16[8];
    _zz_when_Pc_l134_18[24] = _zz_when_Pc_l134_16[7];
    _zz_when_Pc_l134_18[25] = _zz_when_Pc_l134_16[6];
    _zz_when_Pc_l134_18[26] = _zz_when_Pc_l134_16[5];
    _zz_when_Pc_l134_18[27] = _zz_when_Pc_l134_16[4];
    _zz_when_Pc_l134_18[28] = _zz_when_Pc_l134_16[3];
    _zz_when_Pc_l134_18[29] = _zz_when_Pc_l134_16[2];
    _zz_when_Pc_l134_18[30] = _zz_when_Pc_l134_16[1];
    _zz_when_Pc_l134_18[31] = _zz_when_Pc_l134_16[0];
  end

  always @(*) begin
    case(_zz_when_Pc_l134_6)
      ShifterOp_sll_1 : begin
        _zz_when_Pc_l134_19 = _zz_when_Pc_l134_18;
      end
      default : begin
        _zz_when_Pc_l134_19 = _zz_when_Pc_l134_16;
      end
    endcase
  end

  assign _zz_when_Pc_l134_20 = _zz__zz_when_Pc_l134_20[31 : 0];
  always @(*) begin
    _zz_when_Pc_l134_21[0] = _zz_when_Pc_l134_20[31];
    _zz_when_Pc_l134_21[1] = _zz_when_Pc_l134_20[30];
    _zz_when_Pc_l134_21[2] = _zz_when_Pc_l134_20[29];
    _zz_when_Pc_l134_21[3] = _zz_when_Pc_l134_20[28];
    _zz_when_Pc_l134_21[4] = _zz_when_Pc_l134_20[27];
    _zz_when_Pc_l134_21[5] = _zz_when_Pc_l134_20[26];
    _zz_when_Pc_l134_21[6] = _zz_when_Pc_l134_20[25];
    _zz_when_Pc_l134_21[7] = _zz_when_Pc_l134_20[24];
    _zz_when_Pc_l134_21[8] = _zz_when_Pc_l134_20[23];
    _zz_when_Pc_l134_21[9] = _zz_when_Pc_l134_20[22];
    _zz_when_Pc_l134_21[10] = _zz_when_Pc_l134_20[21];
    _zz_when_Pc_l134_21[11] = _zz_when_Pc_l134_20[20];
    _zz_when_Pc_l134_21[12] = _zz_when_Pc_l134_20[19];
    _zz_when_Pc_l134_21[13] = _zz_when_Pc_l134_20[18];
    _zz_when_Pc_l134_21[14] = _zz_when_Pc_l134_20[17];
    _zz_when_Pc_l134_21[15] = _zz_when_Pc_l134_20[16];
    _zz_when_Pc_l134_21[16] = _zz_when_Pc_l134_20[15];
    _zz_when_Pc_l134_21[17] = _zz_when_Pc_l134_20[14];
    _zz_when_Pc_l134_21[18] = _zz_when_Pc_l134_20[13];
    _zz_when_Pc_l134_21[19] = _zz_when_Pc_l134_20[12];
    _zz_when_Pc_l134_21[20] = _zz_when_Pc_l134_20[11];
    _zz_when_Pc_l134_21[21] = _zz_when_Pc_l134_20[10];
    _zz_when_Pc_l134_21[22] = _zz_when_Pc_l134_20[9];
    _zz_when_Pc_l134_21[23] = _zz_when_Pc_l134_20[8];
    _zz_when_Pc_l134_21[24] = _zz_when_Pc_l134_20[7];
    _zz_when_Pc_l134_21[25] = _zz_when_Pc_l134_20[6];
    _zz_when_Pc_l134_21[26] = _zz_when_Pc_l134_20[5];
    _zz_when_Pc_l134_21[27] = _zz_when_Pc_l134_20[4];
    _zz_when_Pc_l134_21[28] = _zz_when_Pc_l134_20[3];
    _zz_when_Pc_l134_21[29] = _zz_when_Pc_l134_20[2];
    _zz_when_Pc_l134_21[30] = _zz_when_Pc_l134_20[1];
    _zz_when_Pc_l134_21[31] = _zz_when_Pc_l134_20[0];
  end

  always @(*) begin
    case(_zz_when_Pc_l134_6)
      ShifterOp_sll_1 : begin
        _zz_when_Pc_l134_22 = _zz_when_Pc_l134_21;
      end
      default : begin
        _zz_when_Pc_l134_22 = _zz_when_Pc_l134_20;
      end
    endcase
  end

  assign _zz_when_Pc_l134_23 = _zz_when_Pc_l134_5;
  always @(*) begin
    case(_zz_36)
      ComparerSrc2_registerVal2 : begin
        _zz_when_Pc_l134_25 = _zz_when_Pc_l134_4;
      end
      default : begin
        _zz_when_Pc_l134_25 = {20'd0, _zz__zz_when_Pc_l134_25};
      end
    endcase
  end

  assign _zz_when_Pc_l134_24 = _zz_when_Pc_l134_25;
  assign _zz_when_Pc_l134_26 = (_zz_when_Pc_l134_23 == _zz_when_Pc_l134_24);
  assign _zz_when_Pc_l134_27 = ($signed(_zz__zz_when_Pc_l134_27) < $signed(_zz__zz_when_Pc_l134_27_1));
  assign _zz_when_Pc_l134_28 = (_zz_when_Pc_l134_23 < _zz_when_Pc_l134_24);
  always @(*) begin
    case(_zz_37)
      ComparerOp_eq : begin
        _zz_when_Pc_l134_29 = _zz_when_Pc_l134_26;
      end
      ComparerOp_ne : begin
        _zz_when_Pc_l134_29 = (! _zz_when_Pc_l134_26);
      end
      ComparerOp_lt : begin
        _zz_when_Pc_l134_29 = _zz_when_Pc_l134_27;
      end
      ComparerOp_ge : begin
        _zz_when_Pc_l134_29 = (! _zz_when_Pc_l134_27);
      end
      ComparerOp_ltu : begin
        _zz_when_Pc_l134_29 = _zz_when_Pc_l134_28;
      end
      default : begin
        _zz_when_Pc_l134_29 = (! _zz_when_Pc_l134_28);
      end
    endcase
  end

  assign _zz_when_Pc_l134_14 = _zz_when_Pc_l134_29;
  assign switch_Misc_l241 = _zz_switch_Misc_l241_3[1 : 0];
  always @(*) begin
    case(switch_Misc_l241)
      2'b00 : begin
        _zz_62 = 4'b0001;
      end
      2'b01 : begin
        _zz_62 = 4'b0010;
      end
      2'b10 : begin
        _zz_62 = 4'b0100;
      end
      default : begin
        _zz_62 = 4'b1000;
      end
    endcase
  end

  assign switch_Misc_l241_1 = _zz_switch_Misc_l241_3[1 : 1];
  always @(*) begin
    case(switch_Misc_l241_1)
      1'b0 : begin
        _zz_63 = 4'b0011;
      end
      default : begin
        _zz_63 = 4'b1100;
      end
    endcase
  end

  always @(*) begin
    case(_zz_21)
      DcacheStoreType_b : begin
        _zz_64 = _zz_62;
      end
      DcacheStoreType_h : begin
        _zz_64 = _zz_63;
      end
      default : begin
        _zz_64 = 4'b1111;
      end
    endcase
  end

  always @(*) begin
    casez(_zz_22)
      4'b???1 : begin
        _zz_65 = _zz_28;
      end
      4'b??10 : begin
        _zz_65 = _zz__zz_65[31:0];
      end
      4'b?100 : begin
        _zz_65 = _zz__zz_65_1[31:0];
      end
      4'b1000 : begin
        _zz_65 = _zz__zz_65_2[31:0];
      end
      default : begin
        _zz_65 = 32'h00000000;
      end
    endcase
  end

  assign when_Dcache_l150 = (memory_up_isFiring && _zz_when_Dcache_l150);
  assign _zz_when_Pc_l134_30 = _zz__zz_when_Pc_l134_30[14:0];
  assign _zz_when_Pc_l134_31 = _zz__zz_56_port1;
  assign _zz_switch_Misc_l241_19 = _zz_switch_Misc_l241_3[1 : 0];
  always @(*) begin
    case(_zz_switch_Misc_l241_19)
      2'b00 : begin
        _zz_when_Pc_l134_32 = _zz__zz_when_Pc_l134_32;
      end
      2'b01 : begin
        _zz_when_Pc_l134_32 = _zz__zz_when_Pc_l134_32_2;
      end
      2'b10 : begin
        _zz_when_Pc_l134_32 = _zz__zz_when_Pc_l134_32_4;
      end
      default : begin
        _zz_when_Pc_l134_32 = _zz__zz_when_Pc_l134_32_6;
      end
    endcase
  end

  always @(*) begin
    case(_zz_switch_Misc_l241_19)
      2'b00 : begin
        _zz_when_Pc_l134_33 = {24'd0, _zz__zz_when_Pc_l134_33};
      end
      2'b01 : begin
        _zz_when_Pc_l134_33 = {24'd0, _zz__zz_when_Pc_l134_33_1};
      end
      2'b10 : begin
        _zz_when_Pc_l134_33 = {24'd0, _zz__zz_when_Pc_l134_33_2};
      end
      default : begin
        _zz_when_Pc_l134_33 = {24'd0, _zz__zz_when_Pc_l134_33_3};
      end
    endcase
  end

  assign switch_Misc_l241_2 = _zz_switch_Misc_l241_19[1 : 1];
  always @(*) begin
    case(switch_Misc_l241_2)
      1'b0 : begin
        _zz_when_Pc_l134_34 = _zz__zz_when_Pc_l134_34;
      end
      default : begin
        _zz_when_Pc_l134_34 = _zz__zz_when_Pc_l134_34_2;
      end
    endcase
  end

  assign switch_Misc_l241_3 = _zz_switch_Misc_l241_19[1 : 1];
  always @(*) begin
    case(switch_Misc_l241_3)
      1'b0 : begin
        _zz_when_Pc_l134_35 = {16'd0, _zz__zz_when_Pc_l134_35};
      end
      default : begin
        _zz_when_Pc_l134_35 = {15'd0, _zz__zz_when_Pc_l134_35_1};
      end
    endcase
  end

  always @(*) begin
    case(_zz_19)
      DcacheReadType_b : begin
        _zz_when_Pc_l134_36 = _zz_when_Pc_l134_32;
      end
      DcacheReadType_bu : begin
        _zz_when_Pc_l134_36 = _zz_when_Pc_l134_33;
      end
      DcacheReadType_h : begin
        _zz_when_Pc_l134_36 = _zz_when_Pc_l134_34;
      end
      DcacheReadType_hu : begin
        _zz_when_Pc_l134_36 = _zz_when_Pc_l134_35;
      end
      default : begin
        _zz_when_Pc_l134_36 = _zz_when_Pc_l134_31;
      end
    endcase
  end

  assign when_Dcache_l187 = (memory_up_isFiring && _zz_when_Dcache_l187);
  assign fetch_up_ready = fetch_down_isReady;
  assign decode_up_ready = decode_down_isReady;
  assign _zz_when_Decoder_l41_3 = _zz_when_Decoder_l41_1;
  assign _zz_when_Decoder_l41_2 = _zz_when_Decoder_l41;
  assign _zz_when_Pc_l134_5 = ((_zz_when_Bypass_l26_7 != 5'h00) ? ((_zz_when_Bypass_l26_7 == _zz_when_RegisterFile_l36_5) ? _zz_when_Pc_l134_10 : _zz__zz_51_port1) : 32'h00000000);
  assign _zz_when_Pc_l134_4 = ((_zz_when_Bypass_l39_3 != 5'h00) ? ((_zz_when_Bypass_l39_3 == _zz_when_RegisterFile_l36_5) ? _zz_when_Pc_l134_10 : _zz__zz_51_port2) : 32'h00000000);
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
  assign _zz_switch_Misc_l241_5 = _zz_switch_Misc_l241_2;
  assign _zz_31 = _zz_18;
  assign _zz_30 = _zz_17;
  assign _zz_when_Bypass_l26_5 = _zz_when_Bypass_l26_3;
  assign _zz_when_Bypass_l39_2 = _zz_when_Bypass_l39_1;
  assign _zz_24 = _zz_16;
  assign _zz_26 = _zz_15;
  assign _zz_25 = _zz_14;
  assign _zz_when_Pc_l134_6 = _zz_when_Pc_l134_1;
  assign _zz_23 = _zz_12;
  assign _zz_10 = _zz_9;
  assign _zz_8 = _zz_7;
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
  assign _zz_when_RegisterFile_l36_4 = _zz_when_RegisterFile_l36_2;
  assign _zz_when_Bypass_l26_4 = _zz_when_Bypass_l26;
  assign _zz_21 = _zz_3;
  assign _zz_19 = _zz_2;
  assign _zz_switch_Misc_l241_3 = _zz_switch_Misc_l241;
  assign write_down_valid = write_up_valid;
  assign _zz_when_Pc_l134_10 = _zz_when_Pc_l134;
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
  assign memory_up_isFiring = (memory_up_isValid && memory_up_isReady);
  assign memory_up_isValid = memory_up_valid;
  assign memory_up_isReady = memory_up_ready;
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
      _zz_when_Decoder_l41 <= _zz__zz_50_port0;
    end
    if(decode_down_isReady) begin
      _zz_switch_Misc_l241_2 <= _zz_when_Decoder_l41_3;
      _zz_when_Pc_l134_7 <= _zz_when_Pc_l134_12;
      _zz_switch_Misc_l241_10 <= _zz_when_Pc_l134_5;
      _zz_switch_Misc_l241_7 <= _zz_when_Pc_l134_4;
      _zz_18 <= _zz_47;
      _zz_17 <= _zz_46;
      _zz_when_Bypass_l26_3 <= _zz_when_Bypass_l26_7;
      _zz_when_Bypass_l39_1 <= _zz_when_Bypass_l39_3;
      _zz_when_RegisterFile_l36_3 <= _zz_when_RegisterFile_l36_7;
      _zz_when_Bypass_l26_2 <= _zz_when_Bypass_l26_6;
      _zz_16 <= _zz_45;
      _zz_15 <= _zz_44;
      _zz_14 <= _zz_43;
      _zz_13 <= _zz_40;
      _zz_when_Pc_l134_1 <= _zz_when_Pc_l134_11;
      _zz_12 <= _zz_39;
      _zz_11 <= _zz_38;
      _zz_when_Dcache_l150_1 <= _zz_when_Dcache_l150_2;
      _zz_9 <= _zz_34;
      _zz_7 <= _zz_33;
      _zz_when_Dcache_l187_1 <= _zz_when_Dcache_l187_2;
      _zz_switch_Misc_l241_1 <= _zz_switch_Misc_l241_6;
    end
    if(execute_down_isReady) begin
      _zz_6 <= _zz_switch_Misc_l241_5;
      _zz_when_Pc_l134_2 <= _zz_when_Pc_l134_8;
      _zz_27 <= _zz_switch_Misc_l241_8;
      _zz_5 <= _zz_31;
      _zz_4 <= _zz_30;
      _zz_when_Bypass_l26_1 <= _zz_when_Bypass_l26_5;
      _zz_when_Bypass_l39 <= _zz_when_Bypass_l39_2;
      _zz_when_RegisterFile_l36_2 <= _zz_when_RegisterFile_l36_3;
      _zz_when_Bypass_l26 <= _zz_when_Bypass_l26_2;
      _zz_when_Dcache_l150 <= _zz_when_Dcache_l150_1;
      _zz_3 <= _zz_10;
      _zz_2 <= _zz_8;
      _zz_when_Dcache_l187 <= _zz_when_Dcache_l187_1;
      _zz_switch_Misc_l241 <= _zz_switch_Misc_l241_4;
    end
    _zz_1 <= _zz_6;
    _zz_when_Pc_l134 <= _zz_when_Pc_l134_9;
    _zz_when_RegisterFile_l36_1 <= _zz_when_RegisterFile_l36_4;
    _zz_when_RegisterFile_l36 <= _zz_when_Bypass_l26_4;
  end


endmodule
