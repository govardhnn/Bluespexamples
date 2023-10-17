package mac_1x1_testbench;

import mac_1x1 :: *;

(*synthesize*)

module mk_mac_1x1_testbench(Empty);

Ifc_mac_1x1 mac1 <- mk_mac_1x1;

rule rl_send_data;
$display("1");
mac1.put_data(5,2);
endrule

rule rl_get_data;
let lv_val <- mac1.get_data();
$display("3. got next values: %0d, %0d",tpl_1(lv_val), tpl_2(lv_val) );
$finish;
endrule

endmodule

endpackage