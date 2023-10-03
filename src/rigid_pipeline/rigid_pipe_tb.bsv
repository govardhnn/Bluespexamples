package rigid_pipe_tb;

import rigid_pipe :: *;

module mk_rigid_pipe_tb(Empty);
   
   Reg#(int) rg_sender <- mkReg(4);
   Ifc_rigid_pipe pipe <- mk_rigid_pipe;
   
   rule fill (rg_sender > 0);
      pipe.send(rg_sender);
      rg_sender <= rg_sender + 5;
   endrule

   rule drain;
      let drained_val = pipe.recieve();
      $display(" drained_val = %0d ", drained_val);
      if (drained_val > 50) $finish(0);
   endrule

endmodule

endpackage
