package counter_Tb;

import counter :: *;

(*synthesize*)
module mk_counter_Tb(Empty);

   Ifc_counter count <- mk_counter;
   Reg#(Bit#(32)) rg_count_limit <- mkReg(20);
   Reg#(Bool) rg_init <- mkReg(False);
   
   rule rl_start_count(rg_init == False);
      $display("1. Starting count, sending the count limit value from TB: %0d ", rg_count_limit);
      count.ma_start_count(rg_count_limit);
      // take a register here that sends a signal to the design, wheich makes the TB wait for the new count value to be sent to the design. Make sure that the value is the count_mav done, which will then restart with maybe a newer count value, this time lets say, 5 lesser? good problem statement
     // rg_init <= True;
   endrule


  rule rl_finish;
      let lv_rsp <- count.mav_done();
      $display("4. Got response at Testbench: %b", lv_rsp);
      $finish();
   endrule
endmodule: mk_counter_Tb




endpackage: counter_Tb
