//
// Generated by Bluespec Compiler, version 2023.01-23-g764b7230 (build 764b7230)
//
// On Wed Sep  6 10:38:53 IST 2023
//
//
// Ports:
// Name                         I/O  size props
// CLK                            I     1 clock
// RST_N                          I     1 reset
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

module mkTestbench(CLK,
		   RST_N);
  input  CLK;
  input  RST_N;

  // register rg_x
  reg [7 : 0] rg_x;
  wire [7 : 0] rg_x$D_IN;
  wire rg_x$EN;

  // register rg_y
  reg [2 : 0] rg_y;
  wire [2 : 0] rg_y$D_IN;
  wire rg_y$EN;

  // ports of submodule shifter
  wire [7 : 0] shifter$do_shift_data, shifter$get_rsp;
  wire [2 : 0] shifter$do_shift_amt;
  wire shifter$EN_do_shift,
       shifter$EN_get_rsp,
       shifter$RDY_do_shift,
       shifter$RDY_get_rsp;

  // rule scheduling signals
  wire CAN_FIRE_RL_finish_shift,
       CAN_FIRE_RL_request,
       WILL_FIRE_RL_finish_shift,
       WILL_FIRE_RL_request;

  // submodule shifter
  mkShifter shifter(.CLK(CLK),
		    .RST_N(RST_N),
		    .do_shift_amt(shifter$do_shift_amt),
		    .do_shift_data(shifter$do_shift_data),
		    .EN_do_shift(shifter$EN_do_shift),
		    .EN_get_rsp(shifter$EN_get_rsp),
		    .RDY_do_shift(shifter$RDY_do_shift),
		    .get_rsp(shifter$get_rsp),
		    .RDY_get_rsp(shifter$RDY_get_rsp));

  // rule RL_request
  assign CAN_FIRE_RL_request = shifter$RDY_do_shift ;
  assign WILL_FIRE_RL_request = shifter$RDY_do_shift ;

  // rule RL_finish_shift
  assign CAN_FIRE_RL_finish_shift = shifter$RDY_get_rsp ;
  assign WILL_FIRE_RL_finish_shift = shifter$RDY_get_rsp ;

  // register rg_x
  assign rg_x$D_IN = 8'h0 ;
  assign rg_x$EN = 1'b0 ;

  // register rg_y
  assign rg_y$D_IN = 3'h0 ;
  assign rg_y$EN = 1'b0 ;

  // submodule shifter
  assign shifter$do_shift_amt = rg_y ;
  assign shifter$do_shift_data = rg_x ;
  assign shifter$EN_do_shift = shifter$RDY_do_shift ;
  assign shifter$EN_get_rsp = shifter$RDY_get_rsp ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        rg_x <= `BSV_ASSIGNMENT_DELAY 8'd11;
	rg_y <= `BSV_ASSIGNMENT_DELAY 3'd3;
      end
    else
      begin
        if (rg_x$EN) rg_x <= `BSV_ASSIGNMENT_DELAY rg_x$D_IN;
	if (rg_y$EN) rg_y <= `BSV_ASSIGNMENT_DELAY rg_y$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_x = 8'hAA;
    rg_y = 3'h2;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (shifter$RDY_get_rsp) $display("%0d", shifter$get_rsp);
    if (RST_N != `BSV_RESET_VALUE) if (shifter$RDY_get_rsp) $finish(32'd1);
  end
  // synopsys translate_on
endmodule  // mkTestbench
