//--> Implementation of Test bench.

`include "fa_using_genvar.v"
module top;
	parameter SIZE=8;
	reg [SIZE-1:0]a,b;
	reg ci;
	wire [SIZE-1:0]s;
	wire [SIZE:0]co;
	

	fa_multi_bit #(SIZE)dut(a,b,ci,s,co);


	initial begin
		$display("--------------------------------------------------------------------");
		$display("--------------> Implementation of %0d_Bit Full Adder <--------------",SIZE);
		$display("--------------------------------------------------------------------");
		repeat(10) begin
			{a,b}=$random;
			ci=1'b0;
			#2 $display("a:- %b  b:- %b ci:- %b  || Sum:- %b  Carry:- %b",a,b,ci,s,co[SIZE]);
		end
		$display("--------------------------------------------------------------------");
	end
endmodule

/* Output
# Start time: 11:18:22 on Sep 29,2025
# Loading work.top
# Loading work.fa_multi_bit
# Loading work.fa
# --------------------------------------------------------------------
# --------------> Implementation of 8_Bit Full Adder <--------------
# --------------------------------------------------------------------
# a:- 00110101  b:- 00100100 ci:- 0  || Sum:- 01011001  Carry:- 0
# a:- 01011110  b:- 10000001 ci:- 0  || Sum:- 11011111  Carry:- 0
# a:- 11010110  b:- 00001001 ci:- 0  || Sum:- 11011111  Carry:- 0
# a:- 01010110  b:- 01100011 ci:- 0  || Sum:- 10111001  Carry:- 0
# a:- 01111011  b:- 00001101 ci:- 0  || Sum:- 10001000  Carry:- 0
# a:- 10011001  b:- 10001101 ci:- 0  || Sum:- 00100110  Carry:- 1
# a:- 10000100  b:- 01100101 ci:- 0  || Sum:- 11101001  Carry:- 0
# a:- 01010010  b:- 00010010 ci:- 0  || Sum:- 01100100  Carry:- 0
# a:- 11100011  b:- 00000001 ci:- 0  || Sum:- 11100100  Carry:- 0
# a:- 11001101  b:- 00001101 ci:- 0  || Sum:- 11011010  Carry:- 0
# --------------------------------------------------------------------
*/
