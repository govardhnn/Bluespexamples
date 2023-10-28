package sized_fifo_example_testbench;

import sized_fifo_example :: *;

(* synthesize *)
module mk_sized_fifo_example_testbench(Empty);

Ifc_sized_fifo_example sized_fifo_inst <- mk_sized_fifo_example;

Reg#(int) rg_input_1 <- mkReg(2);
Reg#(int) rg_input_2 <- mkReg(3);


rule rl_1;
    $display("tb sending rg_input_1 = %0d, rg_input_2 = %0d", rg_input_1, rg_input_2);
    sized_fifo_inst.put_data(rg_input_1, rg_input_2);
endrule

rule rl_2;
    let lv_data <- sized_fifo_inst.get_data();
  
    $display("tb got back values = %0d", tpl_1(lv_data), tpl_2(lv_data));
    $finish;
endrule
endmodule

endpackage