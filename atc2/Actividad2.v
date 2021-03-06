
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module Actividad2(

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);



//=======================================================
//  REG/WIRE declarations
//=======================================================
 //ENTRADAS A LOS LATCH
 wire [7:0] ENT1;
 wire [7:0] ENT2;
 wire [7:0] ENT3;
 wire [7:0] ENT4;
 wire [7:0] ENT5;
 wire [7:0] ENT6;
 wire [7:0] ENT7;
 wire [7:0] ENT8;
 
 //CONTADORES
 wire [2:0] Cin;
 wire [2:0] Cout;
  
 //SEÑALES
 wire [2:0] SEN1;
 wire [2:0] SEN2;
 wire [2:0] SEN3;
 wire [2:0] SEN4;
 wire [2:0] SEN5;
 wire [2:0] SEN6;
 wire [2:0] SEN7;
 wire [2:0] SEN8;
 
 //DE LOS LATCH QUE SERAN LAS ENTRADAS AL MODULO C
 wire[7:0] SAL1;
 wire[7:0] SAL2;
 wire[7:0] SAL3;
 wire[7:0] SAL4;
 wire[7:0] SAL5;
 wire[7:0] SAL6;
 wire[7:0] SAL7;
 wire[7:0] SAL8;

 //SALIDAS AL MULTIPLEXOR

 wire[7:0] SALM1;
 wire[7:0] SALM2;
 wire[7:0] SALM3;
 wire[7:0] SALM4;
 wire[7:0] SALM5;
 wire[7:0] SALM6;
 wire[7:0] SALM7;
 wire[7:0] SALM8;
 
 //salidas intermedias de los BCD
 
 wire[3:0] TRANS;
 wire[3:0] SALT1;
 wire[3:0] SALT2;
 wire[3:0] SALT3;
 wire[3:0] SALT4;
 wire[3:0] SALT5;
 wire[3:0] SALT6;
 wire[3:0] SALT7;
 //SALIDA FINAL
 
 wire[3:0] FINAL1;
 wire[3:0] FINAL2;
 wire[3:0] FINAL1;

//=======================================================
//  Structural coding
//=======================================================

//assign bus_32[0] = SW[0];

//contador de seleccion para los demux
contador c1(
	.key(KEY[3]),
	.salida(Cin)
);

//demux1 a partir del valor del switch y el c1 selecciona la salida donde saldra elvalor del switch
dm1 dmux1(
	.in(SW[7:0]), 
	.Cin(Cin),
	.out1(ENT1),
	.out2(ENT2), 
	.out3(ENT3), 
	.out4(ENT4), 
	.out5(ENT5), 
	.out6(ENT6), 
	.out7(ENT7), 
	.out8(ENT8)
);

//demux2 a partir del valor del switch y el c1 selecciona la salida donde saldra elvalor del c1
dm2 demux2(
	.key2(KEY[2]), 
	.Cin(Cin),
	.out1(SEN1),
	.out2(SEN2), 
	.out3(SEN3), 
	.out4(SEN4), 
	.out5(SEN5), 
	.out6(SEN6), 
	.out7(SEN7), 
	.out8(SEN8)
);



//voy a pasar todas las entradas por los latch 
latch l1(
	.cable(ENT1),
	.key(SEN1),
	.salida(SAL1)
);
latch l2(
	.cable(ENT2),
	.key(SEN2),
	.salida(SAL2)
);
latch l3(
	.cable(ENT3),
	.key(SEN3),
	.salida(SAL3)
);
latch l4(
	.cable(ENT4),
	.key(SEN4),
	.salida(SAL4)
);
latch l5(
	.cable(ENT5),
	.key(SEN5),
	.salida(SAL5)
);
latch l6(
	.cable(ENT6),
	.key(SEN6),
	.salida(SAL6)
);
latch l7(
	.cable(ENT7),
	.key(SEN7),
	.salida(SAL7)
);
latch l8(
	.cable(ENT8),
	.key(SEN8),
	.salida(SAL8)
);

//modulo C de ordenamiento

