package basic_pipeline;

interface Basic_IFC;
   method Action put_data (Bit#(8) data_in);
   method ActionValue#(Bit#(8)) get_data();
endinterface 


(*synthesize*)
module mk_basic_pipeline(Basic_IFC);
   
   Reg#(Bit#(8)) data_in_reg <- mkReg(0);
   Reg#(Bit#(8)) data_out_reg <- mkReg(0);
   Reg#(Bit#(1)) data_inserted <- mkReg(0);
   Reg#(Bit#(1)) data_ready <- mkReg(0);
   
   rule rl_pipe(data_inserted == 1);
      data_out_reg <= data_in_reg;
      data_inserted <= 0;
      data_ready <= 1;
   endrule

   method Action put_data (Bit#(8) data_in) if (data_inserted == 0); 
      data_in_reg <= data_in;
      data_inserted <= 1;
   endmethod
   
   method ActionValue#(Bit#(8)) get_data() if (data_ready == 1);
      data_ready <= 0;
      return (data_out_reg);
   endmethod
   
endmodule

endpackage
