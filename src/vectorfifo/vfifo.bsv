package vfifo;

import VectorFIFOF::*;
import Vector::*;
import FIFOF::*;

interface Ifc_vfifo;

    method Action vf_enqueue(Bit#(32) enq_val);

    method Bit#(32) vf_first_0;
    
    method Vector#(4, Maybe#(Bit#(32))) vf_first_all;

endinterface

module mk_vfifo(Ifc_vfifo);

    // The new vector of fifos with interfaces: 
    // vector which returns a Vector# 
    // and fifo which returns a FIFOF#
    VectorFIFOF#(4, Bit#(32)) vf_magic <- mkVectorFIFOF();

    method Action vf_enqueue(Bit#(32) enq_val);
        vf_magic.fifo.enq(enq_val);
        $display("ENQ: ", fshow(enq_val));
        $display("CONTENTS: ", fshow(vf_magic.vector));
        // $display("FIRST: ", fshow(vf_magic.fifo.first)); -- hangs
    endmethod
    method Bit#(32) vf_first_0;
        return(vf_magic.fifo.first);
    endmethod
    method Vector#(4, Maybe#(Bit#(32))) vf_first_all;
        return(vf_magic.vector);
    endmethod


endmodule

endpackage