package mac_2x2;

import mac_1x1 :: *;

interface Ifc_mac_2x2;
   method Action ma_put_data (int i0, int i1, int j0, int j1);
   method ActionValue#(Tuple4#(int, int, int, int))mav_get_data;
endinterface

(*synthesize*)
module mk_mac_2x2(Ifc_mac_2x2);

    Ifc_mac_1x1 mac_1 <- mk_mac_1x1();
    Ifc_mac_1x1 mac_2 <- mk_mac_1x1();
    Ifc_mac_1x1 mac_3 <- mk_mac_1x1();
    Ifc_mac_1x1 mac_4 <- mk_mac_1x1();

    Reg#(int) rg_i1_in <- mkReg(0);
    Reg#(int) rg_j1_in <- mkReg(0);

    Reg#(int) rg_i0_internal <- mkReg(0);   
    Reg#(int) rg_j0_internal <- mkReg(0);

    Reg#(int) rg_i1_internal <- mkReg(0);   
    Reg#(int) rg_j1_internal <- mkReg(0);

    Reg#(int) rg_i0_final <- mkReg(0);
    Reg#(int) rg_j0_final <- mkReg(0);

    Reg#(int) rg_i1_final <- mkReg(0);
    Reg#(int) rg_j1_final <- mkReg(0);

    Reg#(Bool) rg_initialized <- mkReg(False);

    Reg#(Bool) stage1 <- mkReg(False);
    Reg#(Bool) stage2 <- mkReg(False);
    Reg#(Bool) stage3 <- mkReg(False);

    Reg#(Bool) rg_done <- mkReg(False);

    rule rl_recieve_stage1(rg_initialized && stage1 && !stage2 && !stage3 && !rg_done);
        $display("2. Stage 1");
        let lv_mac1_out <- mac_1.get_data();
        $display("2. got values from mac 1: %0d, %0d", tpl_1(lv_mac1_out), tpl_2(lv_mac1_out));
        rg_i0_internal <= tpl_1(lv_mac1_out);
        rg_j0_internal <= tpl_2(lv_mac1_out);
        mac_2.put_data(tpl_1(lv_mac1_out), rg_j1_in);
        mac_3.put_data(rg_i1_in, tpl_2(lv_mac1_out));
        stage2 <= True;
        stage1 <= False;
    endrule

    rule rl_recieve_stage2(rg_initialized && !stage1 && stage2 && !stage3 && !rg_done);
        $display("3. Stage 2");
        let lv_mac2_out <- mac_2.get_data();
        let lv_mac3_out <- mac_3.get_data();
        $display("3. got values from mac 2: %0d, %0d", tpl_1(lv_mac2_out), tpl_2(lv_mac2_out));
        $display("3. got values from mac 2: %0d, %0d", tpl_1(lv_mac3_out), tpl_2(lv_mac3_out));
        rg_i0_final <= tpl_1(lv_mac2_out);
        rg_j0_final <= tpl_2(lv_mac3_out);
        rg_i1_internal <= tpl_1(lv_mac3_out);
        rg_j1_internal <= tpl_2(lv_mac2_out);
        mac_4.put_data(tpl_1(lv_mac3_out), tpl_2(lv_mac2_out));
        stage2 <= False;
        stage3 <= True;
    endrule

    rule rl_recieve_stage3(rg_initialized && !stage1 && !stage2 && stage3 && !rg_done);
        $display("4. Stage 3");
        let lv_mac4_out <- mac_4.get_data();
        rg_i1_final <= tpl_1(lv_mac4_out);
        rg_j1_final <= tpl_2(lv_mac4_out);
        $display("4. got values from mac 4: %0d, %0d", tpl_1(lv_mac4_out), tpl_2(lv_mac4_out));
        rg_done <= True;
        stage3 <= False;
    endrule
    
    method Action ma_put_data (int i0, int i1, int j0, int j1) if (!rg_initialized && !stage1 && !stage2 && !stage3 && !rg_done);
        $display("1. In mac_2x2: ma_put_data");
        $display("i0 = %0d, i1 = %0d, j0 = %0d, j1 = %0d", i0, i1, j0, j1);
        mac_1.put_data(i0, j0);
        rg_i1_in <= i1;
        rg_j1_in <= j1;
        rg_initialized <= True;
        stage1 <= True;
    endmethod

    method ActionValue#(Tuple4#(int, int, int, int)) mav_get_data if (rg_initialized && !stage1 && !stage2 && !stage3 && rg_done);
        rg_done <= False;
        rg_initialized <= False;
        return(tuple4(rg_i0_final, rg_i1_final, rg_j0_final, rg_j1_final));
    endmethod

endmodule

endpackage : mac_2x2
