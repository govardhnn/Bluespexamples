package full_adder_testbench;

import full_adder :: *;

module mk_full_adder_testbench(Empty);

Ifc_fadder fadder <- mk_full_adder;

Reg#(Bit#(1)) rg_a <- mkReg(1);
Reg#(Bit#(1)) rg_b <- mkReg(1);
Reg#(Bit#(1)) rg_got_sum <- mkReg(0);
Reg#(Bit#(1)) rg_got_carry <- mkReg(0);

rule send_data;
    $display("1. sending values %0d and %0d", rg_a, rg_b);
    fadder.ma_put_data(rg_a, rg_b);
endrule

rule recieve_data;
    let rg_got_data <- fadder.mav_get_sum();
    rg_got_sum <= tpl_1(rg_got_data);
    rg_got_carry <= tpl_2(rg_got_data);
    //$display("4. got data: sum = %0d, carry = %0d", rg_got_sum, rg_got_carry );
    $finish;
endrule

endmodule

endpackage