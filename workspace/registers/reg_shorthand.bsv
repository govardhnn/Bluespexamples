package reg_shorthand;

(* synthesize *)

module mkTb (Empty);
   
   Reg#(int) x <- mkReg ('h10);
   Reg#(int) pipe <- mkPipe;
   
   rule fill;
      pipe <= x;
      x <= x + 'h10;
   endrule
   
   rule drain;
      let y = pipe;
      $display ("y  = %0h", y);
      if (y > 'h80) 
	 $finish(0);
   endrule

endmodule

(* synthesize *)

module mkPipe (Reg#(int));
   Reg#(int) x1 <- mkRegU;
   Reg#(int) x2 <- mkRegU;
   Reg#(int) x3 <- mkRegU;
   Reg#(int) x4 <- mkRegU;

   rule r1;
      x2 <= x1 + 1;
      x3 <= x2 + 1;
      x4 <= x3 + 1;
   endrule
   
   rule show;
      $display ("x1, x2, x3, x4 = %0h, %0h, %0h, %0h", x1, x2, x3, x4);
   endrule

   method Action _write (int a);
      x1 <= a;
   endmethod

   method int _read ();
      return x4;
   endmethod

endmodule: mkPipe
endpackage
