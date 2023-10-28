//
// Generated by Bluespec Compiler, version 2023.07-7-g527eaa0b (build 527eaa0b)
//
// On Sun Oct 22 10:43:47 IST 2023
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

module mk_mac_2x2_testbench(CLK,
			    RST_N);
  input  CLK;
  input  RST_N;

  // register rg_counter
  reg [31 : 0] rg_counter;
  wire [31 : 0] rg_counter$D_IN;
  wire rg_counter$EN;

  // register rg_tb_input_1
  reg [31 : 0] rg_tb_input_1;
  wire [31 : 0] rg_tb_input_1$D_IN;
  wire rg_tb_input_1$EN;

  // register rg_tb_input_2
  reg [31 : 0] rg_tb_input_2;
  wire [31 : 0] rg_tb_input_2$D_IN;
  wire rg_tb_input_2$EN;

  // register rg_tb_input_3
  reg [31 : 0] rg_tb_input_3;
  wire [31 : 0] rg_tb_input_3$D_IN;
  wire rg_tb_input_3$EN;

  // register rg_tb_input_4
  reg [31 : 0] rg_tb_input_4;
  wire [31 : 0] rg_tb_input_4$D_IN;
  wire rg_tb_input_4$EN;

  // ports of submodule mac2x2
  wire [127 : 0] mac2x2$mav_get_data;
  wire [31 : 0] mac2x2$ma_put_data_i0,
		mac2x2$ma_put_data_i1,
		mac2x2$ma_put_data_j0,
		mac2x2$ma_put_data_j1;
  wire mac2x2$EN_ma_put_data,
       mac2x2$EN_mav_get_data,
       mac2x2$RDY_ma_put_data,
       mac2x2$RDY_mav_get_data;

  // rule scheduling signals
  wire CAN_FIRE_RL_rl_get_data,
       CAN_FIRE_RL_rl_send_data,
       WILL_FIRE_RL_rl_get_data,
       WILL_FIRE_RL_rl_send_data;

  // submodule mac2x2
  mk_mac_2x2 mac2x2(.CLK(CLK),
		    .RST_N(RST_N),
		    .ma_put_data_i0(mac2x2$ma_put_data_i0),
		    .ma_put_data_i1(mac2x2$ma_put_data_i1),
		    .ma_put_data_j0(mac2x2$ma_put_data_j0),
		    .ma_put_data_j1(mac2x2$ma_put_data_j1),
		    .EN_ma_put_data(mac2x2$EN_ma_put_data),
		    .EN_mav_get_data(mac2x2$EN_mav_get_data),
		    .RDY_ma_put_data(mac2x2$RDY_ma_put_data),
		    .mav_get_data(mac2x2$mav_get_data),
		    .RDY_mav_get_data(mac2x2$RDY_mav_get_data));

  // rule RL_rl_send_data
  assign CAN_FIRE_RL_rl_send_data = mac2x2$RDY_ma_put_data ;
  assign WILL_FIRE_RL_rl_send_data = mac2x2$RDY_ma_put_data ;

  // rule RL_rl_get_data
  assign CAN_FIRE_RL_rl_get_data = mac2x2$RDY_mav_get_data ;
  assign WILL_FIRE_RL_rl_get_data = mac2x2$RDY_mav_get_data ;

  // register rg_counter
  assign rg_counter$D_IN = rg_counter + 32'd1 ;
  assign rg_counter$EN = mac2x2$RDY_mav_get_data ;

  // register rg_tb_input_1
  assign rg_tb_input_1$D_IN = { rg_tb_input_1[30:0], 1'd0 } ;
  assign rg_tb_input_1$EN = mac2x2$RDY_mav_get_data ;

  // register rg_tb_input_2
  assign rg_tb_input_2$D_IN = { rg_tb_input_2[30:0], 1'd0 } ;
  assign rg_tb_input_2$EN = mac2x2$RDY_mav_get_data ;

  // register rg_tb_input_3
  assign rg_tb_input_3$D_IN = { rg_tb_input_3[30:0], 1'd0 } ;
  assign rg_tb_input_3$EN = mac2x2$RDY_mav_get_data ;

  // register rg_tb_input_4
  assign rg_tb_input_4$D_IN = { rg_tb_input_4[30:0], 1'd0 } ;
  assign rg_tb_input_4$EN = mac2x2$RDY_mav_get_data ;

  // submodule mac2x2
  assign mac2x2$ma_put_data_i0 = rg_tb_input_1 ;
  assign mac2x2$ma_put_data_i1 = rg_tb_input_2 ;
  assign mac2x2$ma_put_data_j0 = rg_tb_input_3 ;
  assign mac2x2$ma_put_data_j1 = rg_tb_input_4 ;
  assign mac2x2$EN_ma_put_data = mac2x2$RDY_ma_put_data ;
  assign mac2x2$EN_mav_get_data = mac2x2$RDY_mav_get_data ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        rg_counter <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rg_tb_input_1 <= `BSV_ASSIGNMENT_DELAY 32'd1;
	rg_tb_input_2 <= `BSV_ASSIGNMENT_DELAY 32'd2;
	rg_tb_input_3 <= `BSV_ASSIGNMENT_DELAY 32'd3;
	rg_tb_input_4 <= `BSV_ASSIGNMENT_DELAY 32'd4;
      end
    else
      begin
        if (rg_counter$EN)
	  rg_counter <= `BSV_ASSIGNMENT_DELAY rg_counter$D_IN;
	if (rg_tb_input_1$EN)
	  rg_tb_input_1 <= `BSV_ASSIGNMENT_DELAY rg_tb_input_1$D_IN;
	if (rg_tb_input_2$EN)
	  rg_tb_input_2 <= `BSV_ASSIGNMENT_DELAY rg_tb_input_2$D_IN;
	if (rg_tb_input_3$EN)
	  rg_tb_input_3 <= `BSV_ASSIGNMENT_DELAY rg_tb_input_3$D_IN;
	if (rg_tb_input_4$EN)
	  rg_tb_input_4 <= `BSV_ASSIGNMENT_DELAY rg_tb_input_4$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_counter = 32'hAAAAAAAA;
    rg_tb_input_1 = 32'hAAAAAAAA;
    rg_tb_input_2 = 32'hAAAAAAAA;
    rg_tb_input_3 = 32'hAAAAAAAA;
    rg_tb_input_4 = 32'hAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (mac2x2$RDY_ma_put_data)
	$display("1 TB side: Sending Values %0d, %0d, %0d, %0d",
		 $signed(rg_tb_input_1),
		 $signed(rg_tb_input_2),
		 $signed(rg_tb_input_3),
		 $signed(rg_tb_input_4));
    if (RST_N != `BSV_RESET_VALUE)
      if (mac2x2$RDY_mav_get_data)
	$display("2 TB side: got back values: %0d, %0d, %0d, %0d",
		 $signed(mac2x2$mav_get_data[127:96]),
		 $signed(mac2x2$mav_get_data[95:64]),
		 $signed(mac2x2$mav_get_data[63:32]),
		 $signed(mac2x2$mav_get_data[31:0]));
    if (RST_N != `BSV_RESET_VALUE)
      if (mac2x2$RDY_mav_get_data && rg_counter == 32'd5) $finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (mac2x2$RDY_mav_get_data && rg_counter != 32'd5)
	$display("====================(new matrix)====================");
  end
  // synopsys translate_on
endmodule  // mk_mac_2x2_testbench
