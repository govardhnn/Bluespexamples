package shifter_testbench;

import shifter     :: *;

(*synthesize*)
module mk_shifter_testbench(Empty);

   Ifc_shifter  shifter <- mkShifter;

   // shifting 11 left by 3 (11 << 3) -> answer: 88 
   Reg#(Bit#(8)) rg_x <- mkReg(11);
   Reg#(Bit#(3)) rg_y <- mkReg(3);   
   
   rule request;
      shifter.ma_do_shift(rg_x, rg_y);
      $display("-> Sending the values rg_x: %0d and rg_y :%0d", rg_x, rg_y);
   endrule
   
   rule finish_shift;
      let rsp <- shifter.mav_get_rsp ();
      $display("Got response at Testbench: %0d", rsp);
      $finish();
   endrule
   
endmodule: mk_shifter_testbench

endpackage: shifter_testbench
