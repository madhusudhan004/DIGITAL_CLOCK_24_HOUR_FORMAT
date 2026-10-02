// 24 Hours Format Digital Clock with input clock frequency 
module digital_clock_24(
	input clock_256hz,
	input reset,
	input [3:0] load_su,
	input [2:0] load_st,
	input [3:0] load_mu,
	input [2:0] load_mt,
	input [3:0] load_hu,
	input [1:0] load_ht,
	output reg [3:0] ss_u,
	output reg [2:0] ss_t,
	output reg [3:0] ms_u,
	output reg [2:0] ms_t,
	output reg [3:0] hs_u,
	output reg [1:0] hs_t
	);

reg [7:0]count_clk;

// Logic to count 256 clock cycles (0-255) for the 256 Hz clock signal where 1 second= Count 0 to 255 for every posedge of the clock
always @(posedge clock_256hz or negedge reset)
begin
	if(!reset)
	begin
		count_clk<=0;
	end
	else
	begin
		if(count_clk==255)
			count_clk<=0;
		else
			count_clk<=count_clk+1'b1;
	end
end

// Logic to wrap and increment seconds. ss_u=Seconds Unit's Counter ss_t= Seconds Ten's Counter 00-59.
always@(posedge clock_256hz or negedge reset)
begin
	if(!reset)
	begin
		ss_u<=load_su;
		ss_t<=load_st;
	end
	else
	begin
		if(ss_t>3'd5 || ss_u>4'd9)
			begin
				ss_t<=3'd0;
				ss_u<=4'd0;
			end
		else if(count_clk==255)
			if(ss_t==3'd5 && ss_u==4'd9 )
			begin
				ss_t<=0;
				ss_u<=0;
			end
			else
			begin
				if(ss_u==4'd9)
				begin
					ss_u<=0;
					if(ss_t==3'd5)
						ss_t<=0;
					else
						ss_t<=ss_t+1'b1;
				end
				else
					ss_u<=ss_u+1'b1;
			end
	end
end


// Logic to wrap and increment Minutes. ms_u=Minute's Unit's Counter ms_t= Minutes's Ten's Counter 00-59.
always@(posedge clock_256hz or negedge reset)
begin
	if(!reset)
	begin
		ms_u<=load_mu;
		ms_t<=load_mt;
	end
	else
	begin
		if(ms_t>3'd5 || ms_u>4'd9)
			begin
				ms_u<=4'd0;
				ms_t<=3'd0;
			end
		
		else if(count_clk==255 && ss_t==3'd5 && ss_u==4'd9)
		begin
			if(ms_t==3'd5 && ms_u==4'd9)
			begin
				ms_u<=4'd0;
				ms_t<=3'd0;
			end
			
			else
			begin
				if(ms_u==4'd9)
				begin
					ms_u<=4'd0;
					if(ms_t==3'd5)
						ms_t<=3'd0;
					else
						ms_t<=ms_t+1'b1;
				end
				else
					ms_u<=ms_u+1'b1;
			end
		end
	end
end


// Logic to wrap and increment Hours. hs_u=Hour's Unit's Counter hs_t= Hour's Ten's Counter 00-23.
always @(posedge clock_256hz or negedge reset)
begin
	if(!reset)
	begin
		hs_u<=load_hu;
		hs_t<=load_ht;
	end
	else
	begin
		if(hs_t>2'd2 || hs_u>4'd9 || ( hs_t==2'd2 && hs_u>4'd3))
			begin
				hs_u<=4'd0;
				hs_t<=2'd0;
			end
		else if(count_clk==255 && ss_t==3'd5 && ss_u==4'd9 && ms_t==3'd5 && ms_u==4'd9)
		begin
			if(hs_t==2'd2 && hs_u==4'd3)
			begin
				hs_u<=4'd0;
				hs_t<=2'd0;
			end
			else
			begin
				if(hs_u==4'd9)
				begin
					hs_u<=4'd0;
					if(hs_t==2'd2)
						hs_t<=2'd0;
					else
						hs_t<=hs_t+1'b1;
				end
				else
					hs_u<=hs_u+1'b1;
			end
		end
	end
end
	
endmodule
			
		
		
			
	
	