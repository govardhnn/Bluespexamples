package full_adder;


interface IFC_type;
   method int the_answer (int a, int b, int cin);
endinterface

module full_add(IFC_type);
   function Bit#(2) fa (Bit#(1) a, Bit#(1) b, Bit#(1) cin);
   let s = a ^ b ^ cin;
   let cout = (a & b) | (cin & (a ^ b));
   return {cout, s};
   endfunction
endmodule

endpackage
