package half_adder;

interface Ifc_hadder;

method Action ma_put_data (Bit#(1) a, Bit#(1) b);
method ActionValue#(Bit#(1)) mav_get_sum ();

endinterface

module mk_half_adder(Ifc_hadder);

Reg#(Bit#(1)) rg_x <- mkReg(0);
Reg#(Bit#(1)) rg_y <- mkReg(0);

Reg#(Bool) rg_initialized <- mkReg(False);
Reg#(Bool) rg_sum_done <- mkReg(False);
Reg#(Bit#(1)) sum <- mkReg(0);


rule rl_add(rg_initialized == True && rg_sum_done == False);
$display("3. Entered rule, adding %0d and %0d", rg_x, rg_y);
sum <= rg_x + rg_y;
rg_sum_done <= True;
$display("3. sum = %0d", sum);
endrule

method Action ma_put_data(Bit#(1) a, Bit#(1) b) if (rg_initialized == False);
rg_x <= a;
rg_y <= b;
sum <= 0;
$display("2. Got values rg_x: %d and rg_y: %0d", a, b);
rg_initialized <= True;
endmethod

method ActionValue #(Bit#(1)) mav_get_sum () if (rg_sum_done == True);
rg_initialized <= False;
return(sum);
endmethod

endmodule: mk_half_adder

endpackage: half_adder