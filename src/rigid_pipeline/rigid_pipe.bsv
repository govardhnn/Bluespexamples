package rigid_pipe;

import FIFO :: *;
import GetPut :: *;
import ClientServer :: *;

interface Ifc_rigid_pipe;
   method Action send (int a);
   method int recieve ();
endinterface

(*synthesize*)
module mk_rigid_pipe (Ifc_rigid_pipe);

   Reg#(int) rg_x1 <- mkReg(0);
   Reg#(int) rg_x2 <- mkReg(0);
   Reg#(int) rg_x3 <- mkReg(0);
   
   rule r1;
      rg_x2 <= rg_x1 + 1;
      rg_x3 <= rg_x2 + 1;   
   endrule
   
   method Action send (int a);
      rg_x1 <= a;
   endmethod
   
   method int recieve ();
      //$display(" recieved_val = %0d ", rg_x3);
      return rg_x3;
   endmethod

endmodule

endpackage
