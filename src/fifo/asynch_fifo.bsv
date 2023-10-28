package asynch_fifo;

import FIFO::*;

interface Ifc_asynch_fifo;
    method Action ma_put (int x);
    method ActionValue#(int) ma_get();
endinterface

(* synthesize *)
module mk_asynch_fifo(Ifc_asynch_fifo);
    
    FIFO#(int) ff_f1 <- mkFIFO;
    FIFO#(int) ff_f2 <- mkFIFO;
    FIFO#(int) ff_f3 <- mkFIFO;
    FIFO#(int) ff_f4 <- mkFIFO;

    rule rl_1;
        ff_f2.enq(ff_f1.first());
        ff_f1.deq();
        rg_done <= False;
    endrule

    rule rl_2;
        ff_f3.enq(ff_f2.first());
        ff_f2.deq();
    endrule

    rule rl_3;
        ff_f4.enq(ff_f3.first());
        ff_f3.deq();    
    endrule

    method Action ma_put (int x);
        ff_f1.enq(x);
    endmethod

    method ActionValue#(int) ma_get();
        ff_f4.deq();
        return(ff_f4.first());
    endmethod

endmodule   

endpackage