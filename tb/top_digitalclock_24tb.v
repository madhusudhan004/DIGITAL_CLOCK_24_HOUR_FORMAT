`timescale 1ms/1ns
module top_digitalclock24tb();
	reg clock;
	reg reset;
	reg [3:0] load_su;
	reg [2:0] load_st;
	reg [3:0] load_mu;
	reg [2:0] load_mt;
	reg [3:0] load_hu;
	reg [1:0] load_ht;
	wire [6:0]SUD;
	wire [6:0]STD;
	wire [6:0]MUD;
	wire [6:0]MTD;
	wire [6:0]HUD;
	wire [6:0]HTD;

top_digital_clock_24 DUT(
	.clock(clock),
	.reset(reset),
	.load_su(load_su),
	.load_st( load_st),
	.load_mt(load_mt),
	.load_mu(load_mu),
	.load_hu(load_hu),
	.load_ht(load_ht),
	.SUD(SUD),
	.STD(STD),
	.MUD(MUD),
	.MTD(MTD),
	.HUD(HUD),
	.HTD(HTD)	
	);
always #1.953126 clock=~clock;

// Load the Timer in the order HH:MM:SS

task load_timer;
input [1:0]ht;
input [3:0]hu;
input [2:0]mt;
input [3:0]mu;
input [2:0]st;
input [3:0]su;
begin
@(negedge clock)
reset=1'b0;
load_ht=ht;
load_hu=hu;
load_mt=mt;
load_mu=mu;
load_st=st;
load_su=su;
#1;
reset=1'b1;
end
endtask

initial
begin
clock=1'b0;
reset=1'b0;
load_ht=2'd0;
load_hu=4'd0;
load_mt=3'd0;
load_mu=4'd0;
load_st=3'd0;
load_su=4'd0;
#1001;
reset=1'b1;
#1001;
load_timer(2'd0,4'd0,3'd0,4'd0,3'd5,4'd9);
#1001;
load_timer(2'd0,4'd0,3'd5,4'd9,3'd5,4'd9);
#1001;
load_timer(2'd2,4'd3,3'd5,4'd9,3'd5,4'd9);
#1001;
load_timer(2'd0,4'd0,3'd0,4'd0,3'd7,4'd10);
#5001;
load_timer(2'd0,4'd0,3'd7,4'd10,3'd5,4'd9);
#5001;
load_timer(2'd3,4'd10,3'd5,4'd9,3'd5,4'd9);
#5001;
load_timer(2'd0,4'd0,3'd0,4'd0,3'd0,4'd9);
#51000;
load_timer(2'd0,4'd0,3'd4,4'd9,3'd5,4'd9);
#2001;
load_timer(2'd1,4'd9,3'd5,4'd9,3'd5,4'd9);
#2001;
load_timer(2'd2,4'd4,3'd5,4'd9,3'd5,4'd9);
#2001;
load_timer(2'd2,4'd3,3'd7,4'd9,3'd7,4'd9);
#2001;
load_timer(2'd0,4'd0,3'd7,4'd9,3'd7,4'd9);
#2001;
load_timer(2'd0,4'd0,3'd0,4'd0,3'd7,4'd9);
#2001;
$finish;
end

initial
begin
$timeformat(0,3,"s",10);
$monitor("Time=%0t --- CLOCK= %d%d::%d%d::%d%d --- DECODER_SEGMENT --- HTD:%b HUD:%b \t MTD:%b MUD:%b \t STD:%b SUD:%b",
	$time,
	DUT.DIGITAL_CLOCK.hs_t,
	DUT.DIGITAL_CLOCK.hs_u,
	DUT.DIGITAL_CLOCK.ms_t,
	DUT.DIGITAL_CLOCK.ms_u,
	DUT.DIGITAL_CLOCK.ss_t,
	DUT.DIGITAL_CLOCK.ss_u,
	HTD,
	HUD,
	MTD,
	MUD,
	STD,
	SUD,
	);
end
endmodule


















	