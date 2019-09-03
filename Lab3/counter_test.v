`include "task1.v"

module counter_test;
	reg clk;
	wire q0,q1,q2,q3;
	counter_4 counter(clk,q0,q1,q2,q3);
	always @(posedge clk)
		begin
			$display($time,"    %b %b %b %b",q0,q1,q2,q3);
		end
	
	
	initial begin
		forever begin
			clk=0;
			#5
			clk=1;
			#5
			clk=0;
		end
	end
	
	initial 
		begin
			#150 $finish;
		end 
	endmodule
	