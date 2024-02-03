package adder_tree_testbench;

import adder_tree :: *;

(*synthesize*)

module mk_adder_tree_testbench(Empty);

   Ifc_adder_tree adder <- mk_adder_tree;

   rule rl_send_in;
      $display("1. Sending the values from the testbench");
      adder.ma_get_inputs(1,2,3,4,5,6,7,8);
   endrule

   rule rg_get_sum;
      let sum <- adder.mav_return_sum();
      $display("4. Got the values %0d:", sum);
      $finish;
   endrule


endmodule

endpackage: adder_tree_testbench
