package shifter_testbench;

//import Utils       :: *;
import shifter     :: *;

(* synthesize *)
module mkTestbench (Empty);

   Shifter_IFC  shifter <- mkShifter;

   Reg #(Bit #(8)) rg_x <- mkReg (11);
   Reg #(Bit #(3)) rg_y <- mkReg (3);   
      
   rule request;
      shifter.do_shift (rg_x, rg_y);
   endrule
   
   rule finish_shift;
      let rsp <- shifter.get_rsp ();
      $display("%0d", rsp);
      $finish();
   endrule
   
endmodule: mkTestbench

endpackage: shifter_testbench
