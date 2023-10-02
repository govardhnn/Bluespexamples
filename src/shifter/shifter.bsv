package shifter;

interface Ifc_shifter;
   method Action ma_do_shift (Bit#(8) data, Bit#(3) amt) ;
   method ActionValue #(Bit#(8)) mav_get_rsp ();
endinterface

(* synthesize *)
module mkShifter(Ifc_shifter);

   Reg#(Bit#(8)) rg_data <- mkReg(0);
   Reg#(Bit#(3)) rg_amt <- mkReg(0); 
   Reg#(Bit#(3)) rg_state <- mkReg(0); // goes from state 3'b0 to 3'b100
   Wire#(Bool) wr_fire <- mkDWire(False);
   
   rule r1_1 (rg_state == 1);
      $display("-> Shifting rg_data by %0d", rg_amt[0]);
      rg_data <= (rg_amt[0] == 1) ? rg_data << 1 : rg_data;
      rg_state <= 2;
   endrule  
   
   rule rl_2 (rg_state == 2);
      $display("-> rg_data is now %0d", rg_data);
      $display("-> Shifting rg_data by %0d", rg_amt[1]);
      rg_data <= (rg_amt[1] == 1) ? rg_data << 2 : rg_data ;
      rg_state <= 3;
   endrule
   
   rule rl_3 ( rg_state == 3 );
      $display("-> rg_data is now %0d", rg_data);
      $display("-> Shifting rg_data by %0d", rg_amt[2]);
      rg_data <= (rg_amt[2] == 1) ? rg_data << 4 : rg_data ;
      rg_state <= 4;
   endrule

   method Action ma_do_shift (Bit #(8) data, Bit #(3) amt) if (rg_state == 0);
      $display("-> Entered the design, \n-> loading values rg_data: %0d and rg_amt: %0d", data, amt);
      rg_data <= data;
      rg_amt <= amt;
      rg_state <= 1;
   endmethod
   
   method ActionValue#(Bit #(8)) mav_get_rsp () if (rg_state == 4);
      $display("-> after shifting, rg_data: %0d from design", rg_data);
      rg_state <= 0;
      return (rg_data);
   endmethod 

endmodule
endpackage
