package fifo_example_testbench;

import fifo_example :: *;

(* synthesize *)
module mk_fifo_example_testbench(Empty);

Ifc_fifo_example fifo_inst <- mk_fifo_example;

Reg#(int) rg_input_1 <- mkReg(2);
Reg#(int) rg_input_2 <- mkReg(3);

Reg#(int) rg_counter <- mkReg(0);

rule rl_1 (rg_counter < 20);
    $display("rg_input_1 = %d, rg_input_2 = %d", rg_input_1, rg_input_2);
fifo_inst.put_data(rg_input_1, rg_input_2);
endrule

rule rl_2;
    rg_counter <= rg_counter + 1;
    rg_input_1 <= rg_input_1 << 1;
    rg_input_2 <= rg_input_2 << 1;

    let lv_data <- fifo_inst.get_data();
    $display("lv_data = %d", tpl_1(lv_data), tpl_2(lv_data));
    
    if (rg_counter == 20 ) begin 
    $display("counter has reached 20");
    $finish;
    end
endrule
endmodule

endpackage