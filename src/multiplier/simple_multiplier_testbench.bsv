package simple_multiplier_testbench;

import simple_multiplier :: * ;

(*synthesize*)
module mk_simple_multiplier_testbench(Empty);

Ifc_simple_multiplier multiplier_inst <- mk_simple_multiplier;
    
Reg#(Bit#(32)) rg_x <- mkReg(8);
Reg#(Bit#(32)) rg_y <- mkReg(4);  

rule rl_request;
    $display("-> Sending the values rg_x: %0d and rg_y :%0d", rg_x, rg_y);
    multiplier_inst.ma_inputs(rg_x, rg_y);
endrule

rule rl_response;

endrule

endmodule : mk_simple_multiplier_testbench
endpackage: simple_multiplier_testbench