//
// Generated by Bluespec Compiler, version 2023.07-7-g527eaa0b (build 527eaa0b)
//
// On Sun Oct 22 08:42:37 IST 2023
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

module mk_cae_testbench(CLK,
			RST_N);
  input  CLK;
  input  RST_N;

  // register reg_input_1
  reg [31 : 0] reg_input_1;
  wire [31 : 0] reg_input_1$D_IN;
  wire reg_input_1$EN;

  // register reg_input_2
  reg [31 : 0] reg_input_2;
  wire [31 : 0] reg_input_2$D_IN;
  wire reg_input_2$EN;

  // ports of submodule cae_inst
  wire [63 : 0] cae_inst$mv_get_sort;
  wire [31 : 0] cae_inst$mv_get_sort_a, cae_inst$mv_get_sort_b;

  // rule scheduling signals
  wire CAN_FIRE_RL_rl_tb_get_data, WILL_FIRE_RL_rl_tb_get_data;

  // submodule cae_inst
  mk_cae cae_inst(.CLK(CLK),
		  .RST_N(RST_N),
		  .mv_get_sort_a(cae_inst$mv_get_sort_a),
		  .mv_get_sort_b(cae_inst$mv_get_sort_b),
		  .mv_get_sort(cae_inst$mv_get_sort),
		  .RDY_mv_get_sort());

  // rule RL_rl_tb_get_data
  assign CAN_FIRE_RL_rl_tb_get_data = 1'd1 ;
  assign WILL_FIRE_RL_rl_tb_get_data = 1'd1 ;

  // register reg_input_1
  assign reg_input_1$D_IN = 32'h0 ;
  assign reg_input_1$EN = 1'b0 ;

  // register reg_input_2
  assign reg_input_2$D_IN = 32'h0 ;
  assign reg_input_2$EN = 1'b0 ;

  // submodule cae_inst
  assign cae_inst$mv_get_sort_a = reg_input_1 ;
  assign cae_inst$mv_get_sort_b = reg_input_2 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        reg_input_1 <= `BSV_ASSIGNMENT_DELAY 32'd9;
	reg_input_2 <= `BSV_ASSIGNMENT_DELAY 32'd4;
      end
    else
      begin
        if (reg_input_1$EN)
	  reg_input_1 <= `BSV_ASSIGNMENT_DELAY reg_input_1$D_IN;
	if (reg_input_2$EN)
	  reg_input_2 <= `BSV_ASSIGNMENT_DELAY reg_input_2$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    reg_input_1 = 32'hAAAAAAAA;
    reg_input_2 = 32'hAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      $display("Sending data: %0d %0d",
	       $signed(reg_input_1),
	       $signed(reg_input_2));
    if (RST_N != `BSV_RESET_VALUE)
      $display("Received data: %0d %0d",
	       $signed(cae_inst$mv_get_sort[63:32]),
	       $signed(cae_inst$mv_get_sort[31:0]));
    if (RST_N != `BSV_RESET_VALUE) $finish(32'd1);
  end
  // synopsys translate_on
endmodule  // mk_cae_testbench

