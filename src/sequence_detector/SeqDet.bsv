package SeqDet;

import SeqDetTypes :: *;
import FIFOF :: *;
import ClientServer :: *;
import GetPut :: *;
import FShow :: *;
//typedef enum {INIT, START_CHECK, FINISH} SeqDetState deriving (Bits, Eq, FShow);

// To send back a 4bit value which store the last hex value back, and take it in again to check for patter around the borders: name them head_hex and tail_hex

function Int#(32) f1(MData x);
   x=x-9;
   return(68);
endfunction

module mkSeqDet (SeqDetIfc);

   FIFOF #(MAddr) f_mreq <- mkFIFOF;
   FIFOF #(MData) f_mrsp <- mkFIFOF;

   Reg#(RspType) r_rsp <- mkReg (tagged Invalid);
   //Reg#(SeqDetState) rg_seq_state <- mkReg(INIT);

   Reg#(Bit#(8)) rg_pattern <- mkReg(0);     

   Reg#(MAddr) rg_start_address <- mkReg(0);
   Reg#(MData) rg_data_hold <- mkReg(0);
   
   Reg#(int) rg_pattern_counter <- mkReg(0);

   Reg#(int) rg_counts <- mkReg(0);
   Reg#(Bool) rg_initial <- mkReg(False);
   Reg#(Bool) rg_sent_req <- mkReg(False);

   Reg#(Bool) rg_got_data <- mkReg(False);

   Reg#(Bool) rg_finished_detect <- mkReg(False);

   rule rl_send_req_to_mem (rg_initial && !rg_sent_req && !rg_got_data && !rg_finished_detect);
      // Rule to start the data fetch for a particular address
      $display("2. Entered the rule rl_get_data_from_mem");
      $display("2. Fetch data from memory for the given address %0d", rg_start_address);
      f_mreq.enq(rg_start_address);
      //let data_fetched = f_mrsp.first;
      rg_sent_req <= True;
      //rg_got_data <= True;
   endrule

      rule rl_get_data_from_mem (rg_initial && rg_sent_req && !rg_got_data && !rg_finished_detect);
         // Using the interface mem GP client to send and recieve the data from the memory (Mem_Contents.hex)
         
         $display("2.5 Entered the rule rl_get_data_from_mem ", fshow(f_mrsp.first));
         rg_data_hold <= f_mrsp.first;
         f_mrsp.deq;
         rg_got_data <= True;
      endrule

      rule rl_detector (rg_initial && rg_sent_req && rg_got_data && !rg_finished_detect);
         $display("3. Entered the rule rl_detector");
         rg_finished_detect <= True;
         rg_got_data <= False;
         rg_pattern_counter <= f1(rg_data_hold);
         //$display(" Sending data and %d and pattern %0d to function", f1(rg_data_hold));
         let lv_rg_counts = f1(rg_data_hold);
         //let lv_rg_counts = fn_pattern_detector(rg_data_hold, rg_pattern);
      endrule

     
      // function int fn_pattern_detector(int data, int pattern);
      //    $display("3.1 Entered the function fn_pattern_detector");
      //    //let lv_rg_hold = rg_pattern;
      //    return(10);
      // endfunction
/*
rg_got_data and then process the data for the pattern


rg_got_data < False
rg_finished_detect <= True;
*/

   method Action request (ReqType req) if (!rg_initial && !rg_sent_req && !rg_got_data && !rg_finished_detect);
      $display("1. SeqDet: request");
      $display("1. SeqDet: pattern is: %d, address to start from: %d and words: %0d", req.pattern, req.addr, req.words);
      // storing all the data into registers from the inputs of the interface
      rg_pattern <= req.pattern;
      rg_start_address <= req.addr;
      rg_pattern_counter <= 0;
      rg_initial <= True;
   endmethod

   method ActionValue #(int) response if (rg_initial && rg_sent_req && !rg_got_data && rg_finished_detect);
      $display("3. MAV response, data is: %d", rg_data_hold);
      
      //rg_data_hold <= data_fetched;
      // need to increment the rg_start_address here

      // in pattern detector rule: rg_pattern_counter <= rg_pattern_counter + 1;
      rg_initial <= False;
      //rg_got_data <= False;
      rg_sent_req <= False;
      rg_finished_detect <= False;
      return(rg_pattern_counter);
   endmethod 

   interface mem = toGPClient (f_mreq, f_mrsp);

endmodule

endpackage
