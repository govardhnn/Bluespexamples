package simple_multiplier;

interface Ifc_simple_multiplier;
    method Action ma_inputs (Bit#(32) in_a, Bit#(32) in_b);
    method ActionValue #(Bit#(32)) mav_product(); 
endinterface

(*synthesize*)
module mk_simple_multiplier(Ifc_simple_multiplier);
    Reg#(Bit#(32)) rg_in_a <- mkReg(0);
    Reg#(Bit#(32)) rg_in_b <- mkReg(0);

    rule rl_multiply;
    
    endrule
    method Action ma_inputs (Bit#(32) in_a, Bit#(32) in_b);

    endmethod
        
    method ActionValue mav_product (Bit#(32) prod);
    
    endmethod 
endmodule: mk_simple_multiplier

endpackage: simple_multiplier