package Fibonacci_Server;

/*****************************************************************************
 Examples of Fibonnaci Servers
 =============================
 Simon Moore, January 2010
 *****************************************************************************/

import FIFO::*;
import GetPut::*;
import ClientServer::*;
import Vector::*;

/*****************************************************************************
 Iterative Fib Server
 *****************************************************************************/

// specialisation of Server interface for Fib
typedef Server#(UInt#(width), UInt#(TMul#(width,4)))
   FibServerT#(numeric type width);

module mkFibServer(FibServerT#(width))

  provisos (Add#(a__, width, TMul#(width, 4)));

  Reg#(UInt#(TMul#(width,4)))            a <- mkRegU;
  Reg#(UInt#(TMul#(width,4)))            b <- mkRegU;
  Reg#(UInt#(TMul#(width,4)))            j <- mkRegU;
  Reg#(Bool)                        active <- mkReg(False);
  FIFO#(UInt#(TMul#(width,4))) result_fifo <- mkLFIFO;
   
  rule loop (active && (j>1));
    a <= a+b;
    b <= a;
    j <= j-1;
  endrule
   
  rule the_end (active && (j==1));
    result_fifo.enq(a);
    active <= False;
  endrule
   
  rule n_is_zero (active && (j==0));
    result_fifo.enq(0);
    active <= False;
  endrule
   
  interface Put request;
    method Action put(n) if (!active);
      j      <= extend(n);
      a      <= 1;
      b      <= 0;
      active <= True;
    endmethod
  endinterface
   
  interface response = toGet(result_fifo);

endmodule


// simple test code for the above  
module mkTestFibServer(Empty);
   
  FibServerT#(8)  fib    <- mkFibServer;
  Reg#(UInt#(8))  n      <- mkReg(0);
  FIFO#(UInt#(8)) inputs <- mkSizedFIFO(4);
   
  rule loop (n <= 20);
    n <= n+1;
    fib.request.put(n);
    inputs.enq(n);
  endrule
   
  rule display_results;
    let r <- fib.response.get();
    inputs.deq;
    $display("%05t: result of fib(%2d)=%d",
       $time, inputs.first, r);
  endrule
   
endmodule


/*****************************************************************************
 Recursive and iterative functions for Fib used in static elaboration
 *****************************************************************************/

function Integer fib_func(Integer n);
  if(n<2) return n;
     else return fib_func(n-1)+fib_func(n-2);
endfunction

function Integer fib_func_iterative(Integer n);
  if(n<2) return n;
  else 
    begin
      Integer a=1;
      Integer b=1;
      for(Integer j=2; j<n; j=j+1)
        begin
	  a=a+b;
	  b=a-b;
        end
      return a;
    end
endfunction

module mkTestFibFunc(Empty);
   
  rule do_fib;
    $display("Output fib results on one cycle");
    for(Integer n=0; n<10; n=n+1)
      begin
        Integer f = fib_func(n);
        $display("%05t: result of fib(%1d)=%d",
		 $time, n, fromInteger(f));
	 end
      $finish();
  endrule

endmodule


/*****************************************************************************
 Fib in ROM
 ==========
 
 Fib. numbers stored in ROMs generated during static elaboration
 (i.e. at compile time).  Arrays and vectors are demonstrated.
 *****************************************************************************/

module mkFibServerROM(FibServerT#(width))
  provisos (Add#(width,TMul#(width,3),TMul#(width,4)));
  
  FIFO#(UInt#(TMul#(width,4))) result_fifo <- mkLFIFO;
  
  UInt#(width) index=0;
  UInt#(TMul#(width,4)) rom[valueOf(TExp#(width))];
  for(Integer n=0; inLiteralRange(index,n); n=n+1)
    rom[fromInteger(n)] = fromInteger(fib_func(n));
   
  interface Put request;
    method Action put(n);
      result_fifo.enq(rom[n]);
    endmethod
  endinterface
   
  interface response = toGet(result_fifo);
   
endmodule


module mkFibServerROMvectors(FibServerT#(width))
  provisos (Add#(width,TMul#(width,3),TMul#(width,4)));
   
  Vector#(TExp#(width), Wire#(UInt#(TMul#(width,4)))) rom <- replicateM(mkBypassWire);
  FIFO#(UInt#(TMul#(width,4))) result_fifo <- mkLFIFO;
  UInt#(width) index=0;

  rule init_rom;
    for(Integer n=0; inLiteralRange(index,n); n=n+1)
      rom[fromInteger(n)] <= fromInteger(fib_func_iterative(n));
  endrule
   
  interface Put request;
    method Action put(n);
      result_fifo.enq(rom[n]);
    endmethod
  endinterface
   
  interface response = toGet(result_fifo);
   
endmodule



// make a test ROM
`define romwidth 4

module mkTestFibServerROM(Empty);
   
  FibServerT#(`romwidth)  fib    <- mkFibServerROM;
  Reg#(UInt#(`romwidth))  n      <- mkReg(1);
  FIFO#(UInt#(`romwidth)) inputs <- mkSizedFIFO(`romwidth);
   
  rule loop (n!=0);
    n <= n+1;
    fib.request.put(n);
    inputs.enq(n);
  endrule
   
  rule display_results;
    let r <- fib.response.get();
    inputs.deq;
    $display("%05t: result of fib(%2d)=%d",
       $time, inputs.first, r);
  endrule
   
endmodule


// make a synthesized version
(* synthesize *)
module mkFibServerROM4(FibServerT#(4));
  FibServerT#(4) fibserver <- mkFibServerROM;
  interface request = fibserver.request;
  interface response = fibserver.response;
endmodule

endpackage
