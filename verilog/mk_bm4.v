//
// Generated by Bluespec Compiler, version 2023.07-7-g527eaa0b (build 527eaa0b)
//
// On Sat Oct 21 23:23:00 IST 2023
//
//
// Ports:
// Name                         I/O  size props
// RDY_ma_get_inputs              O     1
// mav_return_output              O   128
// RDY_mav_return_output          O     1
// CLK                            I     1 clock
// RST_N                          I     1 reset
// ma_get_inputs_in1              I    32
// ma_get_inputs_in2              I    32
// ma_get_inputs_in3              I    32
// ma_get_inputs_in4              I    32
// EN_ma_get_inputs               I     1
// EN_mav_return_output           I     1
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

module mk_bm4(CLK,
	      RST_N,

	      ma_get_inputs_in1,
	      ma_get_inputs_in2,
	      ma_get_inputs_in3,
	      ma_get_inputs_in4,
	      EN_ma_get_inputs,
	      RDY_ma_get_inputs,

	      EN_mav_return_output,
	      mav_return_output,
	      RDY_mav_return_output);
  input  CLK;
  input  RST_N;

  // action method ma_get_inputs
  input  [31 : 0] ma_get_inputs_in1;
  input  [31 : 0] ma_get_inputs_in2;
  input  [31 : 0] ma_get_inputs_in3;
  input  [31 : 0] ma_get_inputs_in4;
  input  EN_ma_get_inputs;
  output RDY_ma_get_inputs;

  // actionvalue method mav_return_output
  input  EN_mav_return_output;
  output [127 : 0] mav_return_output;
  output RDY_mav_return_output;

  // signals for module outputs
  wire [127 : 0] mav_return_output;
  wire RDY_ma_get_inputs, RDY_mav_return_output;

  // register rg_initialized
  reg rg_initialized;
  wire rg_initialized$D_IN, rg_initialized$EN;

  // register rg_out1
  reg [31 : 0] rg_out1;
  wire [31 : 0] rg_out1$D_IN;
  wire rg_out1$EN;

  // register rg_out2
  reg [31 : 0] rg_out2;
  wire [31 : 0] rg_out2$D_IN;
  wire rg_out2$EN;

  // register rg_out3
  reg [31 : 0] rg_out3;
  wire [31 : 0] rg_out3$D_IN;
  wire rg_out3$EN;

  // register rg_out4
  reg [31 : 0] rg_out4;
  wire [31 : 0] rg_out4$D_IN;
  wire rg_out4$EN;

  // register rg_stage1_1
  reg [31 : 0] rg_stage1_1;
  wire [31 : 0] rg_stage1_1$D_IN;
  wire rg_stage1_1$EN;

  // register rg_stage1_2
  reg [31 : 0] rg_stage1_2;
  wire [31 : 0] rg_stage1_2$D_IN;
  wire rg_stage1_2$EN;

  // register rg_stage1_3
  reg [31 : 0] rg_stage1_3;
  wire [31 : 0] rg_stage1_3$D_IN;
  wire rg_stage1_3$EN;

  // register rg_stage1_4
  reg [31 : 0] rg_stage1_4;
  wire [31 : 0] rg_stage1_4$D_IN;
  wire rg_stage1_4$EN;

  // register rg_stage1_done
  reg rg_stage1_done;
  wire rg_stage1_done$D_IN, rg_stage1_done$EN;

  // register rg_stage2_1
  reg [31 : 0] rg_stage2_1;
  wire [31 : 0] rg_stage2_1$D_IN;
  wire rg_stage2_1$EN;

  // register rg_stage2_2
  reg [31 : 0] rg_stage2_2;
  wire [31 : 0] rg_stage2_2$D_IN;
  wire rg_stage2_2$EN;

  // register rg_stage2_3
  reg [31 : 0] rg_stage2_3;
  wire [31 : 0] rg_stage2_3$D_IN;
  wire rg_stage2_3$EN;

  // register rg_stage2_4
  reg [31 : 0] rg_stage2_4;
  wire [31 : 0] rg_stage2_4$D_IN;
  wire rg_stage2_4$EN;

  // register rg_stage2_done
  reg rg_stage2_done;
  wire rg_stage2_done$D_IN, rg_stage2_done$EN;

  // ports of submodule cae1
  wire [63 : 0] cae1$mv_get_sort;
  wire [31 : 0] cae1$mv_get_sort_a, cae1$mv_get_sort_b;

  // ports of submodule cae2
  wire [63 : 0] cae2$mv_get_sort;
  wire [31 : 0] cae2$mv_get_sort_a, cae2$mv_get_sort_b;

  // ports of submodule cae3
  wire [63 : 0] cae3$mv_get_sort;
  wire [31 : 0] cae3$mv_get_sort_a, cae3$mv_get_sort_b;

  // ports of submodule cae4
  wire [63 : 0] cae4$mv_get_sort;
  wire [31 : 0] cae4$mv_get_sort_a, cae4$mv_get_sort_b;

  // ports of submodule cae5
  wire [63 : 0] cae5$mv_get_sort;
  wire [31 : 0] cae5$mv_get_sort_a, cae5$mv_get_sort_b;

  // ports of submodule cae6
  wire [63 : 0] cae6$mv_get_sort;
  wire [31 : 0] cae6$mv_get_sort_a, cae6$mv_get_sort_b;

  // rule scheduling signals
  wire CAN_FIRE_RL_rl_stage_1,
       CAN_FIRE_ma_get_inputs,
       CAN_FIRE_mav_return_output,
       WILL_FIRE_RL_rl_stage_1,
       WILL_FIRE_ma_get_inputs,
       WILL_FIRE_mav_return_output;

  // action method ma_get_inputs
  assign RDY_ma_get_inputs =
	     !rg_initialized && !rg_stage1_done && !rg_stage2_done ;
  assign CAN_FIRE_ma_get_inputs =
	     !rg_initialized && !rg_stage1_done && !rg_stage2_done ;
  assign WILL_FIRE_ma_get_inputs = EN_ma_get_inputs ;

  // actionvalue method mav_return_output
  assign mav_return_output = { cae5$mv_get_sort, cae6$mv_get_sort } ;
  assign RDY_mav_return_output =
	     rg_initialized && rg_stage1_done && rg_stage2_done ;
  assign CAN_FIRE_mav_return_output =
	     rg_initialized && rg_stage1_done && rg_stage2_done ;
  assign WILL_FIRE_mav_return_output = EN_mav_return_output ;

  // submodule cae1
  mk_cae cae1(.CLK(CLK),
	      .RST_N(RST_N),
	      .mv_get_sort_a(cae1$mv_get_sort_a),
	      .mv_get_sort_b(cae1$mv_get_sort_b),
	      .mv_get_sort(cae1$mv_get_sort),
	      .RDY_mv_get_sort());

  // submodule cae2
  mk_cae cae2(.CLK(CLK),
	      .RST_N(RST_N),
	      .mv_get_sort_a(cae2$mv_get_sort_a),
	      .mv_get_sort_b(cae2$mv_get_sort_b),
	      .mv_get_sort(cae2$mv_get_sort),
	      .RDY_mv_get_sort());

  // submodule cae3
  mk_cae cae3(.CLK(CLK),
	      .RST_N(RST_N),
	      .mv_get_sort_a(cae3$mv_get_sort_a),
	      .mv_get_sort_b(cae3$mv_get_sort_b),
	      .mv_get_sort(cae3$mv_get_sort),
	      .RDY_mv_get_sort());

  // submodule cae4
  mk_cae cae4(.CLK(CLK),
	      .RST_N(RST_N),
	      .mv_get_sort_a(cae4$mv_get_sort_a),
	      .mv_get_sort_b(cae4$mv_get_sort_b),
	      .mv_get_sort(cae4$mv_get_sort),
	      .RDY_mv_get_sort());

  // submodule cae5
  mk_cae cae5(.CLK(CLK),
	      .RST_N(RST_N),
	      .mv_get_sort_a(cae5$mv_get_sort_a),
	      .mv_get_sort_b(cae5$mv_get_sort_b),
	      .mv_get_sort(cae5$mv_get_sort),
	      .RDY_mv_get_sort());

  // submodule cae6
  mk_cae cae6(.CLK(CLK),
	      .RST_N(RST_N),
	      .mv_get_sort_a(cae6$mv_get_sort_a),
	      .mv_get_sort_b(cae6$mv_get_sort_b),
	      .mv_get_sort(cae6$mv_get_sort),
	      .RDY_mv_get_sort());

  // rule RL_rl_stage_1
  assign CAN_FIRE_RL_rl_stage_1 =
	     rg_initialized && rg_stage1_done && !rg_stage2_done ;
  assign WILL_FIRE_RL_rl_stage_1 = CAN_FIRE_RL_rl_stage_1 ;

  // register rg_initialized
  assign rg_initialized$D_IN = !EN_mav_return_output ;
  assign rg_initialized$EN = EN_mav_return_output || EN_ma_get_inputs ;

  // register rg_out1
  assign rg_out1$D_IN = 32'h0 ;
  assign rg_out1$EN = 1'b0 ;

  // register rg_out2
  assign rg_out2$D_IN = 32'h0 ;
  assign rg_out2$EN = 1'b0 ;

  // register rg_out3
  assign rg_out3$D_IN = 32'h0 ;
  assign rg_out3$EN = 1'b0 ;

  // register rg_out4
  assign rg_out4$D_IN = 32'h0 ;
  assign rg_out4$EN = 1'b0 ;

  // register rg_stage1_1
  assign rg_stage1_1$D_IN = cae1$mv_get_sort[63:32] ;
  assign rg_stage1_1$EN = EN_ma_get_inputs ;

  // register rg_stage1_2
  assign rg_stage1_2$D_IN = cae1$mv_get_sort[31:0] ;
  assign rg_stage1_2$EN = EN_ma_get_inputs ;

  // register rg_stage1_3
  assign rg_stage1_3$D_IN = cae2$mv_get_sort[63:32] ;
  assign rg_stage1_3$EN = EN_ma_get_inputs ;

  // register rg_stage1_4
  assign rg_stage1_4$D_IN = cae2$mv_get_sort[31:0] ;
  assign rg_stage1_4$EN = EN_ma_get_inputs ;

  // register rg_stage1_done
  assign rg_stage1_done$D_IN = !EN_mav_return_output ;
  assign rg_stage1_done$EN = EN_mav_return_output || EN_ma_get_inputs ;

  // register rg_stage2_1
  assign rg_stage2_1$D_IN = cae3$mv_get_sort[63:32] ;
  assign rg_stage2_1$EN = CAN_FIRE_RL_rl_stage_1 ;

  // register rg_stage2_2
  assign rg_stage2_2$D_IN = cae4$mv_get_sort[63:32] ;
  assign rg_stage2_2$EN = CAN_FIRE_RL_rl_stage_1 ;

  // register rg_stage2_3
  assign rg_stage2_3$D_IN = cae4$mv_get_sort[31:0] ;
  assign rg_stage2_3$EN = CAN_FIRE_RL_rl_stage_1 ;

  // register rg_stage2_4
  assign rg_stage2_4$D_IN = cae3$mv_get_sort[31:0] ;
  assign rg_stage2_4$EN = CAN_FIRE_RL_rl_stage_1 ;

  // register rg_stage2_done
  assign rg_stage2_done$D_IN = !EN_mav_return_output ;
  assign rg_stage2_done$EN = EN_mav_return_output || WILL_FIRE_RL_rl_stage_1 ;

  // submodule cae1
  assign cae1$mv_get_sort_a = ma_get_inputs_in1 ;
  assign cae1$mv_get_sort_b = ma_get_inputs_in2 ;

  // submodule cae2
  assign cae2$mv_get_sort_a = ma_get_inputs_in3 ;
  assign cae2$mv_get_sort_b = ma_get_inputs_in4 ;

  // submodule cae3
  assign cae3$mv_get_sort_a = rg_stage1_1 ;
  assign cae3$mv_get_sort_b = rg_stage1_4 ;

  // submodule cae4
  assign cae4$mv_get_sort_a = rg_stage1_2 ;
  assign cae4$mv_get_sort_b = rg_stage1_3 ;

  // submodule cae5
  assign cae5$mv_get_sort_a = rg_stage2_1 ;
  assign cae5$mv_get_sort_b = rg_stage2_2 ;

  // submodule cae6
  assign cae6$mv_get_sort_a = rg_stage2_3 ;
  assign cae6$mv_get_sort_b = rg_stage2_4 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        rg_initialized <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_out1 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_out2 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_out3 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_out4 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_stage1_1 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_stage1_2 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_stage1_3 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_stage1_4 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_stage1_done <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_stage2_1 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_stage2_2 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_stage2_3 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_stage2_4 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_stage2_done <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (rg_initialized$EN)
	  rg_initialized <= `BSV_ASSIGNMENT_DELAY rg_initialized$D_IN;
	if (rg_out1$EN) rg_out1 <= `BSV_ASSIGNMENT_DELAY rg_out1$D_IN;
	if (rg_out2$EN) rg_out2 <= `BSV_ASSIGNMENT_DELAY rg_out2$D_IN;
	if (rg_out3$EN) rg_out3 <= `BSV_ASSIGNMENT_DELAY rg_out3$D_IN;
	if (rg_out4$EN) rg_out4 <= `BSV_ASSIGNMENT_DELAY rg_out4$D_IN;
	if (rg_stage1_1$EN)
	  rg_stage1_1 <= `BSV_ASSIGNMENT_DELAY rg_stage1_1$D_IN;
	if (rg_stage1_2$EN)
	  rg_stage1_2 <= `BSV_ASSIGNMENT_DELAY rg_stage1_2$D_IN;
	if (rg_stage1_3$EN)
	  rg_stage1_3 <= `BSV_ASSIGNMENT_DELAY rg_stage1_3$D_IN;
	if (rg_stage1_4$EN)
	  rg_stage1_4 <= `BSV_ASSIGNMENT_DELAY rg_stage1_4$D_IN;
	if (rg_stage1_done$EN)
	  rg_stage1_done <= `BSV_ASSIGNMENT_DELAY rg_stage1_done$D_IN;
	if (rg_stage2_1$EN)
	  rg_stage2_1 <= `BSV_ASSIGNMENT_DELAY rg_stage2_1$D_IN;
	if (rg_stage2_2$EN)
	  rg_stage2_2 <= `BSV_ASSIGNMENT_DELAY rg_stage2_2$D_IN;
	if (rg_stage2_3$EN)
	  rg_stage2_3 <= `BSV_ASSIGNMENT_DELAY rg_stage2_3$D_IN;
	if (rg_stage2_4$EN)
	  rg_stage2_4 <= `BSV_ASSIGNMENT_DELAY rg_stage2_4$D_IN;
	if (rg_stage2_done$EN)
	  rg_stage2_done <= `BSV_ASSIGNMENT_DELAY rg_stage2_done$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_initialized = 1'h0;
    rg_out1 = 32'hAAAAAAAA;
    rg_out2 = 32'hAAAAAAAA;
    rg_out3 = 32'hAAAAAAAA;
    rg_out4 = 32'hAAAAAAAA;
    rg_stage1_1 = 32'hAAAAAAAA;
    rg_stage1_2 = 32'hAAAAAAAA;
    rg_stage1_3 = 32'hAAAAAAAA;
    rg_stage1_4 = 32'hAAAAAAAA;
    rg_stage1_done = 1'h0;
    rg_stage2_1 = 32'hAAAAAAAA;
    rg_stage2_2 = 32'hAAAAAAAA;
    rg_stage2_3 = 32'hAAAAAAAA;
    rg_stage2_4 = 32'hAAAAAAAA;
    rg_stage2_done = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mk_bm4

