package SeqDet;

import SeqDetTypes :: *;
import FIFOF :: *;
import ClientServer :: *;
import GetPut :: *;

//typedef enum {INIT, START_CHECK, FINISH} SeqDetState deriving (Bits, Eq, FShow);


module mkSeqDet (SeqDetIfc);

   FIFOF #(MAddr) f_mreq <- mkFIFOF;
   FIFOF #(MData) f_mrsp <- mkFIFOF;

   Reg#(RspType) r_rsp <- mkReg (tagged Invalid);
   //Reg#(SeqDetState) rg_seq_state <- mkReg(INIT);

   Reg#(Bit#(8)) rg_pattern <- mkReg(0);     

   Reg#(MAddr) rg_start_address <- mkReg(0);
   Reg#(MData) rg_data_hold <- mkReg(0);
   
   Reg#(int) rg_pattern_counter <- mkReg(0);

   Reg#(Bool) rg_initial <- mkReg(False);
   Reg#(Bool) rg_got_data <- mkReg(False);

   rule rl_get_data_from_mem (rg_initial && !rg_got_data);
      // Rule to start the data fetch for a particular address
      $display("2. Entered the rule rl_get_data_from_mem");
      $display("2. Fetch data from memory for the given address");
      f_mreq.enq(rg_start_address);
      let data_fetched = f_mrsp.first;
      rg_data_hold <= data_fetched;
      // need to increment the rg_start_address here

      rg_pattern_counter <= rg_pattern_counter + 1;
      rg_got_data <= True;
   endrule

   method Action request (ReqType req) if (!rg_initial && !rg_got_data );
      $display("1. SeqDet: request");
      $display("1. SeqDet: pattern is: %d, address to start from: %d and words: %0d", req.pattern, req.addr, req.words);
      // storing all the data into registers from the inputs of the interface
      rg_pattern <= req.pattern;
      rg_start_address <= req.addr;
      rg_pattern_counter <= 0;
      rg_initial <= True;
   endmethod

   method ActionValue #(int) response if (rg_initial && rg_got_data);
      $display("3. MAV response, data is: %d", rg_data_hold);
      rg_initial <= False;
      rg_got_data <= False;
      return(rg_pattern_counter);
   endmethod 

   interface mem = toGPClient (f_mreq, f_mrsp);

endmodule

endpackage
