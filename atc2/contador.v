//sirve para contar los pulsos del reloj generado por el usuario

module contador (key, salida);

	input key;
	output [2:0] salida;
	
	reg [2:0] salida;
	
	always @(posedge key)
		begin
			salida <= salida + 1;
		end
		
endmodule