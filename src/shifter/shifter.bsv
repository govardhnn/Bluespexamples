package shifter;

interface Shifter_IFC;
   method Action  do_shift (Bit #(8) data, Bit #(3) amt) ;
   method ActionValue #(Bit #(8)) get_rsp ();

endinterface
// Interface Action and ActionValue syntax?
(* synthesize *)

module mkShifter(Shifter_IFC);

   Reg #( Bit #(8)) reg_data <- mkReg(0);
   Reg #( Bit #(3)) reg_amt <- mkReg(0); 
   Reg #( Bit #(2)) reg_state <- mkReg(0);
   Wire #( Bool) wr_fire <- mkDWire(False);
   

   rule rl_2 ( reg_state == 1 );
      reg_data <= (reg_amt[1] == 1) ? reg_data << 2 : reg_data ;
      reg_state <= 2;
   endrule
   
   rule rl_3 ( reg_state == 2 );
      reg_data <= (reg_amt[2] == 1) ? reg_data << 4 : reg_data ;
      reg_state <= 3;
   endrule

   method Action do_shift (Bit #(8) data, Bit #(3) amt) if (reg_state == 0);
      reg_data <=  (amt[0] == 1) ? data << 1 : data;
      reg_amt <= amt;
      reg_state <= 1;

 //data; reg_amt <= amt;
     // wr_fire <= True;
   endmethod
   
   method ActionValue#(Bit #(8)) get_rsp () if (reg_state == 3);
      //reg_state <= 0;
      $display("%0d from design", reg_data);
      reg_state <= 0;
      return (reg_data);
   endmethod 


endmodule
endpackage
