package counter;

interface Ifc_counter;
   method Action ma_start_count (Bit#(32) count_limit);
   method ActionValue#(Bool) mav_done (); 
endinterface

(*synthesize*)
module mk_counter(Ifc_counter);

Reg#(Bit#(32)) rg_count_upto <- mkReg(0);
Reg#(Bit#(32)) rg_count_val <- mkReg(0);
Reg#(Bool) rg_count_tick <- mkReg(False);
Reg#(Bool) rg_count_lim_reached <- mkReg(False);

rule rl_count(rg_count_lim_reached == False && rg_count_tick == True);

   $display("3. Current count value: %0d", rg_count_val);
   rg_count_val <= rg_count_val + 1;
   rg_count_tick <= False;
   if (rg_count_val == rg_count_upto) begin
      rg_count_lim_reached <= True;
   end
endrule

method Action ma_start_count (Bit#(32) count_limit) if (rg_count_tick == False && rg_count_lim_reached == False);
   rg_count_upto <= count_limit;
   $display("2. Count limit value: %0d", count_limit);
   rg_count_tick <= True;   
endmethod

method ActionValue#(Bool) mav_done () if (rg_count_lim_reached == True);
//$display("4. rg_count_val has reached %0d", rg_count_upto);
rg_count_tick <= False;
return(True);


endmethod 

endmodule: mk_counter

endpackage: counter