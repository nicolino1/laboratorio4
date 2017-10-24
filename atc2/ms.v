//multiplexor de seleccion final

module ms (in1,in2,in3,in4,in5,in6,in7, in8, Cout, out);

	input [7:0]in1;
	input [7:0]in2;
	input [7:0]in3;
	input [7:0]in4;
	input [7:0]in5;
	input [7:0]in6;
	input [7:0]in7;
	input [7:0]in8;
	input [2:0]Cout;
	
	output [7:0] out;
	
	reg [7:0] out;
	
	always @(posedge Cout) //siempre "at" (flanco positivo..) //nose si va Cout o alguna de las in (hago un "or" de las in)
		begin
			case (Cout)
			  3'b000 : out=in1;
			  3'b001 : out=in2;
			  3'b010 : out=in3;
			  3'b011 : out=in4;
			  3'b100 : out=in5;
			  3'b101 : out=in6;
			  3'b110 : out=in7;
			  3'b111 : out=in8;
			endcase
		end
		
endmodule