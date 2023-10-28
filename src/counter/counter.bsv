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

   method Action ma_start(Bool count_up);
      $display("counting is up? %0d", count_up);
      $display("value in reg is: %0d", rg_count);
      if (count_up == True)   rg_count <= rg_count + 1;
      else rg_count <= rg_count - 1;
   endmethod

   method int ma_stop ();
      return(rg_count);
   endmethod

endmodule: mk_counter

endpackage: counter
