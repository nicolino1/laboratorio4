//CONVERSOR A BCD

module BCD(in,out);

	input [3:0] in;
	
	
	output [3:0]out;
	
	


	always @(posedge in)
			begin
				case(in)
				
				4'b0000 :
					begin
						out[0]=0;
						out[1]=0;
						out[2]=0;
						out[3]=0;
					end
				4'b0001 :
					begin
						out[0]=1;
						out[1]=0;
						out[2]=0;
						out[3]=0;
					end
					
				4'b0010 :
					begin
						out[0]=0;
						out[1]=1;
						out[2]=0;
						out[3]=0;
					end
					
				4'b0011 : 
					begin
						out[0]=1;
						out[1]=1;
						out[2]=0;
						out[3]=0;
					end
					
					
				4'b0100 : 
					begin
						out[0]=0;
						out[1]=0;
						out[2]=1;
						out[3]=0;
					end
					
				4'b0101 : 
					begin
						out[0]=0;
						out[1]=0;
						out[2]=0;
						out[3]=1;
					end
					
					
				4'b0110 : 
					begin
						out[0]=1;
						out[1]=0;
						out[2]=0;
						out[3]=1;
					end
				4'b0111 :
					begin
						out[0]=0;
						out[1]=1;
						out[2]=0;
						out[3]=1;
					end
				4'b1000 : 
					begin
						out[0]=1;
						out[1]=1;
						out[2]=0;
						out[3]=1;
					end
				4'b1001 :
					begin
						out[0]=0;
						out[1]=0;
						out[2]=1;
						out[3]=1;
					end
				
				endcase

end