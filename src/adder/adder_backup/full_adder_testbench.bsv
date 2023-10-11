package full_adder_testbench;

import full_adder :: *;

(*synthesize*)

module mk_full_adder_testbench(Empty);

   Ifc_fadder fadder <- mk_full_adder;

   Reg#(Bit#(1)) rg_a <- mkReg(1);
   Reg#(Bit#(1)) rg_b <- mkReg(1);
   Reg#(Bit#(1)) rg_carry_in <- mkReg(1);

   Reg#(Bit#(1)) rg_got_sum <- mkReg(0);
   Reg#(Bit#(1)) rg_got_carry_out <- mkReg(0);

   rule send_data;
      $display("1. TB sending values %0d, %0d and %0d", rg_a, rg_b, rg_carry_in);
      fadder.ma_put_data_fa(rg_a, rg_b, rg_carry_in);
   endrule

   rule recieve_data;
      let rg_got_data <- fadder.mav_get_sum_fa();
      //(rg_a, rg_b);
      rg_got_sum <= tpl_1(rg_got_data);
      rg_got_carry_out <= tpl_2(rg_got_data);
      $display("7. TB got values sum: %0d and carry: %0d", tpl_1(rg_got_data), tpl_2(rg_got_data));
      $finish;
   endrule

endmodule

endpackage
