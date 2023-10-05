package Count_clock_Tb;

import FIFO::*;
import GetPut::*;
import ClientServer::*;

(*synthesize*)

module mkTb(Empty);
   
   Reg#(Int) cycle <- mkReg(0);
   
   rule count_cycles;
      cycle <= cycle + 1;
      if (cycle < 20) $finish(0);
   endrule

   rule r;
      int a = x;
      a = a * a;
      
      if (pack(cycle)[0] == 0) a = a + 1;
      else
	 a = a + 2;
      if (pack(cycle)[1:0] == 3) a = a + 3;
      for (int k = 20; k < 24; k = k + 1)
	 a = a + k;
      $display ("%0d: rule r, a = %0d", cycle, a);
   endrule

endmodule: mkTb

endpackage: Tb
