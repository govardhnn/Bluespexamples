//
// Generated by Bluespec Compiler, version 2023.07-7-g527eaa0b (build 527eaa0b)
//
// On Sun Oct 22 10:43:47 IST 2023
//
//
// Ports:
// Name                         I/O  size props
// RDY_ma_put_data                O     1
// mav_get_data                   O   128 reg
// RDY_mav_get_data               O     1
// CLK                            I     1 clock
// RST_N                          I     1 reset
// ma_put_data_i0                 I    32
// ma_put_data_i1                 I    32 reg
// ma_put_data_j0                 I    32
// ma_put_data_j1                 I    32 reg
// EN_ma_put_data                 I     1
// EN_mav_get_data                I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mk_mac_2x2(CLK,
		  RST_N,

		  ma_put_data_i0,
		  ma_put_data_i1,
		  ma_put_data_j0,
		  ma_put_data_j1,
		  EN_ma_put_data,
		  RDY_ma_put_data,

		  EN_mav_get_data,
		  mav_get_data,
		  RDY_mav_get_data);
  input  CLK;
  input  RST_N;

  // action method ma_put_data
  input  [31 : 0] ma_put_data_i0;
  input  [31 : 0] ma_put_data_i1;
  input  [31 : 0] ma_put_data_j0;
  input  [31 : 0] ma_put_data_j1;
  input  EN_ma_put_data;
  output RDY_ma_put_data;

  // actionvalue method mav_get_data
  input  EN_mav_get_data;
  output [127 : 0] mav_get_data;
  output RDY_mav_get_data;

  // signals for module outputs
  wire [127 : 0] mav_get_data;
  wire RDY_ma_put_data, RDY_mav_get_data;

  // register rg_done
  reg rg_done;
  wire rg_done$D_IN, rg_done$EN;

  // register rg_i0_final
  reg [31 : 0] rg_i0_final;
  wire [31 : 0] rg_i0_final$D_IN;
  wire rg_i0_final$EN;

  // register rg_i0_internal
  reg [31 : 0] rg_i0_internal;
  wire [31 : 0] rg_i0_internal$D_IN;
  wire rg_i0_internal$EN;

  // register rg_i1_final
  reg [31 : 0] rg_i1_final;
  wire [31 : 0] rg_i1_final$D_IN;
  wire rg_i1_final$EN;

  // register rg_i1_in
  reg [31 : 0] rg_i1_in;
  wire [31 : 0] rg_i1_in$D_IN;
  wire rg_i1_in$EN;

  // register rg_i1_internal
  reg [31 : 0] rg_i1_internal;
  wire [31 : 0] rg_i1_internal$D_IN;
  wire rg_i1_internal$EN;

  // register rg_initialized
  reg rg_initialized;
  wire rg_initialized$D_IN, rg_initialized$EN;

  // register rg_j0_final
  reg [31 : 0] rg_j0_final;
  wire [31 : 0] rg_j0_final$D_IN;
  wire rg_j0_final$EN;

  // register rg_j0_internal
  reg [31 : 0] rg_j0_internal;
  wire [31 : 0] rg_j0_internal$D_IN;
  wire rg_j0_internal$EN;

  // register rg_j1_final
  reg [31 : 0] rg_j1_final;
  wire [31 : 0] rg_j1_final$D_IN;
  wire rg_j1_final$EN;

  // register rg_j1_in
  reg [31 : 0] rg_j1_in;
  wire [31 : 0] rg_j1_in$D_IN;
  wire rg_j1_in$EN;

  // register rg_j1_internal
  reg [31 : 0] rg_j1_internal;
  wire [31 : 0] rg_j1_internal$D_IN;
  wire rg_j1_internal$EN;

  // register stage1
  reg stage1;
  wire stage1$D_IN, stage1$EN;

  // register stage2
  reg stage2;
  wire stage2$D_IN, stage2$EN;

  // register stage3
  reg stage3;
  wire stage3$D_IN, stage3$EN;

  // register stage4
  reg stage4;
  wire stage4$D_IN, stage4$EN;

  // ports of submodule mac_1
  wire [63 : 0] mac_1$get_data;
  wire [31 : 0] mac_1$put_data_i, mac_1$put_data_j;
  wire mac_1$EN_get_data,
       mac_1$EN_put_data,
       mac_1$RDY_get_data,
       mac_1$RDY_put_data;

  // ports of submodule mac_2
  wire [63 : 0] mac_2$get_data;
  wire [31 : 0] mac_2$put_data_i, mac_2$put_data_j;
  wire mac_2$EN_get_data,
       mac_2$EN_put_data,
       mac_2$RDY_get_data,
       mac_2$RDY_put_data;

  // ports of submodule mac_3
  wire [63 : 0] mac_3$get_data;
  wire [31 : 0] mac_3$put_data_i, mac_3$put_data_j;
  wire mac_3$EN_get_data,
       mac_3$EN_put_data,
       mac_3$RDY_get_data,
       mac_3$RDY_put_data;

  // ports of submodule mac_4
  wire [63 : 0] mac_4$get_data;
  wire [31 : 0] mac_4$put_data_i, mac_4$put_data_j;
  wire mac_4$EN_get_data,
       mac_4$EN_put_data,
       mac_4$RDY_get_data,
       mac_4$RDY_put_data;

  // rule scheduling signals
  wire CAN_FIRE_RL_rl_put_stage2,
       CAN_FIRE_RL_rl_put_stage3,
       CAN_FIRE_RL_rl_recieve_stage1,
       CAN_FIRE_RL_rl_recieve_stage2,
       CAN_FIRE_RL_rl_recieve_stage3,
       CAN_FIRE_ma_put_data,
       CAN_FIRE_mav_get_data,
       WILL_FIRE_RL_rl_put_stage2,
       WILL_FIRE_RL_rl_put_stage3,
       WILL_FIRE_RL_rl_recieve_stage1,
       WILL_FIRE_RL_rl_recieve_stage2,
       WILL_FIRE_RL_rl_recieve_stage3,
       WILL_FIRE_ma_put_data,
       WILL_FIRE_mav_get_data;

  // remaining internal signals
  wire rg_initialized_AND_NOT_stage1_AND_NOT_stage2_A_ETC___d11;

  // action method ma_put_data
  assign RDY_ma_put_data =
	     !rg_initialized && !stage1 && !stage2 && !stage3 && !stage4 &&
	     !rg_done &&
	     mac_1$RDY_put_data ;
  assign CAN_FIRE_ma_put_data = RDY_ma_put_data ;
  assign WILL_FIRE_ma_put_data = EN_ma_put_data ;

  // actionvalue method mav_get_data
  assign mav_get_data =
	     { rg_i0_final, rg_i1_final, rg_j0_final, rg_j1_final } ;
  assign RDY_mav_get_data =
	     rg_initialized_AND_NOT_stage1_AND_NOT_stage2_A_ETC___d11 &&
	     !stage4 &&
	     rg_done ;
  assign CAN_FIRE_mav_get_data =
	     rg_initialized_AND_NOT_stage1_AND_NOT_stage2_A_ETC___d11 &&
	     !stage4 &&
	     rg_done ;
  assign WILL_FIRE_mav_get_data = EN_mav_get_data ;

  // submodule mac_1
  mk_mac_1x1 mac_1(.CLK(CLK),
		   .RST_N(RST_N),
		   .put_data_i(mac_1$put_data_i),
		   .put_data_j(mac_1$put_data_j),
		   .EN_put_data(mac_1$EN_put_data),
		   .EN_get_data(mac_1$EN_get_data),
		   .RDY_put_data(mac_1$RDY_put_data),
		   .get_data(mac_1$get_data),
		   .RDY_get_data(mac_1$RDY_get_data));

  // submodule mac_2
  mk_mac_1x1 mac_2(.CLK(CLK),
		   .RST_N(RST_N),
		   .put_data_i(mac_2$put_data_i),
		   .put_data_j(mac_2$put_data_j),
		   .EN_put_data(mac_2$EN_put_data),
		   .EN_get_data(mac_2$EN_get_data),
		   .RDY_put_data(mac_2$RDY_put_data),
		   .get_data(mac_2$get_data),
		   .RDY_get_data(mac_2$RDY_get_data));

  // submodule mac_3
  mk_mac_1x1 mac_3(.CLK(CLK),
		   .RST_N(RST_N),
		   .put_data_i(mac_3$put_data_i),
		   .put_data_j(mac_3$put_data_j),
		   .EN_put_data(mac_3$EN_put_data),
		   .EN_get_data(mac_3$EN_get_data),
		   .RDY_put_data(mac_3$RDY_put_data),
		   .get_data(mac_3$get_data),
		   .RDY_get_data(mac_3$RDY_get_data));

  // submodule mac_4
  mk_mac_1x1 mac_4(.CLK(CLK),
		   .RST_N(RST_N),
		   .put_data_i(mac_4$put_data_i),
		   .put_data_j(mac_4$put_data_j),
		   .EN_put_data(mac_4$EN_put_data),
		   .EN_get_data(mac_4$EN_get_data),
		   .RDY_put_data(mac_4$RDY_put_data),
		   .get_data(mac_4$get_data),
		   .RDY_get_data(mac_4$RDY_get_data));

  // rule RL_rl_recieve_stage1
  assign CAN_FIRE_RL_rl_recieve_stage1 =
	     mac_1$RDY_get_data &&
	     rg_initialized_AND_NOT_stage1_AND_NOT_stage2_A_ETC___d11 &&
	     !stage4 &&
	     !rg_done ;
  assign WILL_FIRE_RL_rl_recieve_stage1 = CAN_FIRE_RL_rl_recieve_stage1 ;

  // rule RL_rl_put_stage2
  assign CAN_FIRE_RL_rl_put_stage2 =
	     mac_2$RDY_put_data && mac_3$RDY_put_data && rg_initialized &&
	     stage1 &&
	     !stage2 &&
	     !stage3 &&
	     !stage4 &&
	     !rg_done ;
  assign WILL_FIRE_RL_rl_put_stage2 = CAN_FIRE_RL_rl_put_stage2 ;

  // rule RL_rl_recieve_stage2
  assign CAN_FIRE_RL_rl_recieve_stage2 =
	     mac_2$RDY_get_data && mac_3$RDY_get_data && rg_initialized &&
	     !stage1 &&
	     stage2 &&
	     !stage3 &&
	     !stage4 &&
	     !rg_done ;
  assign WILL_FIRE_RL_rl_recieve_stage2 = CAN_FIRE_RL_rl_recieve_stage2 ;

  // rule RL_rl_put_stage3
  assign CAN_FIRE_RL_rl_put_stage3 =
	     mac_4$RDY_put_data && rg_initialized && !stage1 && !stage2 &&
	     stage3 &&
	     !stage4 &&
	     !rg_done ;
  assign WILL_FIRE_RL_rl_put_stage3 = CAN_FIRE_RL_rl_put_stage3 ;

  // rule RL_rl_recieve_stage3
  assign CAN_FIRE_RL_rl_recieve_stage3 =
	     mac_4$RDY_get_data &&
	     rg_initialized_AND_NOT_stage1_AND_NOT_stage2_A_ETC___d11 &&
	     stage4 &&
	     !rg_done ;
  assign WILL_FIRE_RL_rl_recieve_stage3 = CAN_FIRE_RL_rl_recieve_stage3 ;

  // register rg_done
  assign rg_done$D_IN = !EN_mav_get_data ;
  assign rg_done$EN = EN_mav_get_data || WILL_FIRE_RL_rl_recieve_stage3 ;

  // register rg_i0_final
  assign rg_i0_final$D_IN = mac_2$get_data[63:32] ;
  assign rg_i0_final$EN = CAN_FIRE_RL_rl_recieve_stage2 ;

  // register rg_i0_internal
  assign rg_i0_internal$D_IN = mac_1$get_data[63:32] ;
  assign rg_i0_internal$EN = CAN_FIRE_RL_rl_recieve_stage1 ;

  // register rg_i1_final
  assign rg_i1_final$D_IN = mac_4$get_data[63:32] ;
  assign rg_i1_final$EN = CAN_FIRE_RL_rl_recieve_stage3 ;

  // register rg_i1_in
  assign rg_i1_in$D_IN = ma_put_data_i1 ;
  assign rg_i1_in$EN = EN_ma_put_data ;

  // register rg_i1_internal
  assign rg_i1_internal$D_IN = mac_3$get_data[63:32] ;
  assign rg_i1_internal$EN = CAN_FIRE_RL_rl_recieve_stage2 ;

  // register rg_initialized
  assign rg_initialized$D_IN = !EN_mav_get_data ;
  assign rg_initialized$EN = EN_mav_get_data || EN_ma_put_data ;

  // register rg_j0_final
  assign rg_j0_final$D_IN = mac_3$get_data[31:0] ;
  assign rg_j0_final$EN = CAN_FIRE_RL_rl_recieve_stage2 ;

  // register rg_j0_internal
  assign rg_j0_internal$D_IN = mac_1$get_data[31:0] ;
  assign rg_j0_internal$EN = CAN_FIRE_RL_rl_recieve_stage1 ;

  // register rg_j1_final
  assign rg_j1_final$D_IN = mac_4$get_data[31:0] ;
  assign rg_j1_final$EN = CAN_FIRE_RL_rl_recieve_stage3 ;

  // register rg_j1_in
  assign rg_j1_in$D_IN = ma_put_data_j1 ;
  assign rg_j1_in$EN = EN_ma_put_data ;

  // register rg_j1_internal
  assign rg_j1_internal$D_IN = mac_2$get_data[31:0] ;
  assign rg_j1_internal$EN = CAN_FIRE_RL_rl_recieve_stage2 ;

  // register stage1
  assign stage1$D_IN = !WILL_FIRE_RL_rl_put_stage2 ;
  assign stage1$EN =
	     WILL_FIRE_RL_rl_put_stage2 || WILL_FIRE_RL_rl_recieve_stage1 ;

  // register stage2
  assign stage2$D_IN = !WILL_FIRE_RL_rl_recieve_stage2 ;
  assign stage2$EN =
	     WILL_FIRE_RL_rl_recieve_stage2 || WILL_FIRE_RL_rl_put_stage2 ;

  // register stage3
  assign stage3$D_IN = !WILL_FIRE_RL_rl_put_stage3 ;
  assign stage3$EN =
	     WILL_FIRE_RL_rl_put_stage3 || WILL_FIRE_RL_rl_recieve_stage2 ;

  // register stage4
  assign stage4$D_IN = !WILL_FIRE_RL_rl_recieve_stage3 ;
  assign stage4$EN =
	     WILL_FIRE_RL_rl_recieve_stage3 || WILL_FIRE_RL_rl_put_stage3 ;

  // submodule mac_1
  assign mac_1$put_data_i = ma_put_data_i0 ;
  assign mac_1$put_data_j = ma_put_data_j0 ;
  assign mac_1$EN_put_data = EN_ma_put_data ;
  assign mac_1$EN_get_data = CAN_FIRE_RL_rl_recieve_stage1 ;

  // submodule mac_2
  assign mac_2$put_data_i = rg_i0_internal ;
  assign mac_2$put_data_j = rg_j1_in ;
  assign mac_2$EN_put_data = CAN_FIRE_RL_rl_put_stage2 ;
  assign mac_2$EN_get_data = CAN_FIRE_RL_rl_recieve_stage2 ;

  // submodule mac_3
  assign mac_3$put_data_i = rg_i1_in ;
  assign mac_3$put_data_j = rg_j0_internal ;
  assign mac_3$EN_put_data = CAN_FIRE_RL_rl_put_stage2 ;
  assign mac_3$EN_get_data = CAN_FIRE_RL_rl_recieve_stage2 ;

  // submodule mac_4
  assign mac_4$put_data_i = rg_i1_internal ;
  assign mac_4$put_data_j = rg_j1_internal ;
  assign mac_4$EN_put_data = CAN_FIRE_RL_rl_put_stage3 ;
  assign mac_4$EN_get_data = CAN_FIRE_RL_rl_recieve_stage3 ;

  // remaining internal signals
  assign rg_initialized_AND_NOT_stage1_AND_NOT_stage2_A_ETC___d11 =
	     rg_initialized && !stage1 && !stage2 && !stage3 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        rg_done <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_i0_final <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_i0_internal <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_i1_final <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_i1_in <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_i1_internal <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_initialized <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_j0_final <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_j0_internal <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_j1_final <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_j1_in <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_j1_internal <= `BSV_ASSIGNMENT_DELAY 32'd0;
	stage1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	stage2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	stage3 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	stage4 <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (rg_done$EN) rg_done <= `BSV_ASSIGNMENT_DELAY rg_done$D_IN;
	if (rg_i0_final$EN)
	  rg_i0_final <= `BSV_ASSIGNMENT_DELAY rg_i0_final$D_IN;
	if (rg_i0_internal$EN)
	  rg_i0_internal <= `BSV_ASSIGNMENT_DELAY rg_i0_internal$D_IN;
	if (rg_i1_final$EN)
	  rg_i1_final <= `BSV_ASSIGNMENT_DELAY rg_i1_final$D_IN;
	if (rg_i1_in$EN) rg_i1_in <= `BSV_ASSIGNMENT_DELAY rg_i1_in$D_IN;
	if (rg_i1_internal$EN)
	  rg_i1_internal <= `BSV_ASSIGNMENT_DELAY rg_i1_internal$D_IN;
	if (rg_initialized$EN)
	  rg_initialized <= `BSV_ASSIGNMENT_DELAY rg_initialized$D_IN;
	if (rg_j0_final$EN)
	  rg_j0_final <= `BSV_ASSIGNMENT_DELAY rg_j0_final$D_IN;
	if (rg_j0_internal$EN)
	  rg_j0_internal <= `BSV_ASSIGNMENT_DELAY rg_j0_internal$D_IN;
	if (rg_j1_final$EN)
	  rg_j1_final <= `BSV_ASSIGNMENT_DELAY rg_j1_final$D_IN;
	if (rg_j1_in$EN) rg_j1_in <= `BSV_ASSIGNMENT_DELAY rg_j1_in$D_IN;
	if (rg_j1_internal$EN)
	  rg_j1_internal <= `BSV_ASSIGNMENT_DELAY rg_j1_internal$D_IN;
	if (stage1$EN) stage1 <= `BSV_ASSIGNMENT_DELAY stage1$D_IN;
	if (stage2$EN) stage2 <= `BSV_ASSIGNMENT_DELAY stage2$D_IN;
	if (stage3$EN) stage3 <= `BSV_ASSIGNMENT_DELAY stage3$D_IN;
	if (stage4$EN) stage4 <= `BSV_ASSIGNMENT_DELAY stage4$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_done = 1'h0;
    rg_i0_final = 32'hAAAAAAAA;
    rg_i0_internal = 32'hAAAAAAAA;
    rg_i1_final = 32'hAAAAAAAA;
    rg_i1_in = 32'hAAAAAAAA;
    rg_i1_internal = 32'hAAAAAAAA;
    rg_initialized = 1'h0;
    rg_j0_final = 32'hAAAAAAAA;
    rg_j0_internal = 32'hAAAAAAAA;
    rg_j1_final = 32'hAAAAAAAA;
    rg_j1_in = 32'hAAAAAAAA;
    rg_j1_internal = 32'hAAAAAAAA;
    stage1 = 1'h0;
    stage2 = 1'h0;
    stage3 = 1'h0;
    stage4 = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_put_data) $display("1. In mac_2x2: ma_put_data");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_put_data)
	$display("i0 = %0d, i1 = %0d, j0 = %0d, j1 = %0d",
		 $signed(ma_put_data_i0),
		 $signed(ma_put_data_i1),
		 $signed(ma_put_data_j0),
		 $signed(ma_put_data_j1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_recieve_stage1) $display("2. Stage 1");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_recieve_stage1)
	$display("2. got values from mac 1: %0d, %0d",
		 $signed(mac_1$get_data[63:32]),
		 $signed(mac_1$get_data[31:0]));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_put_stage2)
	$display("3. Stage 2 - Put data to mac 2 and mac 3");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_recieve_stage2) $display("3. Stage 2");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_recieve_stage2)
	$display("3. got values from mac 2: %0d, %0d",
		 $signed(mac_2$get_data[63:32]),
		 $signed(mac_2$get_data[31:0]));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_recieve_stage2)
	$display("3. got values from mac 3: %0d, %0d",
		 $signed(mac_3$get_data[63:32]),
		 $signed(mac_3$get_data[31:0]));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_put_stage3)
	$display("4. Stage 3 - Put data to mac 4");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_recieve_stage3) $display("4. Stage 3");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_recieve_stage3)
	$display("4. got values from mac 4: %0d, %0d",
		 $signed(mac_4$get_data[63:32]),
		 $signed(mac_4$get_data[31:0]));
  end
  // synopsys translate_on
endmodule  // mk_mac_2x2
