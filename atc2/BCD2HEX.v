//modulo para el led 7 segmentos (128 valores uso hex0-hex2)

module BCD2HEX(in, out);

	input [3:0]in;
	output [6:0] salida;
	
	always @(posedge in)
		begin
			case(in)
			
			4'b0000 :
				begin
					salida[1]=0;
					salida[2]=0;
					salida[3]=0;
					salida[4]=0;
					salida[5]=0;
					salida[0]=0;
				end
			4'b0001 :
				begin
					salida[1]=0;
					salida[2]=0;
				end
				
			4'b0010 :
				begin
					salida[0]=0;
					salida[1]=0;
					salida[6]=0;
					salida[4]=0;
					salida[3]=0;
				end
				
			4'b0011 : 
				begin
					salida[0]=0;
					salida[1]=0;
					salida[6]=0;
					salida[2]=0;
					salida[3]=0;
				end
				
				
			4'b0100 : 
				begin
					salida[5]=0;
					salida[1]=0;
					salida[6]=0;
					salida[3]=0;
				end
				
			4'b0101 : 
				begin
					salida[0]=0;
					salida[5]=0;
					salida[6]=0;
					salida[2]=0;
					salida[3]=0;
				end
				
				
			4'b0110 : 
				begin
					salida[0]=0;
					salida[2]=0;
					salida[5]=0;
					salida[6]=0;
					salida[4]=0;
					salida[3]=0;
				end
			4'b0111 :
				begin
					salida[1]=0;
					salida[2]=0;
					salida[0]=0;
				end
			4'b1000 : 
				begin
					salida[0]=0;
					salida[1]=0;
					salida[2]=0;
					salida[5]=0;
					salida[6]=0;
					salida[4]=0;
					salida[3]=0;
				end
			4'b1001 :
				begin
					salida[0]=0;
					salida[2]=0;
					salida[5]=0;
					salida[6]=0;
					salida[3]=0;
				end
			
			endcase
		end