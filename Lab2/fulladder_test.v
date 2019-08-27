`include "adder_subtractor.v"
module fulladder_test;
	reg a,b,cin;
	wire s,cout;
	adder_subtractor fa(a,b,cin,s,cout);
	initial
		begin
			$monitor(," %b + %b , %b = %b , %b",a,b,cin,s,cout);
			#0 a=1'b0; b=1'b0; cin=1'b0;
			#2 a=1'b0; b=1'b0; cin=1'b1;
			#2 a=1'b0; b=1'b1; cin=1'b0;
			#2 a=1'b0; b=1'b1; cin=1'b1;
			#2 a=1'b1; b=1'b0; cin=1'b0;
			#2 a=1'b1; b=1'b0; cin=1'b1;
			#2 a=1'b1; b=1'b1; cin=1'b0;
			#2 a=1'b1; b=1'b1; cin=1'b1;
			#100 $finish;
		end
endmodule