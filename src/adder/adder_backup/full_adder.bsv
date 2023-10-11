package full_adder;

interface Ifc_fadder;
   method Action ma_put_data_fa (Bit#(1) a, Bit#(1) b, Bit#(1) carry_in);
   method ActionValue#(Tuple2#(Bit#(1), Bit#(1))) mav_get_sum_fa ();
endinterface

import half_adder :: * ;

/*
using two half adders and an or gate to make a full adder

inputs: A, B. Carry_in
outputs: Sum, Carry_out

First Half Adder: 
inputs:  A, B
outputs: Sum_1 (A+B) and Carry_1 (A&B)

Second Half Adder:
inputs: Sum of First Half Adder and Carry_in
outputs: Sum_2 (A^B^Carry_in), Carry_2((A^B)*Carry_in)

Carry_out = Carry_1 + Carry_2 = (A*B) + (A^B)*Carry_in

*/

(*synthesize*)
module mk_full_adder (Ifc_fadder);

   Ifc_hadder ha_1 <- mk_half_adder;
   Ifc_hadder ha_2 <- mk_half_adder;

   Reg#(Bit#(1)) rg_carry_in <- mkReg(0);

   Reg#(Bool) rg_initialized <- mkReg(False);
   Reg#(Bool) rg_sum_1_done <- mkReg(False);
   Reg#(Bool) rg_sum_2_done <- mkReg(False);

   Reg#(Bit#(1)) rg_carry_1 <- mkReg(0);

   Reg#(Bit#(1)) rg_sum <- mkReg(0);
   Reg#(Bit#(1)) rg_carry_out <- mkReg(0);

   rule rl_add_ha1_recieve(rg_initialized == True && rg_sum_1_done == False && rg_sum_2_done == False);

      let lv_ha_output <- ha_1.mav_get_sum();
      rg_carry_1 <= tpl_2(lv_ha_output);
      $display("3. Got values sum_1: %0d and carry_1: %0d from half adder", tpl_1(lv_ha_output), tpl_2(lv_ha_output));

      ha_2.ma_put_data(tpl_1(lv_ha_output),rg_carry_in);
      rg_sum_1_done <= True;
      
   endrule

   rule rl_add_ha2_send(rg_initialized == True && rg_sum_1_done == True && rg_sum_2_done == False);

      let lv_ha_2_output <- ha_2.mav_get_sum();
      $display("4. Got values sum_2: %0d and carry_2: %0d from half adder 2", tpl_1(lv_ha_2_output), tpl_2(lv_ha_2_output));
       rg_sum <= tpl_1(lv_ha_2_output);
       $display("5. Perforiming OR operation with the rg_carry_1: %0d and carry of the half adder: %0d",rg_carry_1, tpl_2(lv_ha_2_output) );
      rg_carry_out <= rg_carry_1 + tpl_2(lv_ha_2_output);
      rg_sum_2_done <= True;
   endrule


   method Action ma_put_data_fa (Bit#(1) a, Bit#(1) b, Bit#(1) carry_in) if (rg_initialized == False && rg_sum_1_done == False && rg_sum_2_done == False);

      rg_carry_in <= carry_in;
      
      rg_carry_1 <= 0;
      rg_sum <= 0;
      rg_carry_out <= 0;
      $display("2. Got values rg_x: %d, rg_y: %0d and carry_in %0d", a, b, carry_in);

      ha_1.ma_put_data(a,b);
      rg_initialized <= True;

   endmethod

   method ActionValue#(Tuple2#(Bit#(1), Bit#(1))) mav_get_sum_fa () if (rg_sum_1_done && rg_sum_2_done);

      $display("6. Returning Values Sum: %0d and Carry: %0d", rg_sum, rg_carry_out);
      rg_sum_1_done <= False;
      rg_sum_2_done <= False;
      rg_initialized <= False;
      return(tuple2(rg_sum, rg_carry_out));
      
   endmethod

endmodule: mk_full_adder

endpackage: full_adder
