//LATCH: UTILIZANDO PARA ASIGNAR LOS WIRE A LOS REG AL MISMO TIEMPO

module latch (cable, key, salida);

	input [7:0]cable;
	input key;
	output [7:0] salida;
	
	reg [7:0] salida;
	
	always @(posedge key) //siempre "at" (flanco positivo..)
		begin
			salida = cable;
		end
		
endmodule