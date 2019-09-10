module mux2to1(out,sel,in1,in2);
 input in1,in2,sel;
 output out;
 wire not_sel,a1,a2;
 not (not_sel,sel);
 and (a1,sel,in2);
 and (a2,not_sel,in1);
 or(out,a1,a2);
endmodule

module bit8_2to1mux(out,sel,in1,in2);
 input [7:0] in1,in2;
 output [7:0] out;
 input sel;
 genvar j;
 generate for (j=0; j<8;j=j+1) begin: mux_loop
 mux2to1 m1(out[j],sel,in1[j],in2[j]);
end
endgenerate
endmodule

module bit32_2to1mux(out,sel,in1,in2);
  input [31:0] in1,in2;
  output [31:0] out;
  input sel;
  genvar i;
  generate
    for (i=0;i<32;i=i+8) begin: mux_loop
      bit8_2to1mux m(out[i+7:i],sel,in1[i+7:i],in2[i+7:i]);
    end
  endgenerate
endmodule
