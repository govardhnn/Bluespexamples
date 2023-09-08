package basic_pipeline_Tb;

import basic_pipeline :: *;

(* synthesize *)
module mkTestbench (Empty);
   
   Basic_IFC basic_pipeline <- mk_basic_pipeline;
   
   Reg#(Bit#(8)) data_in_tb <- mkReg(10);
   Reg#(Bit#(8)) counter <- mkReg(2);
   
   rule request_pipe(counter < 10);
      basic_pipeline.put_data(data_in_tb + counter);
      counter <= counter + 1;
   endrule
   
   rule response_pipe(counter == 10);
      let data_out_tb = basic_pipeline.get_data();
      $finish();
   endrule
   
endmodule

endpackage
