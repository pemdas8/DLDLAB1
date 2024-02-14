module silly (input  logic a, b, c, output logic sum, cout);
   
  assign cout = (~a & b & c) | (a & ~b & c) | (a & b & ~c) | (a & b & c);
  assign sum = (~a & ~b & c) | (~a & b & ~c) | (a & ~b & ~c) | (a & b & c);
   
endmodule

module SillyFullAdder (input  logic[3:0] a, b, input logic cin, output logic [4:0] sum);
  
  logic [2:0] cout;
  
  silly fa0 (a[0], b[0], cin, sum[0], cout[0]);
  silly fa1 (a[1], b[1], cout[0], sum[1], cout[1]);
  silly fa2 (a[2], b[2], cout[1], sum[2], cout[2]);
  silly fa3 (a[3], b[3], cout[2], sum[3], sum[4]);
  
endmodule
