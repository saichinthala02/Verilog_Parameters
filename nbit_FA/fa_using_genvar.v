//---> Implementation of Multi bit Full_Adder using parameter.
module fa(a,b,ci,s,co);
	input a,b,ci;
	output s,co;

	assign s=a^b^ci;
	assign co= a&b | b&ci | ci&a;

endmodule

module fa_multi_bit(a,b,ci,s,co);
	parameter SIZE=4;
	input [SIZE-1:0]a,b;
	input ci;
	output [SIZE-1:0]s;
	output [SIZE:0]co;
	assign co[0]=ci;
	
	genvar i;
	
	for(i=0;i<SIZE;i=i+1) begin
		fa fa1 (.a(a[i]),.b(b[i]),.ci(co[i]),.s(s[i]),.co(co[i+1]));
	end
	

endmodule
