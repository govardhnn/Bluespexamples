package simple_multiplier_testbench;
  
import simple_multiplier :: *;

(*synthesize*)
module mk_simple_multiplier_testbench(Empty);


   Ifc_multiplier  multiplier <- mk_simple_multiplier;

   Reg#(Bit#(8)) rg_x <- mkReg(7);
   Reg#(Bit#(8)) rg_y <- mkReg(1);   
   Reg#(Bit#(8)) rg_vals_sent <- mkReg(0);

   rule request(rg_vals_sent == 0);
      multiplier.ma_do_multiply(rg_x, rg_y);
      $display("==================================>>>");
      $display("1. -> Sending the values rg_x: %0d and rg_y :%0d", rg_x, rg_y);
   endrule
   
   rule finish_multiply;
      let rsp <- multiplier.mav_get_rsp ();
      $display("6. -> Got product at Testbench: %0d", rsp);
      $display("<<<==================================");  
      $finish();
   endrule

    rule send_back;
        //if(rsp < 500) $display ("rsp < 500");
    endrule
endmodule

endpackage
