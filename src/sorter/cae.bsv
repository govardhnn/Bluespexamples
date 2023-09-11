package cae;


interface IFC_cae;
   method Action put_data(Bit#(32) in_a, Bit#(32) in_b);
   method ActionValue#(Tuple2#(Reg#(Bit#(32)))) get_data();
endinterface

(*synthesize*)

module mkCAE (IFC_cae);
   Reg#(Bit#(32)) reg_in_a <- mkReg(0);
   Reg#(Bit#(32)) reg_in_b <- mkReg(0);
   Reg#(Bit#(32)) out_a <- mkReg(0);
   Reg#(Bit#(32)) out_b <- mkReg(0);
   // Wire#(Bool) data_inserted <- mkDWire(False);
   
   rule swap(reg_in_a > reg_in_b);
      reg_in_a <= reg_in_b;
      reg_in_b <= reg_in_a;
   endrule
   
   method Action put_data(Reg#(Bit#(32)) in_a, in_b);
      reg_in_a <= in_a;
      reg_in_b <= in_b;
   endmethod
   
   method ActionValue#(Tuple2#(Reg#(Bit#(32))) out_a, out_b) get_data();
      out_a <- reg_in_a;
      out_b <- reg_in_b;
      return(tuple2(out_a, out_b));
   endmethod
endmodule
endpackage
