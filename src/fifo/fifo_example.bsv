package fifo_example;

import FIFO:: *;

interface Ifc_fifo_example;

method Action put_data(Int a, Int b);
method ActionValue#(Int) get_data;

endinterface

module mk_fifo_example(Ifc_fifo_example);

    FIFO#(Int) fifo_1 <- mkFIFO;

method Action put_data(Int a, Int b);
endmethod

method ActionValue#(Int) get_data;
endmethod

endmodule

endpackage