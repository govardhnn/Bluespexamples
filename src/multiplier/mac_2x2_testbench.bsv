package mac_2x2_testbench;

import mac_2x2 :: *;

(*synthesize*)
module mk_mac_2x2_testbench(Empty);

Ifc_mac_2x2 mac1 <- Ifc_mac_2x2;

Reg#(int) rg_counter <- mkReg(0);

rule rl_send_data;
$display("1. Sending Values ");
mac1.put_data(5,2);
rg_counter <= rg_counter + 1;
endrule

rule rl_get_data;
let lv_val <- mac1.get_data();
$display("3. got next values: %0d, %0d",tpl_1(lv_val), tpl_2(lv_val) );
if (rg_counter == 5) $finish;
endrule

endmodule

endpackage