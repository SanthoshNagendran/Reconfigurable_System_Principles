module Memory_Interface();

reg       CLK;
reg       RST;
//reg [15:0] temp;
initial CLK = 1'b0;

wire[15:0] MADDR;
wire[15:0] DATA_I;
wire[15:0] DATA_O;
wire WR;
wire[15:0] ADDRESS;
wire[15:0] DATA;
wire[15:0] Q;
wire WREN;


always begin
  #10 CLK = ~CLK;
end

CPU CPU_Memory (.CLK(CLK), .RST(RST), .DATA_I(DATA_I), .EXT_ADDR(EXT_ADDR), .DATA_O(DATA_O), .MADDR(MADDR), .RD(RD), .WR(WR) );
RAM RAM_Memory (.Q(Q), .DATA(DATA), .ADDRESS(ADDRESS), .WREN(WREN), .CLK(CLK) );

assign ADDRESS = MADDR;
assign DATA = DATA_O;
assign WREN = WR;
//assign DATA_I = temp;
assign DATA_I = Q;



initial begin  

	
//	temp = 16'hffff;

     RST=1'b1;
     @(posedge CLK);  // Wait for clock
     RST=1'b0;
     @(posedge CLK);  // Wait for clock
      RST=1'b1;

end

endmodule
