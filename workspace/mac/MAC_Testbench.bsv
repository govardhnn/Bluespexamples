package MAC_Testbench;

// Importing the Bluespec library
import BSV::*;

// MAC testbench module definition
module mkMAC_Testbench;

    // Instantiate MAC module with specific bit widths
    MAC_IFC#(8, 8, 16) mac_inst <- mkMAC;

    // Set up the test
    Reg#(Bit#(8)) a_reg <- mkReg(0);
    Reg#(Bit#(8)) b_reg <- mkReg(0);
    Reg#(Bit#(16)) acc_reg <- mkReg(0);

    // Initialize values
    a_reg <= 5;
    b_reg <= 10;
    acc_reg <= 0;

    // Apply inputs to MAC module
    rule apply_inputs;
        mac_inst.a <= a_reg;
        mac_inst.b <= b_reg;
        mac_inst.acc <= acc_reg;
    endrule

    // Run the multiplication and accumulation
    rule run_mac;
        mac_inst.multiply;
        mac_inst.accumulate;
    endrule

    // Display the result
    rule display_result;
        $display("a: %0d, b: %0d, acc: %0d", a_reg, b_reg, mac_inst.acc);
    endrule

endmodule
