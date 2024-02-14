`timescale 1ns / 1ps
module tb ();

   logic    [3:0] a;
   logic 	[3:0] b;
   logic 	cin;
   logic 	[4:0] sum, Sum_correct;
   logic    clk;   
   
  // instantiate device under test
   SillyFullAdder dut (a, b, cin, sum);
 ////////////////////////////////////////////////////////////////////
   // 20 ns clock9
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end
    
	integer handle3;
	integer desc3;
	integer i;

	initial
		begin
			handle3 = $fopen("rca.out");
			desc3 = handle3;
			#5000 $finish;
		end

	initial
	begin
		for (i=0; i < 150; i=i+1)
		begin
		// Put vectors before beginning of clk
			@(posedge clk)
			begin
				a = $random;
				b = $random;
				cin = $random;
				assign Sum_correct = a + b + cin;
			end
			@(negedge clk)
			begin
				$fdisplay(desc3, "%b %b %b || %b | %b | %b", a, b, cin, sum, Sum_correct, (sum == Sum_correct));
			end
		end // @(negedge clk)
	end

   
endmodule
