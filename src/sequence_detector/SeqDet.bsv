package SeqDet;

import SeqDetTypes :: *;
import FIFOF :: *;
import ClientServer :: *;
import GetPut :: *;

typedef enum {INIT, START_CHECK, CHECK_PAT, CHECK_DATA_LIM, FINISH} SeqDetState deriving (Bits, Eq, FShow);


module mkSeqDet (SeqDetIfc);

   FIFOF #(MAddr) f_mreq <- mkFIFOF;
   FIFOF #(MData) f_mrsp <- mkFIFOF;

   Reg #(RspType) r_rsp <- mkReg (tagged Invalid);
   Reg#(SeqDetState) rg_seq_state <- mkReg(INIT);

   Reg#(Bit#(8)) rg_pattern <- mkReg(0);     

   Reg#(MAddr) rg_start_address <- mkReg(0);
   Reg#(MData) rg_data_hold <- mkReg(0);
   
   Reg#(int) rg_pattern_counter <- mkReg(0);

   rule rl_fetch_mem (rg_seq_state == START_CHECK);
$display("2. Entered rl_fetch_mem");
      if(rg_start_address == 8) begin
	 $display("2. rl_start_check: address is 8 - limit reached, finishing");
	 rg_seq_state <= FINISH;
      end
      else begin
	 f_mreq.enq (rg_start_address);          
	 $display("2. rl_start_check: checking data %0h with pattern: %0h", f_mrsp.first, rg_pattern);
	 rg_seq_state <= CHECK_PAT;
      end
   endrule

   rule rl_check_pattern (rg_seq_state == CHECK_PAT);
      rg_data_hold <= f_mrsp.first;
      if(rg_data_hold[7:0] == rg_pattern) begin
	 rg_pattern_counter <= rg_pattern_counter + 1;
	 $display("3. rl_check_pattern: pattern found, counter: %0d", rg_pattern_counter);
      end
      rg_seq_state <= CHECK_DATA_LIM;
   endrule

   rule rl_check_data_limit (rg_seq_state == CHECK_DATA_LIM);
        rg_data_hold <= rg_data_hold >> 4;

      if((rg_data_hold >> 4) == 0) begin
         $display("4. rg_check_data_limit: Line checked fully, checking next line");
	 rg_start_address <= rg_start_address + 1;
	 rg_seq_state <= START_CHECK;
      end
      else begin
	 rg_seq_state <= CHECK_PAT;
      end      
   endrule

//    rule rl_check_pattern (rg_seq_state == CHECK_PAT);
//       rg_data_hold <= f_mrsp.first;
//    endrule

   method Action request (ReqType req) if (rg_seq_state == INIT);
      $display ("1. ma request: request start address : %0h", req.addr);
      $display ("1. ma request: number of words: %0h", req.words);
      $display ("1. ma request: pattern to detect: %0h", req.pattern);
      rg_pattern <= req.pattern;
      rg_start_address <= req.addr;
      rg_seq_state <= START_CHECK;
   endmethod

   method ActionValue #(int) response if (rg_seq_state == FINISH);
      //r_rsp <= tagged Valid 1;
      return (rg_pattern_counter);
   endmethod 

   interface mem = toGPClient (f_mreq, f_mrsp);

endmodule

endpackage
