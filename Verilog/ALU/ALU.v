`define TSA 4'b0000 
`define INC 4'b0001
`define DEC 4'b0010
`define ADD 4'b0011
`define SUB 4'b0100
`define AND 4'b0101
`define OR  4'b0110
`define XOR 4'b0111
`define NOT 4'b1000
`define SHL 4'b1001
`define SHR 4'b1010
`define ASR 4'b1011
`define RLC 4'b1100
`define RRC 4'b1101
`define RV1 4'b1110
`define RV2 4'b1111


module ALU( 
	input [15:0] ABUS,BBUS,
	input [3:0] FSEL,
	input CIN, 
	output [15:0] FOUT,
	output Z,S,C,V 
	);
reg [15:0] ALU_Result;
reg tmpC,tmpZ,tmpS,tmpV;
wire tmpCIN;

assign FOUT = ALU_Result;
assign C = tmpC;
assign Z = tmpZ;
assign S = tmpS;
assign V = tmpV;
assign CIN = tmpCIN;

always @(ABUS or BBUS or FSEL or CIN) begin
	case(FSEL)
	`TSA:
		begin
		ALU_Result <= ABUS;
		tmpS <= ALU_Result[15];
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		end
	`INC:
		begin
		//assign ALU_Result = ABUS + 16'b000000000000001;
		assign ALU_Result = ABUS + 16'h01;
		//assign ALU_Result = ABUS + 1'b1;
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		end
	`DEC:
		begin
		//assign ALU_Result = ABUS - 16'b000000000000001;
		assign ALU_Result = ABUS - 16'h01;
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		end
	`ADD:
		begin
		assign ALU_Result = {ABUS[0]+BBUS[0],ABUS[1]+BBUS[1],ABUS[2]+BBUS[2],ABUS[3]+BBUS[3],ABUS[4]+BBUS[4],ABUS[5]+BBUS[5],ABUS[6]+BBUS[6],ABUS[7]+BBUS[7],ABUS[8]+BBUS[8],ABUS[9]+BBUS[9],ABUS[10]+BBUS[10],ABUS[11]+BBUS[11],ABUS[12]+BBUS[12],ABUS[13]+BBUS[13],ABUS[14]+BBUS[14],ABUS[15]+BBUS[15]};
		tmpS <= ALU_Result[15];		
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		end
	`SUB:
		begin
		assign ALU_Result = ABUS - BBUS;
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		end
	`AND:
		begin
		assign ALU_Result = {ABUS[15]&BBUS[15],ABUS[14]&BBUS[14],ABUS[13]&BBUS[13],ABUS[12]&BBUS[12],ABUS[11]&BBUS[11],ABUS[10]&BBUS[10],ABUS[9]&BBUS[9],ABUS[8]&BBUS[8],ABUS[7]&BBUS[7],ABUS[6]&BBUS[6],ABUS[5]&BBUS[5],ABUS[4]&BBUS[4],ABUS[3]&BBUS[3],ABUS[2]&BBUS[2],ABUS[1]&BBUS[1],ABUS[0]&BBUS[0]};
		tmpS <= ALU_Result[15];		
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		end
	`OR:
		begin
		assign ALU_Result = (ABUS | BBUS);
		tmpS <= ALU_Result[15];
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		end
	`XOR:
		begin
		assign ALU_Result = (ABUS ^ BBUS);
		tmpS <= ALU_Result[15];
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		end
	`NOT:
		begin
		assign ALU_Result = ~ABUS;
		tmpS <= ALU_Result[15];
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		end
	`SHL:
		begin	
		assign ALU_Result = {ABUS[14:0],1'b0}; 
		tmpS <= ALU_Result[15];
		tmpC <= ABUS[15];
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		end
	`SHR:
		begin
		assign ALU_Result = {1'b0,ABUS[15:1]};
		tmpS <= ALU_Result[15];
		tmpC <= ABUS[0];
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		end
	`ASR:
		begin
		assign ALU_Result = {ABUS[15],ABUS[15:1]};
		tmpS <= ALU_Result[15];
		tmpC <= ABUS[0];
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		end
	`RLC:
		begin
		assign ALU_Result = {ABUS[14:0],CIN};
		tmpS <= ALU_Result[15];
		tmpC <= ABUS[15];
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		end
	`RRC:
		begin
		assign ALU_Result = {CIN,ABUS[15:1]};
		tmpS <= ALU_Result[15];
		tmpC <= ABUS[0];
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		end
	`RV1:
		begin
		ALU_Result <= "xxxxxxxxxxxxxxxx";
		tmpS <= ALU_Result[15];
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		
		end
	`RV2:
		begin
		ALU_Result <= "xxxxxxxxxxxxxxxx";
		tmpS <= ALU_Result[15];
		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		end

	endcase

		if(ALU_Result == 16'b0000000000000000) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpCIN  == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
		if(tmpZ == 1'b1) tmpZ <= 1'b1;
		else tmpZ <= 1'b0;
		if(tmpS == 1'b1) tmpS <= 1'b1;
		else tmpS <= 1'b0;
		if(tmpV == 1'b1) tmpV <= 1'b1;
		else tmpV <= 1'b0;
		if(tmpC == 1'b1) tmpC <= 1'b1;
		else tmpC <= 1'b0;
end


endmodule