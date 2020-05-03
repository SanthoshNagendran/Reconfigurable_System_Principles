module CPU_TestBench();

reg       CLK;
reg       RST;
initial CLK = 1'b0;

always begin
  #10 CLK = ~CLK;
end

reg [15:0]  DATA_I;
wire [15:0]  DATA_O;
reg  [10:0]  EXT_ADDR;	

CPU CPU_Test (.CLK(CLK), .RST(RST), .DATA_I(DATA_I), .EXT_ADDR(EXT_ADDR), .DATA_O(DATA_O) );

initial begin  

assign	DATA_I = 16'hffff;
EXT_ADDR = 11'h0;

     RST=1'b1;
     @(posedge CLK);  // Wait for clock
     RST=1'b0;
     @(posedge CLK);  // Wait for clock
      RST=1'b1;

end
endmodule
