/* In binary:
-->Each left shift moves all bits one position to the left.
-->This is equivalent to multiplying the number by 2.
-->Instead of doing a full multiplication operation, which can be slower or more hardware-intensive, you can break the multiplication into powers of 2.
*/

//--> Multiplication of 65 and 37 using shift operator.

module top;
	parameter a=65;
	parameter b=37;

	integer x,z;

	initial begin
		x=b<<6;
		z=x+b;
		$display("Product of %0d and %0d is %0d",a,b,z);
	end
endmodule

/* Output:-
# Start time: 17:23:07 on Sep 23,2025
# Loading work.top
# Product of 65 and 37 is 2405
*/
