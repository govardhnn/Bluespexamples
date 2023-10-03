package simple_multiplier;

interface Ifc_multiplier;
   method Action ma_do_multiply (Bit#(8) in_a, Bit#(8) in_b) ;
   method ActionValue #(Bit#(64)) mav_get_rsp ();
endinterface

(* synthesize *)
module mk_simple_multiplier(Ifc_multiplier);

   Reg#(Bit#(8)) rg_in_a <- mkReg(0);
   Reg#(Bit#(8)) rg_in_b <- mkReg(0);
 
   Reg#(Bit#(64)) rg_data <- mkReg(0); 
   Reg#(Bit#(3)) rg_state <- mkReg(0); // goes from state 3'b0 to 3'b100
   
   rule r1_1 (rg_state == 1);
      $display("3. -> multiplying rg_in_a: %0d with rg_in_b: %0d ",rg_in_a, rg_in_b );
      rg_data <= zeroExtend(rg_in_a) * zeroExtend(rg_in_b);
      rg_state <= 2;
   endrule  
   
   rule rl_2 (rg_state == 2);
      $display(" Product: %0d", rg_data);
      $display("4. -> multiplying rg_in_a: %0d with rg_in_b: %0d again * rg_data: %0d",rg_in_a, rg_in_b, rg_data);
      rg_data <= zeroExtend(rg_in_a) * zeroExtend(rg_in_b) * zeroExtend(rg_data);
      rg_state <= 3;
   endrule
   
   rule rl_3 ( rg_state == 3 );
    $display(" Product: %0d", rg_data);
      $display("5. -> multiplying rg_in_a: %0d with rg_in_b: %0d again * rg_data: %0d",rg_in_a, rg_in_b, rg_data);
      rg_data <= zeroExtend(rg_in_a) * zeroExtend(rg_in_b) * zeroExtend(rg_data);
      rg_state <= 4;
   endrule

   method Action ma_do_multiply (Bit #(8) in_a, Bit #(8) in_b) if (rg_state == 0);
     $display(" Product: %0d", rg_data);
      $display("2. -> Entered the design, \n loading values \n rg_in_a: %0d and \n rg_in_b: %0d", in_a, in_b);
      rg_in_a <= in_a;
      rg_in_b <= in_b;
      rg_state <= 1;
   endmethod
   
   method ActionValue#(Bit #(64)) mav_get_rsp () if (rg_state == 4);
      rg_state <= 0;
      return (rg_data);
   endmethod 

endmodule

endpackage