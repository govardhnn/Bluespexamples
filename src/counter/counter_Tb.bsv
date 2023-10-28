package counter_Tb;

import counter :: *;

(*synthesize*)
module mk_counter_Tb(Empty);

   Ifc_counter count <- mk_counter;
   
   Reg#(int) rg_counter_tb <- mkReg(0);

   rule rl_start_count(rg_counter_tb < 10);
      $display("TB: count up");
      count.ma_start(True);
      rg_counter_tb <= rg_counter_tb + 1;
   endrule

   rule rl_decrement(rg_counter_tb >= 10 && rg_counter_tb < 15);
      $display("TB:           count down");
      count.ma_start(False);
      rg_counter_tb <= rg_counter_tb + 1;
   endrule

   rule rl_finish(rg_counter_tb  == 15);
      $display("TB:                    done");
      let lv_returned = count.ma_stop();
      rg_counter_tb <= 0;
      $finish;
   endrule

endmodule: mk_counter_Tb




endpackage: counter_Tb
