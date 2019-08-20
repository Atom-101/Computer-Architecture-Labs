/**
module mux2to1_beh(a,b,s,f); 
	input a,b,s; 
	output f; 
	reg f; 
	always@(s or a or b) 
		if(s==1) f = a; 
		else f = b; 
endmodule 


module testbench; 
	reg a,b,s; 
	wire f; 
	mux2to1_beh mux_beh (a,b,s,f); 
	initial 
		begin
			$monitor(,$time," a=%b, b=%b, s=%b f=%b",a,b,s,f); 
			#0 a=1'b0;b=1'b1; 
			#2 s=1'b1; 
			#5 s=1'b0; 
			#10 a=1'b1;b=1'b0; 
			#15 s=1'b1; 
			#20 s=1'b0;
			#100 $finish;
		end
endmodule
**/

module bcd2gray(a,b,c,d,w,x,y,z);
	input a,b,c,d;
	output w,x,y,z;
	wire a0,b0,c0,d0,bc,bd,a0b0c0d,bcd,ad0,b0cd0;
	
	not (a0,a);
	not (b0,b);
	not (c0,c);
	not (d0,d);
	
	and (bd,b,d);
	and (bc,b,c);
	
	or (w,a,bd,bc);
	and (x,b,c0);
	or (y,b,c);
	
	and (a0b0c0d, a0,b0,c0,d); and (bcd, b,c,d); and (ad0, a,d0); and (b0cd0, b0, c, d0);
	or (z,a0b0c0d,bcd,ad0,b0cd0);	
endmodule
	
	
module test;
	reg a,b,c,d;
	wire w,x,y,z;
	bcd2gray b2g (a,b,c,d,w,x,y,z);
	initial
		begin
			$monitor(," %b %b %b %b || %b %b %b %b",a,b,c,d,w,x,y,z);
			#0 a=1'b0; b=1'b0; c=1'b0; d=1'b0 ;
			#2 a=1'b0; b=1'b0; c=1'b0; d=1'b1 ;
			#2 a=1'b0; b=1'b0; c=1'b1; d=1'b0 ;
			#2 a=1'b0; b=1'b0; c=1'b1; d=1'b1 ;
			#2 a=1'b0; b=1'b1; c=1'b0; d=1'b0 ;
			#2 a=1'b0; b=1'b1; c=1'b0; d=1'b1 ;
			#2 a=1'b0; b=1'b1; c=1'b1; d=1'b0 ;
			#2 a=1'b0; b=1'b1; c=1'b1; d=1'b1 ;
			#2 a=1'b1; b=1'b0; c=1'b0; d=1'b0 ;
			#2 a=1'b1; b=1'b0; c=1'b0; d=1'b1 ;
			#100 $finish;
		end
endmodule
	
	
	

 
