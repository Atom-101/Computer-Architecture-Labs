module adder_subtractor (a,b,cin,s,cout);
	input a,b,cin;
	output reg s,cout;
	
	always@ (a or b or cin)
	begin
		if(a==0 && b==0)
		begin
			s=cin;
			cout=0;
		end
		if(a ^ b==1)
		begin
			s=!cin;
			cout=cin;
		end
		if(a==1 && b==1)
		begin
			s=cin;
			cout=1;
		end
	end
endmodule
