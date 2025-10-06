//--> Implementation of ALU using Parameter.

module top;
	parameter ADD = 4'b0000;
	parameter SUB = 4'b0001;
	parameter MUL = 4'b0010;
	parameter DIV = 4'b0011;
	parameter MOD = 4'b0100;
	parameter POWER = 4'b0101;
	parameter RSHIFT = 4'b0110;
	parameter LSHIFT = 4'b0111;
	integer seed=45628;
	reg[31:0]a,b,c;
	reg[2:0] operator;
	//--> Function
	/*function [31:0] alu(input reg[31:0]a,b, input reg[2:0] operator);
		begin
		case(operator)
			ADD : alu=a+b;
			SUB : alu=a-b;
			MUL : alu=a*b;
			DIV : alu=a/b;
			MOD : alu=a%b;
			POWER : alu=a**b;
			LSHIFT : alu=a<<b;
			RSHIFT : alu=a>>b;
		endcase
		end
	endfunction*/

	//--> Task
	task alu(input reg[31:0] a,b, input reg[2:0] operator, output reg[31:0]c);
		begin
			case(operator)
			ADD : c=a+b;
			SUB : c=a-b;
			MUL : c=a*b;
			DIV : c=a/b;
			MOD : c=a%b;
			POWER : c=a**b;
			LSHIFT : c=a<<b;
			RSHIFT : c=a>>b;
			endcase
		end
	endtask

	initial begin
		repeat(10) begin

		a=$urandom_range(25,55);
		b=$urandom_range(5,15);
		operator=$random(seed);
		//c=alu(a,b,operator);
		alu(a,b,operator,c);
		#2 $display("A=%0d -- B=%0d -- Op=%b -- Result=%0d(%0b)",a,b,operator,c,c);
		end
	end
endmodule

/* Output-1:-
# Start time: 17:54:17 on Sep 24,2025
# Loading work.top
# A=28 -- B=15 -- Op=100 -- Result=13(1101)
# A=53 -- B=8 -- Op=001 -- Result=45(101101)
# A=30 -- B=14 -- Op=001 -- Result=16(10000)
# A=40 -- B=15 -- Op=011 -- Result=2(10)
# A=39 -- B=8 -- Op=101 -- Result=480009665(11100100111000101110111000001)
# A=51 -- B=8 -- Op=101 -- Result=773064225(101110000101000000011000100001)
# A=43 -- B=7 -- Op=101 -- Result=1235671459(1001001101001101101100110100011)
# A=49 -- B=15 -- Op=010 -- Result=735(1011011111)
# A=47 -- B=7 -- Op=001 -- Result=40(101000)
# A=33 -- B=8 -- Op=101 -- Result=1954312449(1110100011111000111000100000001)
*/

/* Output 2:-
# Start time: 17:58:08 on Sep 24,2025
# Loading work.top
# A=28 -- B=15 -- Op=111 -- Result=917504(11100000000000000000)
# A=53 -- B=8 -- Op=101 -- Result=4139455841(11110110101110110001010101100001)
# A=30 -- B=14 -- Op=110 -- Result=0(0)
# A=40 -- B=15 -- Op=110 -- Result=0(0)
# A=39 -- B=8 -- Op=100 -- Result=7(111)
# A=51 -- B=8 -- Op=000 -- Result=59(111011)
# A=43 -- B=7 -- Op=000 -- Result=50(110010)
# A=49 -- B=15 -- Op=101 -- Result=1878557649(1101111111110001000001111010001)
# A=47 -- B=7 -- Op=011 -- Result=6(110)
# A=33 -- B=8 -- Op=111 -- Result=8448(10000100000000)
*/
