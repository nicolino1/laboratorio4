module moduloD (N11, N12,N21,N22, Sb1, Sb2, Sb3, Sb4);

	input [7:0] N11;
	input [7:0] N12;
	input [7:0] N21;
	input [7:0] N22;
	
	//ORDENADOS..
	output [7:0] Sb1;	//MAS CHICO
	output [7:0] Sb2;	//2
	output [7:0] Sb3;	//3
	output [7:0] Sb4;	//MAS GRANDE
	
	//parametros:
	wire [7:0] N11;
	wire [7:0] N12;
	wire [7:0] N21;
	wire [7:0] N22;
	wire [7:0] Sb1;
	wire [7:0] Sb2;	
	wire [7:0] Sb3;
	wire [7:0] Sb4;	
	
	/*
	  ------------
	=	A1	A3	A5 =
	=	A2	A4	A5 =
	  ------------
	*/
	
	//VARIABLES AUXILIARES:
	wire [7:0]	A1S1, A1S2; 			//A1
	wire [7:0]	A2S1, A2S2;				//A2


	
	moduloA A1(
		.N1(N11),
		.N2(N12),
		.S1(A1S1),
		.S2(A1S2)
		);

	moduloA A2(
		.N1(N21),
		.N2(N22),
		.S1(A2S1),
		.S2(A2S2)
		);

	moduloA A3(
		.N1(A1S1),
		.N2(A2S1),
		.S1(Sb1),
		.S2(Sb2)
		);		
	
	moduloA A4(
		.N1(A1S2),
		.N2(A2S2),
		.S1(Sb3),
		.S2(Sb4)
		);
		

		
endmodule