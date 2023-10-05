package cae;

interface Ifc_cae;
   method Action put_data(Bit#(32) in_a, Bit#(32) in_b);
   method ActionValue#(Tuple2#(Bit#(32), Bit#(32))) get_data();
endinterface

(*synthesize*)

module mk_cae (Ifc_cae);
   Reg#(Bit#(32)) reg_in_a <- mkReg(0);
   Reg#(Bit#(32)) reg_in_b <- mkReg(0);
   Reg#(Bit#(32)) out_a <- mkReg(0);
   Reg#(Bit#(32)) out_b <- mkReg(0);
   // Wire#(Bool) data_inserted <- mkDWire(False);
   Reg#(Bool) rg_done <- mkReg(False);
   Reg#(Bool) rg_initialized <- mkReg(False);

   rule rl_swap((reg_in_a > reg_in_b) && rg_initialized == True && rg_done == False);
      $display("3.1");
      Bit#(32) temp = reg_in_a;
      reg_in_a <= reg_in_b;
      reg_in_b <= temp;
      rg_done <= True;
      //$finish;
    endrule
    
    rule rl_noswap((reg_in_a < reg_in_b) && rg_initialized == True && rg_done == False);
      $display("3.2");
      rg_done <= True;
      //$finish;
    endrule
    
   method Action put_data(Bit#(32) in_a, Bit#(32) in_b) if (rg_initialized == False);
      $display("2.");
      reg_in_a <= in_a;
      reg_in_b <= in_b;
      rg_initialized <= True;

   endmethod
   
   method ActionValue#(Tuple2# (Bit#(32), Bit#(32)) ) get_data () if (rg_done == True); 
      rg_done <= False;  
      return(tuple2(reg_in_a, reg_in_b));
   endmethod
endmodule

endpackage
