package simple_sequence_detector;

interface Ifc_seq_det;
    method Action send_data (Bit#(32) input_value);
    method ActionValue#(Bit#(32)) get_count;
endinterface

(*synthesize*)
module mk_simple_sequence_detector(Ifc_seq_det);

    Reg#(Bool) rg_initialized <- mkReg(False);
    Reg#(Bool) rg_check_done <- mkReg(False);

    Reg#(Bit#(32)) rg_in_data <- mkReg(0);
    Reg#(Bit#(4)) rg_pattern_check <- mkReg(4'b1010);
    Reg#(Bit#(4)) rg_buffer <- mkReg(0);
    Reg#(Bit#(32)) rg_count <- mkReg(0);

    rule count (rg_initialized == True && rg_check_done == False);
        while (rg_in_data > 0) begin
            if (rg_pattern_check == rg_in_data[31:28]) begin
                rg_count <= rg_count + 1;
            end
            rg_in_data <= rg_in_data >> 1;
        end
        if(rg_in_data == 0) rg_check_done <= True;
    endrule

    method ActionValue#(Bit#(32)) send_data (Bit#(32) input_value) if (rg_initialized == False && rg_check_done == False);
        rg_in_data <= input_value;
        rg_initialized <= True;
        return;
    endmethod

    method ActionValue#(Bit#(32)) get_count if (rg_initialized == True && rg_check_done == True);
        rg_initialized <= False;
        rg_check_done <= False;
        return rg_count;
    endmethod

endmodule

endpackage