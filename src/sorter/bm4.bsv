package bm4;

import cae :: *;

// using enums now!!

typedef enum {INIT, STAGE_1, STAGE_2} RG_STAGE deriving (Bits, Eq);

interface Ifc_bm4;
   method Action ma_get_inputs (int in1, int in2, int in3, int in4);
   method ActionValue#(Tuple4#(int, int, int, int)) mav_return_output (); 
endinterface

(*synthesize*)
module mk_bm4(Ifc_bm4);

   Ifc_cae cae1 <- mk_cae();
   Ifc_cae cae2 <- mk_cae();
   Ifc_cae cae3 <- mk_cae();
   Ifc_cae cae4 <- mk_cae();
   Ifc_cae cae5 <- mk_cae();
   Ifc_cae cae6 <- mk_cae();

   Reg#(RG_STAGE) rg_stage <- mkReg(INIT);

   Reg#(int) rg_out1 <- mkReg(0);
   Reg#(int) rg_out2 <- mkReg(0);
   Reg#(int) rg_out3 <- mkReg(0);
   Reg#(int) rg_out4 <- mkReg(0);

   Reg#(int) rg_stage1_1 <- mkReg(0);
   Reg#(int) rg_stage1_2 <- mkReg(0);
   Reg#(int) rg_stage1_3 <- mkReg(0);
   Reg#(int) rg_stage1_4 <- mkReg(0);

   Reg#(int) rg_stage2_1 <- mkReg(0);
   Reg#(int) rg_stage2_2 <- mkReg(0);
   Reg#(int) rg_stage2_3 <- mkReg(0);
   Reg#(int) rg_stage2_4 <- mkReg(0);

   rule rl_stage_1(rg_stage == STAGE_1);
      let lv_get_sort_3 = cae3.mv_get_sort(rg_stage1_1, rg_stage1_4);
      let lv_get_sort_4 = cae4.mv_get_sort(rg_stage1_2, rg_stage1_3); 
      rg_stage2_1 <= tpl_1(lv_get_sort_3);
      rg_stage2_2 <= tpl_1(lv_get_sort_4);
      rg_stage2_3 <= tpl_2(lv_get_sort_4);
      rg_stage2_4 <= tpl_2(lv_get_sort_3);
      rg_stage <= STAGE_2;
   endrule

   method Action ma_get_inputs (int in1, int in2, int in3, int in4) if (rg_stage == INIT);
      let lv_get_sort_1 = cae1.mv_get_sort(in1, in2);
      let lv_get_sort_2 = cae2.mv_get_sort(in3, in4);    
      rg_stage1_1 <= tpl_1(lv_get_sort_1);
      rg_stage1_2 <= tpl_2(lv_get_sort_1);
      rg_stage1_3 <= tpl_1(lv_get_sort_2);
      rg_stage1_4 <= tpl_2(lv_get_sort_2);
      rg_stage <= STAGE_1;
   endmethod

   method ActionValue#(Tuple4#(int, int, int, int)) mav_return_output () if (rg_stage == STAGE_2); 
      let lv_get_sort_5 = cae5.mv_get_sort(rg_stage2_1, rg_stage2_2);
      let lv_get_sort_6 = cae6.mv_get_sort(rg_stage2_3, rg_stage2_4);
      rg_stage <= INIT;
      return (tuple4(tpl_1(lv_get_sort_5), tpl_2(lv_get_sort_5), tpl_1(lv_get_sort_6), tpl_2(lv_get_sort_6)));
   endmethod

endmodule
endpackage
