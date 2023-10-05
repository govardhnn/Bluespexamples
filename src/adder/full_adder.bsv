package full_adder;

interface Ifc_fadder;

method Action ma_put_data (Bit#(1) a, Bit#(1) b);
method ActionValue#(Tuple2#(Bit#(1), Bit#(1))) mav_get_sum ();

endinterface

module mk_full_adder(Ifc_fadder);

Reg#(Bit#(1)) rg_x <- mkReg(0);
Reg#(Bit#(1)) rg_y <- mkReg(0);

Reg#(Bool) rg_initialized <- mkReg(False);
Reg#(Bool) rg_sum_done <- mkReg(False);
Reg#(Bit#(1)) rg_sum <- mkReg(0);
Reg#(Bit#(1)) rg_carry <- mkReg(0);

rule rl_add(rg_initialized == True && rg_sum_done == False);
$display("3. Entered rule, adding %0d and %0d", rg_x, rg_y);
rg_sum <= rg_x + rg_y;
if(rg_x == 1 && rg_y == 1) begin
    rg_carry <= 1;
end
rg_sum_done <= True;
endrule

method Action ma_put_data(Bit#(1) a, Bit#(1) b) if (rg_initialized == False);
rg_x <= a;
rg_y <= b;
rg_sum <= 0;
rg_carry <= 0;
$display("2. Got values rg_x: %d and rg_y: %0d", a, b);
rg_initialized <= True;
endmethod

method ActionValue #(Tuple2#(Bit#(1), Bit#(1))) mav_get_sum () if (rg_sum_done == True);
rg_initialized <= False;
$display("4. sum = %0d, carry = %0d", rg_sum, rg_carry);

return(tuple2(rg_sum, rg_carry));
endmethod

endmodule: mk_full_adder

endpackage: full_adder