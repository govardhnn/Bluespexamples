package counter;

/*
changelog:
1. making a basic counter
2. making it an up-down counter with simplified interfaces

*/
interface Ifc_counter;
   method Action ma_start(Bool count_up);
   method int ma_stop ();
endinterface

(*synthesize*)
module mk_counter(Ifc_counter);

   Reg#(int) rg_count <- mkReg(0);
   Wire#(int) wr_incr <- mkWire();
   Wire#(int) wr_decr <- mkWire();

   rule rl_incr;
      $display("value in reg is: %0d", rg_count);
      rg_count <= rg_count + wr_incr;
   endrule

   rule rl_decr;
      $display("value in reg is: %0d", rg_count);
      rg_count <= rg_count - wr_decr;
   endrule

   method Action ma_start(Bool count_up);
      $display("counting is up? %0d", count_up);
      if (count_up == True)   wr_incr <= 1;
      else wr_decr <= 1;
   endmethod

   method int ma_stop ();
      return(rg_count);
   endmethod

endmodule: mk_counter

endpackage: counter
