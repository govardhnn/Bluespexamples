package fifo_example_testbench;

module mk_fifo_example_testbench(Empty);

Ifc_fifo_example fifo_inst <- mk_fifo_example;

Reg#(Int) rg_send_value <- mkReg(20);

rule rl_1;
fifo_inst.put_data(20)
endrule

endmodule

endpackage