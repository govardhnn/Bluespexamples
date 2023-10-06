package full_adder;

interface Ifc_fadder;

endinterface

import half_adder :: * ;
/*
using two half adders and an or gate to make a full adder

inputs: A, B. Carry_in
outputs: Sum, Carry_out

Sum = A ^ B ^ Carry_in
Carry_out = A*B + Carry_in(A^B);

First Half Adder: 
   inputs:  A, B
   outputs: Sum_1 (A^B) and Carry_1 (A*B)

Second Half Adder:
   inputs: Sum of First Half Adder and Carry_in
   outputs: Sum_2 (A^B^Carry_in), Carry_2((A^B)*Carry_in)

Carry_out = Carry_1 + Carry_2 = (A*B) + (A^B)*Carry_in

*/

(*synthesize*)
module mk_full_adder (Ifc_fadder);

half_adder ha_1 <- mk_half_adder(0, 0);


endmodule: mk_full_adder

endpackage: full_adder