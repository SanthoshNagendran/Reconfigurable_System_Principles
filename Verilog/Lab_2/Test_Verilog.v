module SN();

	reg SIG1,SIG2,SIG3;
	wire OUT;
	
	GATES SN1 (.A(SIG1), .B(SIG2), .C(SIG3), .F(OUT) );
  initial begin
	   SIG1 =1'b0; SIG2 =1'b0; SIG3 =1'b0;
	#1 if(OUT != 1'b0) $display($time, " Failed");
	SIG1 =1'b0; SIG2 =1'b0; SIG3 =1'b1;
	#1 if(OUT != 1'b0) $display($time, " Failed");
	SIG1 =1'b0; SIG2 =1'b1; SIG3 =1'b0;
	#1 if(OUT != 1'b0) $display($time, " Failed");
	SIG1 =1'b0; SIG2 =1'b1; SIG3 =1'b1;
	#1 if(OUT != 1'b1) $display($time, " Failed");
	SIG1 =1'b1; SIG2 =1'b0; SIG3 =1'b0;
	#1 if(OUT != 1'b0) $display($time, " Failed");
	SIG1 =1'b1; SIG2 =1'b0; SIG3 =1'b1;
	#1 if(OUT != 1'b1) $display($time, " Failed");
	SIG1 =1'b1; SIG2 =1'b1; SIG3 =1'b0;
	#1 if(OUT != 1'b0) $display($time, " Failed");
	SIG1 =1'b1; SIG2 =1'b1; SIG3 =1'b1;
	#1 if(OUT != 1'b1) $display($time, " Failed");
  end


endmodule
