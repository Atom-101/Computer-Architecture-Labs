module dff_sync_clear(d, clearb, clock, q);
  input d, clearb, clock;
  output q;
  reg q;
  always @ (posedge clock)
    begin
      if (!clearb) q <= 1'b0;
      else q <= d;
    end
endmodule

module reg_32bit(q,d,clk,reset);
  input [31:0] d;
  input clk,reset;
  output [31:0] q;
  genvar i;
  generate
    for (i=0;i<32;i=i+1) begin: dff_loop
      dff_sync_clear dff(d[i],reset,clk,q[i]);
    end
  endgenerate
endmodule

module bit1_4to1mux(out,in,sel);
	input [3:0]in;
	input [1:0]sel;
	output out;
	
	assign out = sel[1]? (sel[0]? in[3]:in[2]) : (sel[0]? in[1]:in[0]);
endmodule

module bit32_4to1mux(regData,q1,q2,q3,q4,reg_no);
	input [31:0] q1,q2,q3,q4;
	output [31:0] regData;
	input [1:0] reg_no;
	
	genvar i;
    generate
    for (i=0;i<32;i=i+1) begin: mux_loop
      bit1_4to1mux m(regData[i],{q4[i],q3[i],q2[i],q1[i]},reg_no);
    end
    endgenerate
endmodule
