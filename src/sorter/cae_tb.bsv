package cae_tb;

import cae :: *;

(*synthesize*)
module mk_cae_tb(Empty);
   
   Ifc_cae cae <- mk_cae;
   
   Reg#(Bit#(32)) rg_x <- mkReg(5);
   Reg#(Bit#(32)) rg_y <- mkReg(4);

   rule insert_data_from_tb;
      $display("1. Sending values rg_x: %0d and rg_y: %0d", rg_x, rg_y);
      cae.put_data(rg_x, rg_y);
   endrule
   
   rule get_data_from_tb;
      let swap_data <- cae.get_data();
      rg_x <= tpl_1(swap_data);
      rg_y <= tpl_2(swap_data);
   endrule
   
endmodule

endpackage
