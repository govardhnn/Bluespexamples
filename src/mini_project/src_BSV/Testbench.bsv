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

        Reg #(Bit#(2)) r_numreq <- mkReg (0);
        Reg #(Bit#(2)) r_numrsp <- mkReg (0);
        SeqDetIfc seqdet <- mkSeqDet;
        Mem_IFC mem <- mkMem;

        rule rl_req (r_numreq < 2);
                let req = ReqType {
                        addr: extend (r_numreq << 2)
                      , words: 4
                      , pattern: 8'h43 };
                seqdet.request (req);   // implicit condition here!
                r_numreq <= r_numreq + 1;
                $display ("(%05d) rl_req::", cur_cycle, fshow (req));
        endrule

        rule rl_rsp (r_numrsp < 2);
                r_numrsp <= r_numrsp + 1;
                let r <- seqdet.response(); // implicit condition here!
                $display ("(%05d)           rl_rsp::", cur_cycle, fshow (r));
                if (r_numrsp == 1) $finish();
        endrule

        // Connect the memory interface to the sequence detector
        mkConnection (seqdet.mem, mem);
endmodule
