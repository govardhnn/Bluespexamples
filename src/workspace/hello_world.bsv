package hello_world;

(*synthesize*)

module mkTB (Empty);
   rule greet;
      $display ("Hello World");    
      $finish (0);
   endrule

endmodule

endpackage: hello_world
