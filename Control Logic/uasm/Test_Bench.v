/* ALU Operations */
`define TSA  4'h0
`define INC  4'h1
`define DEC  4'h2
`define ADD  4'h3
`define SUB  4'h4
`define AND  4'h5
`define OR   4'h6
`define XOR  4'h7
`define NOT  4'h8
`define SHL  4'h9
`define SHR  4'hA
`define ASR  4'hB
`define RLC  4'hC
`define RRC  4'hD
`define RSV1 4'hE
`define RSV2 4'hF

module TB_ALU();
	
	reg [15:0] A,B;
	reg [3:0] F;
	reg E; 
	wire [15:0] OUT;
	wire Z1,S1,C1,V1; 

	ALU Test_ALU (.ABUS(A), .BBUS(B), .FSEL(F), .CIN(E), .FOUT(OUT), .Z(Z1), .S(S1), .C(C1), .V(V1) );
	
	task aluop;
		input FSEL,A1,B1,Enable,FOUT,Z,S,C,V;
		begin
			F = FSEL;
			A = A1;
			B = B1;
			E = Enable;
			#1 if(OUT == FOUT) $display($time, " Output Matched");
			else $display($time, " Output doesn't Match");
			if(Z1 == Z) $display($time, " Zero flag Matched");
			else $display($time, " Zero flag doesn't Match");
			if(S1 == S) $display($time, " Sign flag matched");
			else $display($time, " Sign flag doesn't match");
			if(C1 == C) $display($time, " Carry flag matched");
			else $display($time, " carry flag doesn't match");
			if(V1 == V) $display($time, " Overflow flag matched");
			else $display($time, " overflow flag doesn't match");
			 
		end
	endtask

  initial begin

	aluop(`TSA,16'h00,16'h00,0,16'h00,1,0,0,0);	
	aluop(`TSA,16'h01,16'h00,0,16'h01,0,0,0,0);
	aluop(`TSA,16'h20,16'h42,0,16'h20,0,0,0,0);
	aluop(`TSA,16'h40,16'h24,0,16'h40,0,0,0,0);
	aluop(`TSA,16'h80,16'h00,0,16'h80,0,0,0,0);

	 /* Increment */
	aluop(`INC,16'h00,16'h00,0,16'h01,0,0,0,0);
	aluop(`INC,16'h01,16'h05,0,16'h02,0,0,0,0);
	aluop(`INC,16'h7F,16'h10,0,16'h80,0,0,0,0);
	aluop(`INC,16'h80,16'h00,0,16'h81,0,0,0,0);

	 /* Add */
	aluop(`ADD,16'h00,16'h00,0,16'h00,1,0,0,0);
	aluop(`ADD,16'h01,16'h01,0,16'h02,0,0,0,0);
	aluop(`ADD,16'h02,16'h03,0,16'h05,0,0,0,0);
	aluop(`ADD,16'h03,16'h02,0,16'h05,0,0,0,0);
	aluop(`ADD,16'h7e,16'h03,0,16'd129,0,0,0,0);
	aluop(`ADD,16'hfe,16'h02,0,16'd256,0,0,0,0);
	aluop(`ADD,-32768, -1,0,16'd32767,0,0,1,1); // Overflow
	aluop(`ADD, 32767,  1,0,16'd32768,0,1,0,1); // Overflow
	aluop(`ADD,-5,      6,0,16'd1    ,0,0,1,0); // No overflow

	 /* Subtract */
	aluop(`SUB,5,4,0,16'h0001,0,0,0,0);
	aluop(`SUB,-4,5,0,-9,0,1,0,0);
	aluop(`SUB,-32768,1,0,16'h7fff,0,0,0,1); // overflow
	aluop(`SUB, 32767,-1,0,16'h8000,0,1,1,1); // overflow
	aluop(`SUB, 10,    5,0,16'h05,0,0,0,0);
	 /* Decrement */
	aluop(`DEC,1,0,0,16'h00,1,0,0,0);
	aluop(`DEC,-65535,0,0,16'h00,1,0,0,0); // overflow all 1's to 0
	aluop(`DEC,65535,0,0,16'hfffe,0,1,0,0);
	aluop(`DEC,1,43,0,16'h00,1,0,0,0);
	aluop(`DEC,255,0,0,254,0,0,0,0);

	 /* Logical operations */
	aluop(`AND,16'h00,16'h00,0,16'h00,1,0,0,0);
	aluop(`AND,16'haaaa,16'h5555,0,16'h0000,1,0,0,0);
	aluop(`AND,16'h5a5a,16'ha5a5,0,16'h0000,1,0,0,0);
	aluop(`AND,16'hffff,16'hffff,0,16'hffff,0,1,0,0);
	aluop(`OR ,16'h00,16'h00,0,16'h00,1,0,0,0);
	aluop(`OR ,16'haaaa,16'h5555,0,16'hffff,0,1,0,0);
	aluop(`OR ,16'h5a5a,16'ha5a5,0,16'hffff,0,1,0,0);
	aluop(`OR ,16'hffff,16'hffff,0,16'hffff,0,1,0,0);
	aluop(`OR ,16'h0000,16'hffff,0,16'hffff,0,1,0,0);
	aluop(`OR ,16'hffff,16'h0000,0,16'hffff,0,1,0,0);

	aluop(`XOR,16'h0000,16'h0000,0,16'h0000,1,0,0,0);
	aluop(`XOR,16'haaaa,16'h5555,0,16'hffff,0,1,0,0);
	aluop(`XOR,16'h5a5a,16'ha5a5,0,16'hffff,0,1,0,0);
	aluop(`XOR,16'hffff,16'hffff,0,16'h0000,1,0,0,0);

	aluop(`NOT,16'h0000,16'h0000,0,16'hffff,0,1,0,0);
	aluop(`NOT,16'haaaa,16'h5555,0,16'h5555,0,0,0,0);
	aluop(`NOT,16'h5a5a,16'ha5a5,0,16'ha5a5,0,1,0,0);
	aluop(`NOT,16'hffff,16'h0000,0,16'h0000,1,0,0,0);

	aluop(`SHL,16'h0001,16'h0000,0,16'h0002,0,0,0,0);
	aluop(`SHL,16'h4000,16'h0000,0,16'h8000,0,1,0,1);
	aluop(`SHL,16'h8001,16'h0000,0,16'h0002,0,0,1,1);

	aluop(`SHR,16'h0001,16'h0000,0,16'h0000,1,0,1,0);
	aluop(`SHR,16'h4000,16'h0000,0,16'h2000,0,0,0,0);
	aluop(`SHR,16'h8001,16'h0000,0,16'h4000,0,0,1,1);

	aluop(`ASR,16'h0001,16'h0000,0,16'h0000,1,0,1,0);
	aluop(`ASR,16'h4000,16'h0000,0,16'h2000,0,0,0,0);
	aluop(`ASR,16'h8001,16'h0000,0,16'hC000,0,1,1,0);
	aluop(`ASR,      -1,16'h0000,0,       0,1,0,1,0);

	aluop(`RLC,16'h0001,16'h0000,0,16'h0002,0,0,0,0);
	aluop(`RLC,16'h0001,16'h0000,1,16'h0003,0,0,0,0);
	aluop(`RLC,16'h4000,16'h0000,0,16'h8000,0,1,0,1);
	aluop(`RLC,16'h8001,16'h0000,0,16'h0002,0,0,1,1);
	aluop(`RLC,16'h8001,16'h0000,1,16'h0003,0,0,1,1);

	aluop(`RRC,16'h0001,16'h0000,0,16'h0000,1,0,1,0);
	aluop(`RRC,16'h0001,16'h0000,1,16'h8000,0,1,1,1);
	aluop(`RRC,16'h4000,16'h0000,0,16'h2000,0,0,0,0);
	aluop(`RRC,16'h8001,16'h0000,0,16'h4000,0,0,1,1);
	aluop(`RRC,16'h8001,16'h0000,1,16'hC000,0,1,1,0);

  end

endmodule

