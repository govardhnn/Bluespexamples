package vfifo_testbench;

import vfifo::*;



module mk_vfifo_testbench(Empty);

Reg#(Bit#(3)) rg_dummy_states <- mkReg(0);

Ifc_vfifo vfifo <- mk_vfifo;

rule rl_initialize_vec_1(rg_dummy_states == 0);

    vfifo.vf_enqueue(3);
    rg_dummy_states <= 1;

endrule

rule rl_initialize_vec_2(rg_dummy_states == 1);
    vfifo.vf_enqueue(2);
    rg_dummy_states <= 2;
endrule

rule rl_initialize_vec_3(rg_dummy_states == 2);
    rg_dummy_states <= 3;
    $finish;

endrule


endmodule

endpackage