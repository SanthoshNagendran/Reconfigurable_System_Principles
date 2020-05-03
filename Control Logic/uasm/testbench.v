module testbench();

reg       CLK;
reg       RST;

initial CLK = 1'b0;

always begin
  #1 CLK = ~CLK;
end

//inputs
reg[2:0] DSEL;
reg[2:0] ASEL;
reg[2:0] BSEL;
reg[15:0] DIN;
reg[15:0] RIN;

//outputs
wire[15:0] ABUS;
wire[15:0] BBUS; 

integer FAIL=0;
integer SUCCESS=0;

regFile testbench(.ASEL(ASEL), .BSEL(BSEL), .DSEL(DSEL), .DIN(DIN), .RIN(RIN), .CLK(CLK), .RST(RST), .ABUS(ABUS), .BBUS(BBUS));

//initialization of input 

task microop;

    input[2:0] ASEL1;
    input[2:0] BSEL1;
    input[2:0] DSEL1;
    input[15:0] DIN1;
    input[15:0] RIN1;
    input[15:0] ABUS1;
    input[15:0] BBUS1;

    begin
    ASEL = ASEL1;
    BSEL = BSEL1;
    DSEL = DSEL1;
    DIN = DIN1;
    RIN = RIN1;
    @(posedge CLK);

    if(ABUS1 != ABUS) begin 
       $display($time, ":ABUS mismatch ABUS1:%d", ABUS);
       FAIL = FAIL+1;
       end
    if(ABUS1 == ABUS) begin
      $display("Successful Operation of ABUS:%d", SUCCESS);
       SUCCESS = SUCCESS+1;
       end
    if(BBUS1 != BBUS) begin 
       $display($time, ":BBUS mismatch BBUS1:%d", BBUS);
       FAIL = FAIL+1;
    end
   if(BBUS1 == BBUS) begin
     $display("Succesfull Operation of BBUS:%d", SUCCESS);
     SUCCESS = SUCCESS+1;
    end
   end
endtask

initial begin  

     DSEL = 3'b0;
     ASEL = 3'b0;
     BSEL = 3'b0;
     DIN  = 3'b0;
     RIN  = 3'b0;

$dumpfile("testbench.vcd");
$dumpvars();
     RST=1'b1;
     @(posedge CLK);  // Wait for clock
     @(posedge CLK);  // Wait for clock
     RST=1'b0;
     @(posedge CLK);  // Wait for clock
     @(posedge CLK);  // Wait for clock
      RST=1'b1;


      microop(1,0,0,0,0,0,0);
      microop(2,0,0,0,0,0,0);
      microop(3,0,0,0,0,0,0);
      microop(4,0,0,0,0,0,0);
      microop(5,0,0,0,0,0,0);
      microop(6,0,0,0,0,0,0);
      microop(7,0,0,0,0,0,0);
      microop(0,1,0,0,0,0,0);
      microop(0,2,0,0,0,0,0);
      microop(0,3,0,0,0,0,0);
      microop(0,4,0,0,0,0,0);
      microop(0,5,0,0,0,0,0);
      microop(0,6,0,0,0,0,0);
      microop(0,7,0,0,0,0,0);
 
      /* Write some values into the registers */
      microop(0,0,1,0,1,0,0);
      microop(0,0,2,0,2,0,0);
      microop(0,0,3,0,3,0,0);
      microop(0,0,4,0,4,0,0);
      microop(0,0,5,0,5,0,0);
      microop(0,0,6,0,6,0,0);
      microop(0,0,7,0,7,0,0);

      @(posedge CLK);  // Wait for clock
      @(posedge CLK);  // Wait for clock
      /* Read back on A bus */
      microop(0,0,0,15,10,15,15);
      microop(1,0,0,0,10,1,0);
      microop(2,0,0,0,10,2,0);
      microop(3,0,0,0,10,3,0);
      microop(4,0,0,0,10,4,0);
      microop(5,0,0,0,10,5,0);
      microop(6,0,0,0,10,6,0);
      microop(7,0,0,0,10,7,0);

      @(posedge CLK);  // Wait for clock
      @(posedge CLK);  // Wait for clock
      /* Read back on B bus */
      microop(0,0,0,16,12,16,16);
      microop(0,1,0,0,10,0,1);
      microop(0,2,0,0,10,0,2);
      microop(0,3,0,0,10,0,3);
      microop(0,4,0,0,10,0,4);
      microop(0,5,0,0,10,0,5);
      microop(0,6,0,0,10,0,6);
      microop(0,7,0,0,10,0,7);

end 
endmodule 
