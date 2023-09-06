package thought;


(*synthesize*)
// Design
module mkDeepThought(IFC_type);
   method int the_answer (int x, int y, int z);
      return x + y + z;
   endmethod   
endmodule

interface IFC_type;
   method int the_answer (int x, int y, int z);
endinterface

module mkTB();
   IFC_type ifc <- mkDeepThought;
   rule the_test_answer;
      $display("Hello, the answer is %d", ifc.the_answer(10,12,14));
      $finish(0);
   endrule   
endmodule

endpackage
