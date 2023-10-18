package mac_1x1;

interface Ifc_mac_1x1;
method Action put_data (int i, int j);
method ActionValue#(Tuple2#(int, int )) get_data;
endinterface

(*synthesize*)

module mk_mac_1x1(Ifc_mac_1x1);

Reg#(int) rg_M00 <- mkReg(0);

Reg#(int) rg_i <- mkReg(0);
Reg#(int) rg_j <- mkReg(0);

Wire#(int) wr_i_next <- mkDWire(0);
Wire#(int) wr_j_next <- mkDWire(0);

Reg#(Bool) rg_initialized <- mkReg(False);

Reg#(Bool) rg_mac_done <- mkReg(False);

rule rl_mac1(rg_initialized && !rg_mac_done);
rg_M00 <= (rg_i * rg_j) + (rg_M00);
rg_mac_done <= True;
endrule

method Action put_data (int i, int j) if (rg_initialized == False);
$display("2. MAC got i and j values: %0d, %0d", i, j);
rg_i <= i;
rg_j <= j;
rg_initialized <= True;
endmethod

method ActionValue#(Tuple2#(int, int )) get_data if (rg_initialized && rg_mac_done);
$display("3. MAC has %0d", rg_M00);
rg_initialized <= False;
rg_mac_done <= False;
return(tuple2(rg_i, rg_j));
endmethod

endmodule

endpackage : mac_1x1
 