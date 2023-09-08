//
// Generated by Bluespec Compiler, version 2023.01-23-g764b7230 (build 764b7230)
//
// On Fri Sep  8 12:11:41 IST 2023
//
//
// Ports:
// Name                         I/O  size props
// RDY_put_data                   O     1
// get_data                       O     8 reg
// RDY_get_data                   O     1 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// put_data_data_in               I     8 reg
// EN_put_data                    I     1
// EN_get_data                    I     1
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

module mk_basic_pipeline(CLK,
			 RST_N,

			 put_data_data_in,
			 EN_put_data,
			 RDY_put_data,

			 EN_get_data,
			 get_data,
			 RDY_get_data);
  input  CLK;
  input  RST_N;

  // action method put_data
  input  [7 : 0] put_data_data_in;
  input  EN_put_data;
  output RDY_put_data;

  // actionvalue method get_data
  input  EN_get_data;
  output [7 : 0] get_data;
  output RDY_get_data;

  // signals for module outputs
  wire [7 : 0] get_data;
  wire RDY_get_data, RDY_put_data;

  // register data_in_reg
  reg [7 : 0] data_in_reg;
  wire [7 : 0] data_in_reg$D_IN;
  wire data_in_reg$EN;

  // register data_inserted
  reg data_inserted;
  wire data_inserted$D_IN, data_inserted$EN;

  // register data_out_reg
  reg [7 : 0] data_out_reg;
  wire [7 : 0] data_out_reg$D_IN;
  wire data_out_reg$EN;

  // register data_ready
  reg data_ready;
  wire data_ready$D_IN, data_ready$EN;

  // rule scheduling signals
  wire CAN_FIRE_RL_rl_pipe,
       CAN_FIRE_get_data,
       CAN_FIRE_put_data,
       WILL_FIRE_RL_rl_pipe,
       WILL_FIRE_get_data,
       WILL_FIRE_put_data;

  // action method put_data
  assign RDY_put_data = !data_inserted ;
  assign CAN_FIRE_put_data = !data_inserted ;
  assign WILL_FIRE_put_data = EN_put_data ;

  // actionvalue method get_data
  assign get_data = data_out_reg ;
  assign RDY_get_data = data_ready ;
  assign CAN_FIRE_get_data = data_ready ;
  assign WILL_FIRE_get_data = EN_get_data ;

  // rule RL_rl_pipe
  assign CAN_FIRE_RL_rl_pipe = data_inserted ;
  assign WILL_FIRE_RL_rl_pipe = data_inserted ;

  // register data_in_reg
  assign data_in_reg$D_IN = put_data_data_in ;
  assign data_in_reg$EN = EN_put_data ;

  // register data_inserted
  assign data_inserted$D_IN = !data_inserted ;
  assign data_inserted$EN = data_inserted || EN_put_data ;

  // register data_out_reg
  assign data_out_reg$D_IN = data_in_reg ;
  assign data_out_reg$EN = data_inserted ;

  // register data_ready
  assign data_ready$D_IN = data_inserted ;
  assign data_ready$EN = EN_get_data || data_inserted ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        data_in_reg <= `BSV_ASSIGNMENT_DELAY 8'd0;
	data_inserted <= `BSV_ASSIGNMENT_DELAY 1'd0;
	data_out_reg <= `BSV_ASSIGNMENT_DELAY 8'd0;
	data_ready <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (data_in_reg$EN)
	  data_in_reg <= `BSV_ASSIGNMENT_DELAY data_in_reg$D_IN;
	if (data_inserted$EN)
	  data_inserted <= `BSV_ASSIGNMENT_DELAY data_inserted$D_IN;
	if (data_out_reg$EN)
	  data_out_reg <= `BSV_ASSIGNMENT_DELAY data_out_reg$D_IN;
	if (data_ready$EN)
	  data_ready <= `BSV_ASSIGNMENT_DELAY data_ready$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    data_in_reg = 8'hAA;
    data_inserted = 1'h0;
    data_out_reg = 8'hAA;
    data_ready = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mk_basic_pipeline
