module moduloC (N1, N2,N3,N4,N5,N6,N7,N8, S1, S2, S3, S4, S5, S6, S7, S8);

	input [7:0] N1;
	input [7:0] N2;
	input [7:0] N3;
	input [7:0] N4;
	input [7:0] N5;
	input [7:0] N6;
	input [7:0] N7;
	input [7:0] N8;
	
	//ORDENADOS..
	output [7:0] S1;	//MAS CHICO
	output [7:0] S2;	//2
	output [7:0] S3;	//3
	output [7:0] S4;	//MAS GRANDE
	output [7:0] S5;	//MAS CHICO
	output [7:0] S6;	//2
	output [7:0] S7;	//3
	output [7:0] S8;	//MAS GRANDE
	
	//parametros:
	wire [7:0] N1;
	wire [7:0] N2;
	wire [7:0] N3;
	wire [7:0] N4;
	wire [7:0] N5;
	wire [7:0] N6;
	wire [7:0] N7;
	wire [7:0] N8;
	wire [7:0] S1;
	wire [7:0] S2;	
	wire [7:0] S3;
	wire [7:0] S4;	
	wire [7:0] S5;
	wire [7:0] S6;	
	wire [7:0] S7;
	wire [7:0] S8;
	
	/*
	  ------------
	=	A1	A3	A5 =
	=	A2	A4	A5 =
	  ------------
	*/
	
	//VARIABLES AUXILIARES:
	wire [7:0]	A1S1, A1S2; 			//A1
	wire [7:0]	A2S1, A2S2;				//A2
	wire [7:0]	A3S1, A3S2;				//A3
	wire [7:0]	A4S1, A4S2;				//A4
	wire [7:0]	B1S1,B1S2,B1S3,B1S4; //B1
	wire [7:0]	B2S1,B2S2,B2S3,B2S4; //B2
	
	moduloB B1(
		.N11(N1), 
		.N12(N2),
		.N21(N3),
		.N22(N4), 
		.Sb1(B1S1), 
		.Sb2(B1S2), 
		.Sb3(B1S3), 
		.Sb4(B1S4)
		);

	moduloB B2(
		.N11(N5), 
		.N12(N6),
		.N21(N7),
		.N22(N8), 
		.Sb1(B2S1), 
		.Sb2(B2S2), 
		.Sb3(B2S3), 
		.Sb4(B2S4)
		);

	moduloA A1(
		.N1(B1S1),
		.N2(B2S4),
		.S1(A1S1),
		.S2(A1S2)
		);		
	
	moduloA A2(
		.N1(B1S2),
		.N2(B2S3),
		.S1(A2S1),
		.S2(A2S2)
		);
		
	moduloA A3(
		.N1(B1S3),
		.N2(B2S2),
		.S1(A3S1),
		.S2(A3S2)
		);
	
	moduloA A4(
		.N1(B1S4),
		.N2(B2S1),
		.S1(A4S1),
		.S2(A4S2)
		);
		
	moduloD D1(
		.N11(A1S1), 
		.N12(A2S1),
		.N21(A3S1),
		.N22(A4S1), 
		.Sb1(S1), 
		.Sb2(S2), 
		.Sb3(S3), 
		.Sb4(S4)
		);

	moduloD D2(
		.N11(A4S2), 
		.N12(A3S2),
		.N21(A2S2),
		.N22(A1S2), 
		.Sb1(S5), 
		.Sb2(S6), 
		.Sb3(S7), 
		.Sb4(S8)
		);
		
endmodule