package simple_detector_testbench;

import simple_detector :: * ;


module mk_simple_detector_testbench(Empty);

Ifc_simple_detector simple_detect <- mk_simple_detector;

    Reg#(Bool) rg_tb_init <- mkReg(False);
    Reg#(Bit#(32)) rg_pattern <- mkReg(32'd2);
    Reg#(Bit#(32)) rg_count <- mkReg(32'd1);

    rule send_data_in(!rg_tb_init);
        rg_count <= rg_count + 1;
        rg_pattern <= rg_pattern << 1;
        $display("1. Sending the input pattern to design for the iteration %0d", rg_count);
        simple_detect.ma_put_data_fa(rg_pattern);
        rg_tb_init <= True;
    endrule

    rule recieve_data;
        let pattern_got <- simple_detect.pattern_detected();
        if (pattern_got) $display("4. got pattern? yes");
        if (!pattern_got) $display("4. got pattern? no");

        rg_tb_init <= False;
        if (rg_count == 32'd4) $finish;
    endrule 

endmodule

endpackage 

