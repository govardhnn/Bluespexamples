package simple_detector;

interface Ifc_simple_detector;
   method Action ma_put_data_fa (Bit#(32) input_pattern);
   method ActionValue#(Bool) pattern_detected ();
endinterface

module mk_simple_detector(Ifc_simple_detector);

    Reg#(Bit#(32)) rg_input_pattern <- mkReg(0);
    Reg#(Bool) rg_initialized <- mkReg(False);
    Reg#(Bool) rg_input_recieved <- mkReg(False);

    method Action ma_put_data_fa (Bit#(32) input_pattern) if (!rg_initialized);
        rg_input_pattern <= input_pattern;
        $display("2. Got input: %0d", input_pattern);
        rg_initialized <= True;
    endmethod

    method ActionValue#(Bool) pattern_detected if (rg_initialized);
        $display("3. checking if its equal to %0d", 32'd4 );
                rg_initialized <= False;

        if(rg_input_pattern == 32'd4) begin
            return(True);
        end
        else begin 
            return (False);
        end

    endmethod

endmodule : mk_simple_detector


endpackage : simple_detector
