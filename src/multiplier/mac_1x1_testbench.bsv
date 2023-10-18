package mac_1x1_testbench;

import mac_1x1 :: *;

(* synthesize *)

module mk_mac_1x1_testbench(Empty);

   Ifc_mac_1x1 mac1 <- mk_mac_1x1;

   Reg#(int) rg_counter <- mkReg(0);
   Reg#(int) rg_tb_input_1 <- mkReg(5);
   Reg#(int) rg_tb_input_2 <- mkReg(2);

   rule rl_send_data;
      $display("1. Sending Values ");
      mac1.put_data(rg_tb_input_1 ,rg_tb_input_2);
      rg_counter <= rg_counter + 1;
      rg_tb_input_1 <= rg_tb_input_1 << 1;
      rg_tb_input_2 <= rg_tb_input_2 << 1;

   endrule

   rule rl_get_data;
      let lv_val <- mac1.get_data();
      $display("3. got next values: %0d, %0d",tpl_1(lv_val), tpl_2(lv_val) );
      if (rg_counter == 5) $finish;
   endrule

endmodule

endpackage
