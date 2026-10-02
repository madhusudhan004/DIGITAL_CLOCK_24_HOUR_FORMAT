`timescale 1ms/1ps
module digital_clock_24_tb();
	reg clock_256hz;
	reg reset;
	reg [3:0] load_su;
	reg [2:0] load_st;
	reg [3:0] load_mu;
	reg [2:0] load_mt;
	reg [3:0] load_hu;
	reg [1:0] load_ht;
	wire [3:0] ss_u;
	wire [2:0] ss_t;
	wire [3:0] ms_u;
	wire [2:0] ms_t;
	wire [3:0] hs_u;
	wire [1:0] hs_t;


digital_clock_24 DUT(
	.clock_256hz(clock_256hz),
	.reset(reset),
	.load_su(load_su),
	.load_st(load_st),
	.load_mu(load_mu),
	.load_mt(load_mt),
	.load_hu(load_hu),
	.load_ht(load_ht),
	.ss_u(ss_u),
	.ss_t(ss_t),
	.ms_u(ms_u),
	.ms_t(ms_t),
	.hs_u(hs_u),
	.hs_t(hs_t)
	);

always #1.953125 clock_256hz=~clock_256hz;

initial
begin
reset=1'b0;
clock_256hz=1'b0;
load_su=4'd0;
load_st=3'd0;
load_mu=4'd0;
load_mt=3'd0;
load_hu=4'd3;
load_ht=2'd2;
#1000
reset=1'b1;
#4200000;
$finish;
end

initial
begin
$timeformat(0,3,"s",10);
$monitor("Time=%0t,Hours:Minutes:Seconds = %d%d::%d%d::%d%d",$time,hs_t,hs_u,ms_t,ms_u,ss_t,ss_u);
end

endmodule


