package half_adder_testbench;

import half_adder :: *;

module mk_half_adder_testbench(Empty);

Ifc_hadder hadder <- mk_half_adder;

Reg#(Bit#(1)) rg_a <- mkReg(0);
Reg#(Bit#(1)) rg_b <- mkReg(1);

rule send_data;
    $display("1. sending values %0d and %0d", rg_a, rg_b);
    hadder.ma_put_data(rg_a, rg_b);
endrule

rule recieve_data;
    $display("5. got data ");
    let rg_gotback <- hadder.mav_get_sum();
    $finish;
endrule


endmodule

endpackage