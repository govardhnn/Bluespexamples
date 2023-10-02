package simple_multiplier;

interface Ifc_simple_multiplier;
    method Action ma_inputs (Bit#(32) in_a, Bit#(32) in_b);
    method ActionValue #(Bit#(32)) mav_product(); 
endinterface

(*synthesize*)
module mk_simple_multiplier(Ifc_simple_multiplier);
    Reg#(Bit#(32)) rg_in_a <- mkReg(0);
    Reg#(Bit#(32)) rg_in_b <- mkReg(0);
    Reg#(Bit#(32)) rg_product <- mkReg(0);
    Wire#(Bool) wr_mul <- mkDWire(False);
    Wire#(Bool) wr_mul_done <- mkDWire(False);

    rule rl_multiply(wr_mul == True);
        $display("Entered the multiply section");
        rg_product <= rg_in_a * rg_in_b;
        $display("multiplication done");
        wr_mul_done <= True;
    endrule

    method Action ma_inputs (Bit#(32) in_a, Bit#(32) in_b) if (wr_mul == False);
        $display("-> Entered the design, \n-> loading values rg_in_a: %0d and rg_in_b: %0d", rg_in_a, rg_in_b);
        rg_in_a <= in_a;
        rg_in_b <= in_b;
        wr_mul <= True;
    endmethod
        
    method ActionValue #(Bit#(32)) mav_product() if (wr_mul_done == True);
        $display("Entered the returning mav, sending rg_product:%0d", rg_product) ;
        return(rg_product);
    endmethod 
endmodule: mk_simple_multiplier

endpackage: simple_multiplier