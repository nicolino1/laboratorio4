//creo el demultriplexor 1 para poder mandar los valores generados en el switch


//BUSCAR SINTAXIS DE CASE EN VERILOG!!!!! ESTO NO COMPLILAAA
module dm1 (in, Cin, out1,out2, out3, out4, out5, out6, out7, out8);

	input [7:0]in;
	input [2:0]Cin; //es el selector que maneja ela salida del demultiplexor
	output [7:0] out1;
	output [7:0] out2;
	output [7:0] out3;
	output [7:0] out4;
	output [7:0] out5;
	output [7:0] out6;
	output [7:0] out7;
	output [7:0] out8;
	
	reg [7:0] out1;
	reg [7:0] out2;
	reg [7:0] out3;
	reg [7:0] out4;
	reg [7:0] out5;
	reg [7:0] out6;
	reg [7:0] out7;
	reg [7:0] out8;
	
	always @(posedge in) //siempre "at" (flanco positivo..) //nose si va in o Cin como flanco positivo
		begin
			
			
			case (Cin)
			  3'b000 : 
				  begin
					out1=in;
						  
					//vuelvo la variables a 0 para no tener valores residuales
					out2=0;
					out3=0;
					out4=0;
					out5=0;
					out6=0;
					out7=0;
					out8=0;
				  
				  end
			  
			  3'b001 : 
				  begin
					out2=in;
						  
					//vuelvo la variables a 0 para no tener valores residuales
					out1=0;
					out3=0;
					out4=0;
					out5=0;
					out6=0;
					out7=0;
					out8=0;
				  
				  end
			  3'b010 : 
			  	begin
					out3=in;
						  
					//vuelvo la variables a 0 para no tener valores residuales
					out2=0;
					out1=0;
					out4=0;
					out5=0;
					out6=0;
					out7=0;
					out8=0;
				  
				  end

			  3'b011 : 
			  	begin
					out4=in;
						  
					//vuelvo la variables a 0 para no tener valores residuales
					out2=0;
					out3=0;
					out1=0;
					out5=0;
					out6=0;
					out7=0;
					out8=0;
				  
				  end

			  3'b100 : 
			  	begin
					out5=in;
						  
					//vuelvo la variables a 0 para no tener valores residuales
					out2=0;
					out3=0;
					out4=0;
					out1=0;
					out6=0;
					out7=0;
					out8=0;
				  
				  end

			  3'b101 : 
			  	begin
					out6=in;
						  
					//vuelvo la variables a 0 para no tener valores residuales
					out2=0;
					out3=0;
					out4=0;
					out5=0;
					out1=0;
					out7=0;
					out8=0;
				  
				  end

			  3'b110 : 
			  	begin
					out7=in;
						  
					//vuelvo la variables a 0 para no tener valores residuales
					out2=0;
					out3=0;
					out4=0;
					out5=0;
					out6=0;
					out1=0;
					out8=0;
				  
				  end

			  3'b111 : 
			  	begin
					out8=in;
						  
					//vuelvo la variables a 0 para no tener valores residuales
					out2=0;
					out3=0;
					out4=0;
					out5=0;
					out6=0;
					out7=0;
					out1=0;
				  
				  end

			 endcase
			
		end
		
endmodule