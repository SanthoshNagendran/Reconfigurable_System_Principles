module LCD(
	input E,
	input RS,
	input RW,
	input[15:0] DATA_I,
	output[15:0] DATA_O,
	output OUTPUT_MODE
	);

reg temp;


assign OUTPUT_MODE = temp;
assign DATA_O = DATA_I;

always @(RS or RW or E or DATA_I or DATA_O or temp) begin

if(RW == 1'b1 && E == 1'b1)
begin
if(RS == 1'b1) temp = 1'b1;
else temp = 1'b0;
end


end
endmodule
