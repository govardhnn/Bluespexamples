package simple_sequence_detector_testbench;

import simple_sequence_detector :: *;

(*synthesize*)
module mk_simple_sequence_detector_testbench(Empty);

    Reg#(Bit#(32)) rg_input <- mkReg(32'b01100011001010100010010100010);

    Ifc_seq_det seqdet <- mk_simple_sequence_detector;

    rule rl_send;        
        $display("sending data = %5d", rg_input);
        $finish;
        seqdet.send_data(rg_input);
      
    endrule

    rule rl_get_count;
        let lv_count = seqdet.get_count();
        $display("count = %5d", lv_count);
        $finish;
    endrule

endmodule

endpackage