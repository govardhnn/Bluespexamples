package half_adder_testbench;

import half_adder :: *;

module mk_half_adder_testbench(Empty);

Ifc_hadder hadder <- mk_half_adder;

Reg#(Bit#(1)) rg_a <- mkReg(1);
Reg#(Bit#(1)) rg_b <- mkReg(0);

rule send_data;
    $display("1. sending values %0d and %0d", rg_a, rg_b);
    hadder.ma_put_data(rg_a, rg_b);
endrule

rule recieve_data;
    let rg_gotback <- hadder.mav_get_sum();
    $display("4. got data: sum = %0d", rg_gotback );

    $finish;
endrule

endmodule

endpackage