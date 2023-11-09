/* 
Govardhan's Sequence Detector Assignment - BSV Workshop - InCore Semiconductors, Chennai

TODO: use typedef enum to simplify the FSM logic
TODO: Start addr to be used uin the memory
TODO: Remove the redundant new head in tuple3 - not required
TODO: remove the redundant prev_head register in the module passed into the function
TODO; Testbench's last iteration of total count will not be added into the register since it will exit the loop - Make a new rule for printing and checking if the r_numrsp is < 8
*/


package SeqDet;

import SeqDetTypes :: *;
import FIFOF :: *;
import ClientServer :: *;
import GetPut :: *;
import FShow :: *;

typedef enum {INIT, FETCH, DETECT, FINISH} SeqDetState deriving (Bits, Eq, FShow);

// To send back a 4bit value which store the last hex value back, and take it in again to check for patter around the borders: name them head_hex and tail_hex
// we will essentailly be comparing the old last hex of the line to the new head of the line to check if ti matches the pattern

function Tuple3#(Int#(32), Bit#(4), Bit#(4)) f1(MData data_line, Bit#(8) pattern, Bit#(4) prev_head, Bit#(4) prev_tail);
  // $display("");
   int i = 0;
   Bit#(4) new_head = data_line[255:252];
   Bit#(4) new_tail = data_line[3:0];

   if(prev_tail == pattern[7:4] && new_head == pattern[3:0]) i = i + 1;

   while (data_line > 0) begin
      if (pattern == data_line[7:0]) begin
         i = i + 1;
      end
      data_line = data_line >> 4;
   end 
   return(tuple3(i, new_head, new_tail));
endfunction

(*synthesize*)
module mkSeqDet (SeqDetIfc);

   Reg#(SeqDetState) rg_state <- mkReg(INIT);

   FIFOF #(MAddr) f_mreq <- mkFIFOF;
   FIFOF #(MData) f_mrsp <- mkFIFOF;

   Reg#(RspType) r_rsp <- mkReg (tagged Invalid);

   Reg#(Bit#(8)) rg_pattern <- mkReg(0);     

   Reg#(Bit#(4)) rg_data_prev_head <- mkReg(0);
   Reg#(Bit#(4)) rg_data_prev_tail <- mkReg(0);

   Reg#(MAddr) rg_start_address <- mkReg(0);
   Reg#(MData) rg_data_hold <- mkReg(0);
   
   Reg#(int) rg_pattern_counter <- mkReg(0);

   Reg#(Bool) rg_initial <- mkReg(False);
   Reg#(Bool) rg_sent_req <- mkReg(False);
   Reg#(Bool) rg_got_data <- mkReg(False);
   Reg#(Bool) rg_finished_detect <- mkReg(False);

   rule rl_send_req_to_mem (rg_initial && !rg_sent_req && !rg_got_data && !rg_finished_detect);
   // Rule to start the data fetch for a particular address
      $display("2. Entered the rule rl_send_req_to_mem");
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
         rg_got_data <= False;
         let lv_data_from_fn = f1(rg_data_hold, rg_pattern, rg_data_prev_head, rg_data_prev_tail);
         rg_pattern_counter <= tpl_1(lv_data_from_fn);
         rg_data_prev_head <= tpl_2(lv_data_from_fn);
         rg_data_prev_tail <= tpl_3(lv_data_from_fn);

         rg_finished_detect <= True;
      endrule

   method Action request (ReqType req) if (!rg_initial && !rg_sent_req && !rg_got_data && !rg_finished_detect);
      $display("1. SeqDet: request");
      $display("1. SeqDet: pattern is:", fshow(req.pattern));
      $display("1. SeqDet address is:", fshow(req.addr));
      $display("1. SeqDet words to start from are: ", fshow(req.words));
      // storing all the data into registers from the inputs of the interface
      rg_pattern <= req.pattern;
      rg_start_address <= req.addr;
      rg_pattern_counter <= 0;
      rg_initial <= True;
   endmethod

   method ActionValue #(int) response if (rg_initial && rg_sent_req && !rg_got_data && rg_finished_detect);
      $display("3. MAV response, data is: ", fshow(rg_data_hold));
      rg_initial <= False;
      rg_sent_req <= False;
      rg_finished_detect <= False;
      return(rg_pattern_counter);
   endmethod 

   interface mem = toGPClient (f_mreq, f_mrsp);

endmodule

endpackage