moduloC mc(
	.N1(SAL1), 
	.N2(SAL2),
	.N3(SAL3),
	.N4(SAL4),
	.N5(SAL5),
	.N6(SAL6),
	.N7(SAL7),
	.N8(SAL8), 
	.S1(SALM1), 
	.S2(SALM2), 
	.S3(SALM3), 
	.S4(SALM4), 
	.S5(SALM5), 
	.S6(SALM6), 
	.S7(SALM7), 
	.S8(SALM8)
);

//CONTADOR DE SELECCION DEL MULTIPLEXOR

 contador c2(
	.key(KEY[1]),
	.salida(Cout)
 
 );
 
 //MUX QUE TOMA UN VALOR DE ENTRADA A PARTIR DE LA SELECCION DE Cout, Y LA MUESTRA POR LOS LED
 
 ms mux(
	.in1(SALM1),
	.in2(SALM2),
	.in3(SALM3),
	.in4(SALM4),
	.in5(SALM5),
	.in6(SALM6),
	.in7(SALM7), 
	.in8(SALM8), 
	.Cout(Cout), 
	.out(LEDR[7:0])
);

//CONVERSION DE LA SALIDA BINARIA DE LOS LEDS A DECIMAL,

//asignaciones de valores transitorios

assign TRANS[0] = LEDR[5];
assign TRANS[1] = LEDR[6];
assign TRANS[2] = LEDR[7];
assign TRANS[3] = 0;

BCD C1(
	in(TRANS),
	out(SALT1)
);

assign TRANS[0] = LEDR[4];
assign TRANS[1] = SALT1[0];
assign TRANS[2] = SALT1[1];
assign TRANS[3] = SALT1[2];

BCD C2(
	in(TRANS),
	out(SALT2)
);

assign TRANS[0] = LEDR[3];
assign TRANS[1] = SALT2[0];
assign TRANS[2] = SALT2[1];
assign TRANS[3] = SALT2[2];

BCD C3(
	in(TRANS),
	out(SALT3)
);

assign TRANS[0] = LEDR[2];
assign TRANS[1] = SALT3[0];
assign TRANS[2] = SALT3[1];
assign TRANS[3] = SALT3[2];

BCD C4(
	in(TRANS),
	out(SALT4)
);

assign TRANS[0] = SALT3[3];
assign TRANS[1] = SALT2[3];
assign TRANS[2] = SALT1[3];
assign TRANS[3] = 0;

BCD C6(
	in(TRANS),
	out(SALT6)
);

assign TRANS[0] = LEDR[1];
assign TRANS[1] = SALT4[0];
assign TRANS[2] = SALT4[1];
assign TRANS[3] = SALT4[2];

BCD C5(
	in(TRANS),
	out(SALT5)
);

assign TRANS[0] = SALT4[3];
assign TRANS[1] = SALT6[0];
assign TRANS[2] = SALT6[1];
assign TRANS[3] = SALT6[2];

BCD C7(
	in(TRANS),
	out(SALT7)
);

//ASIGNACION FINAL DE DIGITOS BCD

assign FINAL1[0] = LEDR[0];
assign FINAL1[1] = SALT5[0];
assign FINAL1[2] = SALT5[1];
assign FINAL1[3] = SALT5[2];

assign FINAL2[0] = SALT5[3];
assign FINAL2[1] = SALT7[0];
assign FINAL2[2] = SALT7[1];
assign FINAL2[3] = SALT7[2];

assign FINAL3[0] = SALT7[3];
assign FINAL3[1] = SALT6[3];
assign FINAL3[2] = 0;
assign FINAL3[3] = 0;
// SE MUESTRA POR LOS 7 SEGMENTOS

BCD2HEX bcd1(
	.in(FINAL1), 
	.out(HEX0[6:0])
	
);
BCD2HEX bcd2(
	.in(FINAL2), 
	.out(HEX1[6:0])
	
);
BCD2HEX bcd3(
	.in(FINAL3), 
	.out(HEX2[6:0])
	
);

endmodule
