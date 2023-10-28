package sized_fifo_example;

import FIFO:: *;

interface Ifc_sized_fifo_example;

method Action put_data(int a, int b);
method ActionValue#(Tuple2#(int, int)) get_data;

endinterface

(* synthesize *)
module mk_sized_fifo_example(Ifc_sized_fifo_example);

    FIFO#(int) fifo_1 <- mkSizedFIFO(4);
    FIFO#(int) fifo_2 <- mkSizedFIFO(4);

    Reg#(Bit#(2)) rg_depth <- mkReg(0);
    Reg#(Bool) rg_done <- mkReg(False);
    Reg#(int) rg_a <- mkReg(0);
    Reg#(int) rg_b <- mkReg(0);

    /* try the alternate preempts to check the scheduling working */
    //(* preempts = "rl_1, rl_1_conf" *)
    (* preempts = "rl_1_conf, rl_1" *)

rule rl_1 (rg_depth == 2'b1 && !rg_done);
    $display("3. sized fifo enqueues values %0d and %0d to depth 2", rg_a, rg_b);
    fifo_1.enq(rg_a + 2);
    fifo_2.enq(rg_b + 2);
    rg_depth <= 2'b11;
endrule

rule rl_1_conf (rg_depth == 2'b1 && !rg_done);
    $display("3. sized fifo enqueues values %0d and %0d to depth 2", rg_a, rg_b);
    fifo_1.enq(rg_a);
    fifo_2.enq(rg_b);
    rg_depth <= 2'b11;
endrule

rule rl_2 (rg_depth == 2'b11 && !rg_done);
    $display("4. sized fifo dequeues values %0d and %0d", fifo_1.first(), fifo_2.first());
    fifo_1.deq();
    fifo_2.deq();
    rg_done <= True;
    rg_depth <= 2'b1;
endrule

method Action put_data(int a, int b) if (rg_depth == 0 && !rg_done);
    $display("1. sized fifo get values %0d and %0d", a, b);
    rg_a <= a * 2;
    rg_b <= b * 2;
    fifo_1.enq(a);
    fifo_2.enq(b);
    $display("2. sized fifo enqueues the values to depth 1");
    rg_depth <= 2'b1;
endmethod

method ActionValue#(Tuple2#(int, int)) get_data () if (rg_depth == 1 && rg_done);
    $display("5. We now have the values %0d and %0d in the FIFO left to be returned, and that also we will return, so fifo is now empT :(", fifo_1.first(), fifo_2.first());
    fifo_1.deq(); fifo_2.deq();
    return (tuple2(fifo_1.first(), fifo_2.first()));

endmethod

endmodule

endpackage