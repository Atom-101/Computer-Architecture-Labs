module jk(j,k,clk,q);
	input j,k;
	input clk;
	output reg q;
	initial begin q=1'b0; end
	always @ (posedge clk)
		begin	
			case({j,k})
				{1'b0,1'b0}:begin q=q; end
				{1'b0,1'b1}:begin q=1'b0; end
				{1'b0,1'b0}:begin q=1'b1; end
				{1'b0,1'b0}:begin q=~q; end
			endcase
		end
endmodule

module counter_4(clk,q0,q1,q2,q3);
	input clk;
	output q0,q1,q2,q3;
	wire q0q1,q0q1q2;
	
	jk jk_1(1'b1,1'b1,clk,q0);
	jk jk_2(q0,q0,clk,q1);
	and(q0q1,q0,q1);
	jk jk_3(q0q1,q0q1,clk,q2);
	and (q0q1q2,q2,q0q1);
	jk jk_4(q0q1q2,q0q1q2,clk,q3);	
endmodule	
