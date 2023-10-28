package asynch_fifo_testbench;

import asynch_fifo :: *;

(* synthesize *)
module mk_asynch_fifo_testbench(Empty);

    Ifc_asynch_fifo a_fifo <- mk_asynch_fifo();

    rule rl_put;
        a_fifo.ma_put(1);
    endrule

    rule rl_get;
        let lv_val <- a_fifo.ma_get;
        $display("Got value %d", lv_val);
        $finish();
    endrule

endmodule


endpackage: asynch_fifo_testbench
