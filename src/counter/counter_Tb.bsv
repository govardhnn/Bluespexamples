package counter_Tb;

(*synthesize*)
module mkCount_TB(Empty);

   Ifc_Counter count <- mkCounter;
   
   //Reg#(Int#(32)) initial_value <- mkReg(10);
   Reg#(Bit#(32)) initial_value <- mkReg(10);
      
   rule send_initial_value;
      count.start_count(initial_value);
      $display("counting has started, initial value: %0d", initial_value);
   endrule
      
   rule get_counter_values;
      let received_count = count.counter_value();
      $display("counter value: %0d from testbench", received_count);
   endrule
   
endmodule

interface Ifc_Counter;

   method Action start_count (Bit#(32) initial_value);
   method ActionValue #(Bit#(32)) counter_value();
   
endinterface


(*synthesize*)
module mkCounter(Ifc_Counter);

   Reg#(Bit#(32)) x <- mkReg(0);
   Reg#(Bool) start <- mkReg(False);
   
   // ----------------------------------------------------   
   rule count_up (x < 30 && start == True);
      let y = x + 1;
      x <= x + 1;
      $display("x = %0d, y = %0d", x, y);
   endrule
   
   rule done (x >= 30);
      $display("counting has finished at: %0d", x);
      $finish(0);
   endrule
   
   // ----------------------------------------------------
   method Action start_count (Bit#(32) initial_value);
      start <= True;
      x <= initial_value;
   endmethod
   
   method ActionValue#(Bit#(32)) counter_value();
      $display("counter value: %0d from design", x);
      return (x);
   endmethod

endmodule: mkCounter

endpackage: counter_Tb
