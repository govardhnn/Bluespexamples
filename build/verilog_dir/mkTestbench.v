//
// Generated by Bluespec Compiler, version 2023.01-23-g764b7230 (build 764b7230)
//
// On Fri Sep  8 12:11:42 IST 2023
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

  // register counter
  reg [7 : 0] counter;
  wire [7 : 0] counter$D_IN;
  wire counter$EN;

  // register data_in_tb
  reg [7 : 0] data_in_tb;
  wire [7 : 0] data_in_tb$D_IN;
  wire data_in_tb$EN;

  // ports of submodule basic_pipeline
  wire [7 : 0] basic_pipeline$put_data_data_in;
  wire basic_pipeline$EN_get_data,
       basic_pipeline$EN_put_data,
       basic_pipeline$RDY_put_data;

  // rule scheduling signals
  wire CAN_FIRE_RL_request_pipe,
       CAN_FIRE_RL_response_pipe,
       WILL_FIRE_RL_request_pipe,
       WILL_FIRE_RL_response_pipe;

  // submodule basic_pipeline
  mk_basic_pipeline basic_pipeline(.CLK(CLK),
				   .RST_N(RST_N),
				   .put_data_data_in(basic_pipeline$put_data_data_in),
				   .EN_put_data(basic_pipeline$EN_put_data),
				   .EN_get_data(basic_pipeline$EN_get_data),
				   .RDY_put_data(basic_pipeline$RDY_put_data),
				   .get_data(),
				   .RDY_get_data());

  // rule RL_request_pipe
  assign CAN_FIRE_RL_request_pipe =
	     basic_pipeline$RDY_put_data && counter < 8'd10 ;
  assign WILL_FIRE_RL_request_pipe = CAN_FIRE_RL_request_pipe ;

  // rule RL_response_pipe
  assign CAN_FIRE_RL_response_pipe = counter == 8'd10 ;
  assign WILL_FIRE_RL_response_pipe = CAN_FIRE_RL_response_pipe ;

  // register counter
  assign counter$D_IN = counter + 8'd1 ;
  assign counter$EN = CAN_FIRE_RL_request_pipe ;

  // register data_in_tb
  assign data_in_tb$D_IN = 8'h0 ;
  assign data_in_tb$EN = 1'b0 ;

  // submodule basic_pipeline
  assign basic_pipeline$put_data_data_in = data_in_tb + counter ;
  assign basic_pipeline$EN_put_data = CAN_FIRE_RL_request_pipe ;
  assign basic_pipeline$EN_get_data = 1'b0 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        counter <= `BSV_ASSIGNMENT_DELAY 8'd2;
	data_in_tb <= `BSV_ASSIGNMENT_DELAY 8'd10;
      end
    else
      begin
        if (counter$EN) counter <= `BSV_ASSIGNMENT_DELAY counter$D_IN;
	if (data_in_tb$EN)
	  data_in_tb <= `BSV_ASSIGNMENT_DELAY data_in_tb$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    counter = 8'hAA;
    data_in_tb = 8'hAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_response_pipe) $finish(32'd1);
  end
  // synopsys translate_on
endmodule  // mkTestbench

