// Copyright (c) 2018 Bluespec, Inc.  All Rights Reserved

package Mem;

// ================================================================
// BSV library imports

import FIFOF        :: *;
import GetPut       :: *;
import ClientServer :: *;
import RegFile      :: *;

// ================================================================
// Project imports

import SeqDetTypes  :: *;

// ================================================================
// This memory is implemented as a RegFile that is pre-loaded (at
// start of simulation) from a MemHex file.

// It'll work in simulation only (Bluesim or Verilog sim)
// since loading from memhex files is only supported in simulation.

// The RegFile (and the MemHex loaded data) can be very large (MB or GB in size).

// Note: in Verilog, a MemHex file is of a specific width, i.e., each
// line represents one address in the file.  Thus, a 1-byte-wide
// MemHex file and a 2-byte-wide MemHex file are different, even if
// they are for memories of the same total byte size.
// The former will have twice the number of entries as the latter.
// In the former, each entry is 1 byte; in the latter, each entry is 2 bytes.

// This example uses a 1-byte-wide memory and MemHex file.

// ================================================================
// INTERFACE

typedef  Server #(MAddr, MData)  Mem_IFC;

// ================================================================
// IMPLEMENTATION

module mkMem (Mem_IFC);

   FIFOF #(MAddr) f_memreqs <- mkFIFOF;
   FIFOF #(MData) f_memrsps <- mkFIFOF;

   RegFile #(MAddr, MData) regfile <- mkRegFileLoad("/home/govardhan/Desktop/Bluespexamples/src/sequence_detector/Mem_Contents.hex",0,15);
   


   // ----------------------------------------------------------------
   // BEHAVIOR

   rule rl_process_reqs;

      let memreq = f_memreqs.first;
      f_memreqs.deq;
      let x = regfile.sub (memreq);
      f_memrsps.enq (x);
   endrule

   // ----------------------------------------------------------------
   // INTERFACE

   interface Put request  = toPut (f_memreqs);
   interface Get response = toGet (f_memrsps);

endmodule

// ================================================================

endpackage