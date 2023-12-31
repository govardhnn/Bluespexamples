package MAC;

// MAC module definition
module mkMAC #(int A_WIDTH, int B_WIDTH, int ACC_WIDTH)(MAC_IFC#(A_WIDTH, B_WIDTH, ACC_WIDTH));

    // Inputs
    interface [A_WIDTH-1:0] a;
    interface [B_WIDTH-1:0] b;
    // Output
    interface [ACC_WIDTH-1:0] acc;

    // Internal wire to store the multiplication result
    wire [A_WIDTH + B_WIDTH - 1:0] mult_result;

    // Multiplication logic
    rule multiply;
        mult_result <= a * b;
    endrule

    // Accumulation logic
    rule accumulate;
        acc <= acc + mult_result;
    endrule

endmodule
