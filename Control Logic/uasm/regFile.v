module regFile(
 //input registers
   input[15:0] DIN,
   input[15:0] RIN,
   input[2:0]  DSEL,
   input[2:0]  ASEL,
   input[2:0]  BSEL,
   input       RST,
   input       CLK,
//output registers
   output[15:0] ABUS,
   output[15:0] BBUS
   );

        reg[15:0] DND;
        reg[15:0] reg1;
        reg[15:0] reg2;
        reg[15:0] reg3;
        reg[15:0] reg4; 
        reg[15:0] reg5;
        reg[15:0] reg6;
        reg[15:0] reg7;

// create new register to store output values of buses 
        reg[15:0] regA = 16'h00;
        reg[15:0] regB = 16'h00;

// signing them to the ABUS and BBUS
     assign ABUS = regA;
     assign BBUS = regB;

   always@(posedge CLK or negedge RST) begin
// write operation

    if (RST == 0) begin
        DND  = 16'b0;
        reg1 = 16'b0;
        reg2 = 16'b0;
        reg3 = 16'b0;
        reg4 = 16'b0; 
        reg5 = 16'b0;
        reg6 = 16'b0;
        reg7 = 16'b0;
    end 
    else 
       case (DSEL)
        3'b001 : reg1 <= RIN;
        3'b010 : reg2 <= RIN;
        3'b011 : reg3 <= RIN;
        3'b100 : reg4 <= RIN;
        3'b101 : reg5 <= RIN;
        3'b110 : reg6 <= RIN;
        3'b111 : reg7 <= RIN;
      endcase
    
    end
// read operation 

    always@(ASEL, DIN, reg1, reg2, reg3, reg4, reg5, reg6, reg7) begin 
       case(ASEL) 
      3'b000 : regA = DIN;
      3'b001 : regA = reg1;
      3'b010 : regA = reg2;
      3'b011 : regA = reg3;
      3'b100 : regA = reg4;
      3'b101 : regA = reg5;
      3'b110 : regA = reg6;
      3'b111 : regA = reg7;
    endcase 
   end

   always@(BSEL, DIN, reg1, reg2, reg3, reg4, reg5, reg6, reg7) begin 
       case(BSEL) 
      3'b000 : regB = DIN;
      3'b001 : regB = reg1;
      3'b010 : regB = reg2;
      3'b011 : regB = reg3;
      3'b100 : regB = reg4;
      3'b101 : regB = reg5;
      3'b110 : regB = reg6;
      3'b111 : regB = reg7;
    endcase 
   end
  endmodule 
