package mac_1x1;

interface Ifc_mac_1x1;
method Action put_data (int i, int j);
method ActionValue#(Tuple2#(int, int )) get_data;
endinterface

(*synthesize*)

module mk_mac_1x1(Ifc_mac_1x1);

Reg#(int) rg_M00 <- mkReg(0);

Reg#(int) rg_i_next <- mkReg(0);
Reg#(int) rg_j_next <- mkReg(0);


Reg#(Bool) rg_mac_done <- mkReg(False);

method Action put_data (int i, int j) if (rg_mac_done == False);
$display("2. MAC got i and j values: %0d, %0d", i, j);
rg_i_next <= i;
rg_j_next <= j;
rg_M00 <= (i * j) + (rg_M00);
rg_mac_done <= True;
endmethod


method ActionValue#(Tuple2#(int, int )) get_data if (rg_mac_done);
$display("3. MAC has %0d", rg_M00);
rg_mac_done <= False;
return(tuple2(rg_i_next, rg_j_next));
endmethod

endmodule

endpackage : mac_1x1
 