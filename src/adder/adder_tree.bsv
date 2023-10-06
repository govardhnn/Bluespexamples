package adder_tree;

interface Ifc_adder_tree;
   method Action ma_get_inputs(int in1, int in2, int in3, int in4, int in5, int in6, int in7, int in8);
   method ActionValue#(int) mav_return_sum();

endinterface: Ifc_adder_tree

module mk_adder_tree(Ifc_adder_tree);

   Reg#(int) rg_1 <- mkReg(0);
   Reg#(int) rg_2 <- mkReg(0);
   Reg#(int) rg_3 <- mkReg(0);
   Reg#(int) rg_4 <- mkReg(0);

   Reg#(int) rg_11 <- mkReg(0);
   Reg#(int) rg_12 <- mkReg(0);

   Reg#(Bool) rg_add_stage2 <- mkReg(False);
   Reg#(Bool) rg_add_done <- mkReg(False);

   rule rd_add_stage2 (rg_add_stage2 == True && rg_add_done == False);
      rg_11 <= rg_1 + rg_2;
      rg_12 <= rg_3 + rg_4;
      rg_add_done <= True;
      $display("3. Stage 2 values are: %0d %0d %0d %0d at the design", rg_1, rg_2, rg_3, rg_4);
   endrule

   method Action ma_get_inputs(int in1, int in2, int in3, int in4, int in5, int in6, int in7, int in8) if (rg_add_stage2 == False && rg_add_done == False) ;

      $display("2. Recieved Values: %0d %0d %0d %0d %0d %0d %0d %0d at the design", in1, in2, in3, in4, in5, in6, in7, in8);

      rg_1 <= in1 + in2;
      rg_2 <= in3 + in4;
      rg_3 <= in5 + in6;
      rg_4 <= in7 + in8;

      rg_add_stage2 <= True;
      rg_add_done <= False;
   endmethod

   method ActionValue#(int) mav_return_sum() if (rg_add_done == True);
      $display("3. Sending it back as sum : %0d", rg_11+rg_12);
      return(rg_11+rg_12);
   endmethod

endmodule: mk_adder_tree

endpackage: adder_tree
