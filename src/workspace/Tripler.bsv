interface Tripler;
   method Action start(Bit#(32) n);
   method ActionValue#(Bit#(32)) getResult;
endinterface

(*synthesize*)
module mkTripler(Tripler);
   Reg#(Bit#(32)) x <- mkRegU;
   Reg#(Bit#(32)) y <- mkRegU;
   Reg#(Bool) busy <- mkReg(False);
   rule tripleStep if (busy && x > 0);
      x <= x - 1;
      y <= y + 3;
   endrule
   method Action start(Bit#(32) n) if (!busy);
      x <= n;
      y <= 0;
      busy <= True;
   endmethod
   method ActionValue#(Bit#(32)) getResult if (busy && x == 0);
      busy <= False;
      return y;
   endmethod
endmodule
