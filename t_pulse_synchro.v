
`timescale 1ns/1ns

module t_flop_synchro(
output synchro_out,
input clk1,
input clk2,
input reset,
input data_in);

reg tff,dff;
wire dual_sync_out;

dual_flop_synchro dual_synchro_inst(
.sync_out(dual_sync_out),
.reset(reset),
.data_in(tff),
.clk(clk2));


always@(posedge clk1) begin
	if(reset) 
		tff<=0;
	else begin
		if(data_in) 
			tff<=~tff;
		else tff<=tff;
	end
end

always@(posedge clk2) begin
	if(reset) 
		dff<=0;
	else 
		dff<=dual_sync_out;

end

assign synchro_out= dff ^ dual_sync_out;
endmodule 

