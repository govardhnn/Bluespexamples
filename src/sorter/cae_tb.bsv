package cae_tb;

import cae :: *;


(*synthesize*)
module mkCAE_Testbench(Empty);
   
   IFC_cae cae <- mkCAE;
   
   Reg#(Bit#(32)) reg_tb_a <- mkReg(5);
   Reg#(Bit#(32)) reg_tb_b <- mkReg(4);

   rule insert_data_from_tb;
      cae.put_data(reg_tb_a, reg_tb_b);
   endrule
   
   rule get_data_from_tb;
      let swap_data <- cae.get_data();
      reg_tb_a <= tpl_1(swap_data);
      reg_tb_b <= tpl_2(swap_data);
   endrule
   
endmodule

endpackage
