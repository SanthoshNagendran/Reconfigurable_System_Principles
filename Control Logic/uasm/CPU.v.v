/*
 * DO NOT EDIT THIS FILE, your changes will be overwritten
 * This is an automatically generated file.
 * It was generated with uasm, the microassembler, on
 * Thu Oct 31 06:53:43 2019
 */

module CPU(
	input CLK,
	input RST,
	input[15:0] DATA_I,
	input[10:0] EXT_ADDR,
	output[15:0] DATA_O,
	output[15:0] MADDR,
	output RD,
	output WR
	);

/*
 * wires and registers for the design
 */

wire [44:0]  ROM_out;
reg  [10:0]  CAR;
wire	     C;
wire	     S;
wire	     V;
wire	     Z;
reg  [10:0]  MUX1_OUT;
reg	     MUX2_OUT;
reg  [15:0]  MAR;
reg  [15:0]  IR;
//reg  [10:0]  EXT_ADDR;

	

MICROCODE_ROM MICROCODE_ROM1(
   .ADDR_in(CAR),
   .ROM_out(ROM_out));

wire [15:0]  ABUS;
wire [15:0]  BBUS;
wire	     CIN;
wire [15:0]  FOUT;
reg [15:0]  DIN;
wire [15:0]  RIN;	 	
reg [ 2:0]  ASEL;
reg [ 2:0]  BSEL;
reg [ 2:0]  DSEL;
wire [ 3:0]  FSEL;
wire [ 3:0]  UPDF;
wire         MUX1;
wire [ 3:0]  MUX2;
wire [15:0]  DATA;
wire [ 6:0]  MISC;
wire	     LDIR;
wire	     LDMAR;
wire	     RFMUX;
wire	     DMUX;	


ALU ALU_1 (.ABUS(ABUS), .BBUS(BBUS), .FSEL(FSEL), .CIN(CIN), .FOUT(FOUT), .Z(Z), .S(S), .C(C), .V(V) );
regFile regFile_1 (.DIN(DIN), .RIN(RIN), .DSEL(DSEL), .ASEL(ASEL), .BSEL(BSEL), .CLK(CLK), .RST(RST), .ABUS(ABUS), .BBUS(BBUS) );

always @(RFMUX or ASEL or BSEL or DSEL) begin

if(RFMUX == 1'b1)  begin
	assign ASEL = IR[2:0];
	assign BSEL = IR[5:3];
	assign DSEL = IR[8:6];
end
else begin
	assign ASEL = ROM_out[44:42];    // bit size:3
	assign BSEL = ROM_out[41:39];    // bit size:3
	assign DSEL = ROM_out[38:36];    // bit size:3
end

end

always @(DMUX or DIN) begin

	if(DMUX == 1'b1) assign	DIN    = DATA; 
	else assign DIN    = DATA_I;
	
end

//assign                 ASEL = ROM_out[44:42];    // bit size:3
//assign                 BSEL = ROM_out[41:39];    // bit size:3
//assign                 DSEL = ROM_out[38:36];    // bit size:3
assign                 FSEL = ROM_out[35:32];    // bit size:4
assign                 UPDF = ROM_out[31:28];    // bit size:4
assign                 MUX1 = ROM_out[27];       // bit size:1
assign                 MUX2 = ROM_out[26:23];    // bit size:4
assign                 DATA = ROM_out[22: 7];    // bit size:16
assign                 MISC = ROM_out[ 6: 0];    // bit size:7

//assign		       DIN    = DATA_I;		 // bit size:16
assign		       DATA_O = FOUT;		 // bit sizw:16
assign		       RIN    = FOUT;		 // bit sizw:16
	
assign		       RD    = MISC[0];
assign		       WR    = MISC[1];
assign		       LDMAR = MISC[2];
assign		       LDIR  = MISC[3];
assign		       RFMUX = MISC[4];
assign		       DMUX  = MISC[5];

assign		       MADDR = MAR;
assign		       EXT_ADDR[10:3] = IR[14:9];
assign		       EXT_ADDR[2:0]  = 3'h0;
		

always@(posedge CLK or negedge RST) begin

 if (RST == 0)  CAR  <= 11'h0;

 else if (MUX2_OUT == 0)  CAR  <= CAR + 1;
 else CAR <= MUX1_OUT;

 if (LDMAR == 1'b1) MAR <= ABUS;
 else if (LDIR == 1'b1) IR <= DATA_I; 

end


always @(MUX1_OUT or MUX1 or DATA or EXT_ADDR) begin
     
   if(MUX1 == 1'b0)  MUX1_OUT = DATA;
   else  MUX1_OUT = EXT_ADDR; 

end


always @(MUX2_OUT or MUX2) begin
     
	case(MUX2)
	4'b0000:  MUX2_OUT = 0;
	4'b0001:  MUX2_OUT = 1;
	4'b0010:  MUX2_OUT = C;
	4'b0011:  MUX2_OUT = !C;
	4'b0100:  MUX2_OUT = Z;
	4'b0101:  MUX2_OUT = !Z;
	4'b0110:  MUX2_OUT = S;
	4'b0111:  MUX2_OUT = !S;
	4'b1000:  MUX2_OUT = V;
	4'b1001:  MUX2_OUT = !V;
	endcase
end


endmodule