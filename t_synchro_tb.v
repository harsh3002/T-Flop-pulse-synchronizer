
`timescale 1ns/1ns


module t_synchro_tb ;

wire synchro_out_tb;
reg clk1_tb;
reg clk2_tb;
reg reset_tb;
reg data_in_tb;

t_flop_synchro dut(
.synchro_out(synchro_out_tb),
.reset(reset_tb),
.clk2(clk2_tb),
.clk1(clk1_tb),
.data_in(data_in_tb));

initial begin
	clk1_tb<=0;
	forever  #10 clk1_tb<=~clk1_tb;
end

initial begin
	clk2_tb<=0;
	forever  #20 clk2_tb<=~clk2_tb;
end

initial begin
	
	repeat (7)  begin
		#70 data_in_tb<=1;
		#10  data_in_tb<=0;
	end
end

initial begin
	reset_tb<=1;
	#30 reset_tb<=0;
end
endmodule