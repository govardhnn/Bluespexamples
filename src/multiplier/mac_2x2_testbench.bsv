package mac_2x2_testbench;

import mac_2x2 :: *;

(* synthesize *)

module mk_mac_2x2_testbench(Empty);

   Ifc_mac_2x2 mac2x2 <- mk_mac_2x2;

    Reg#(int) rg_counter <- mkReg(0);
    Reg#(int) rg_tb_input_1 <- mkReg(1);
    Reg#(int) rg_tb_input_2 <- mkReg(2);
    Reg#(int) rg_tb_input_3 <- mkReg(3);
    Reg#(int) rg_tb_input_4 <- mkReg(4);

   rule rl_send_data;
      $display("1 TB side: Sending Values %0d, %0d, %0d, %0d", rg_tb_input_1, rg_tb_input_2, rg_tb_input_3, rg_tb_input_4);

      mac2x2.ma_put_data(rg_tb_input_1 ,rg_tb_input_2, rg_tb_input_3, rg_tb_input_4);
   endrule

   rule rl_get_data;
      let lv_val <- mac2x2.mav_get_data();
      $display("2 TB side: got back values: %0d, %0d, %0d, %0d",tpl_1(lv_val), tpl_2(lv_val), tpl_3(lv_val), tpl_4(lv_val) );
      rg_counter <= rg_counter + 1;
      rg_tb_input_1 <= rg_tb_input_1 << 1;
      rg_tb_input_2 <= rg_tb_input_2 << 1;
        rg_tb_input_3 <= rg_tb_input_3 << 1;
        rg_tb_input_4 <= rg_tb_input_4 << 1;
      if (rg_counter == 5) $finish;
      else $display("====================(new matrix)====================");

   endrule

endmodule

endpackage
