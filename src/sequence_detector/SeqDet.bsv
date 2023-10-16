// A place holder for the sequence detector to satisfy compilation.
// Doesn't do anything.
package SeqDet;
        import SeqDetTypes :: *;
        import FIFOF :: *;
        import ClientServer :: *;
        import GetPut :: *;
        
        module mkSeqDet (SeqDetIfc);
                FIFOF #(MAddr) f_mreq <- mkFIFOF;
                FIFOF #(MData) f_mrsp <- mkFIFOF;
                Reg #(RspType) r_rsp <- mkReg (tagged Invalid);
                method Action request (ReqType req);
                        noAction;
                endmethod
                method ActionValue #(RspType) response;
                        r_rsp <= tagged Invalid;
                        return (r_rsp);
                endmethod 
                interface mem = toGPClient (f_mreq, f_mrsp);
        endmodule
endpackage