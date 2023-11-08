// Top-level for sequence detector
// The sequence detector is assumed to be in the package SeqDet
// 
//
import FIFOF :: *;
import Utils :: *;          // for cur_cycle and friends
import SeqDet:: *;          // the design
import SeqDetTypes :: *;    // all type defs reside here
import Mem :: *;            // for the memory
import Connectable :: *;

(* synthesize *)
module mkTestbench (Empty);

   Reg #(Bit#(4)) r_numreq <- mkReg (0);
   Reg #(Bit#(4)) r_numrsp <- mkReg (0);
   Reg#(Bool) rg_start <- mkReg (False);

   SeqDetIfc seqdet <- mkSeqDet;
   Mem_IFC mem <- mkMem;

   rule rl_req (!rg_start);
      let req = ReqType {
			 addr: extend(r_numreq << 2)
			 , words: 4
			 , pattern: 8'h43 };
      $display("======================================");
      $display ("TB Sending rl_req:: %0d ", cur_cycle, fshow (req));
      seqdet.request (req);   // implicit condition here!
      r_numreq <= r_numreq + 1;
      rg_start <= True;
   endrule

   rule rl_rsp (rg_start);
      r_numrsp <= r_numrsp + 1;
      let r <- seqdet.response(); // implicit condition here!
      $display ("TB Recieving rl_rsp:: %0d ", cur_cycle, r);
      $display ("No of times the pattern was detected: %0d", r);
      $display("======================================");
      if (r_numrsp == 2) $finish();
      rg_start <= False;
   endrule

   // Connect the memory interface to the sequence detector
   mkConnection (seqdet.mem, mem);
endmodule
