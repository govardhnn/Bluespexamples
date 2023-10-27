//
// Generated by Bluespec Compiler, version 2023.01-23-g764b7230 (build 764b7230)
//
// On Fri Sep  1 19:37:23 IST 2023
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

module mkCount_TB(CLK,
		  RST_N);
  input  CLK;
  input  RST_N;

  // register initial_value
  reg [31 : 0] initial_value;
  wire [31 : 0] initial_value$D_IN;
  wire initial_value$EN;

  // ports of submodule count
  wire [31 : 0] count$counter_value, count$start_count_initial_value;
  wire count$EN_counter_value, count$EN_start_count;

  // rule scheduling signals
  wire CAN_FIRE_RL_get_counter_values,
       CAN_FIRE_RL_send_initial_value,
       WILL_FIRE_RL_get_counter_values,
       WILL_FIRE_RL_send_initial_value;

  // submodule count
  mkCounter count(.CLK(CLK),
		  .RST_N(RST_N),
		  .start_count_initial_value(count$start_count_initial_value),
		  .EN_start_count(count$EN_start_count),
		  .EN_counter_value(count$EN_counter_value),
		  .RDY_start_count(),
		  .counter_value(count$counter_value),
		  .RDY_counter_value());

  // rule RL_get_counter_values
  assign CAN_FIRE_RL_get_counter_values = 1'd1 ;
  assign WILL_FIRE_RL_get_counter_values = 1'd1 ;

  // rule RL_send_initial_value
  assign CAN_FIRE_RL_send_initial_value = 1'd1 ;
  assign WILL_FIRE_RL_send_initial_value = 1'd1 ;

  // register initial_value
  assign initial_value$D_IN = 32'h0 ;
  assign initial_value$EN = 1'b0 ;

  // submodule count
  assign count$start_count_initial_value = initial_value ;
  assign count$EN_start_count = 1'd1 ;
  assign count$EN_counter_value = 1'd1 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        initial_value <= `BSV_ASSIGNMENT_DELAY 32'd10;
      end
    else
      begin
        if (initial_value$EN)
	  initial_value <= `BSV_ASSIGNMENT_DELAY initial_value$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    initial_value = 32'hAAAAAAAA;
     $dumpfile("mkCount_TB_dump.vcd");
     $dumpvars(all);
     
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      $display("counter value: %0d from testbench", count$counter_value);
    if (RST_N != `BSV_RESET_VALUE)
      $display("counting has started, initial value: %0d", initial_value);
  end
  // synopsys translate_on
endmodule  // mkCount_TB

