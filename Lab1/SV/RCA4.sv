module RCA4 (input  logic[3:0] a, b, input logic cin, output logic [4:0] sum);
   output logic cout[1], cout[2], cout[3];
   
  silly(a[0], b[0], cin, s[0], cout[1]);
  silly(a[1], b[1], cout[1], s[1], cout[2]);
  silly(a[2], b[2], cout[2], s[2], cout[3]);
  silly(a[3], b[3], cout[3], s[3], s[4]);
  
endmodule
