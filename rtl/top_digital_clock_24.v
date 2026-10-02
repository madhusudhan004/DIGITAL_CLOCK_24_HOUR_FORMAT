module top_digital_clock_24(
	input clock,
	input reset,
	input [3:0] load_su,
	input [2:0] load_st,
	input [3:0] load_mu,
	input [2:0] load_mt,
	input [3:0] load_hu,
	input [1:0] load_ht,
	output [6:0]SUD,
	output [6:0]STD,
	output [6:0]MUD,
	output [6:0]MTD,
	output [6:0]HUD,
	output [6:0]HTD
	);
wire [3:0]ssu_w,msu_w,hsu_w;
wire [2:0]sst_w,mst_w;
wire [1:0]hst_w;

digital_clock_24 DIGITAL_CLOCK(.clock_256hz(clock),
			     .reset(reset),
			     .load_su(load_su),
			     .load_st(load_st),
			     .load_mu(load_mu),
			     .load_mt(load_mt),
			     .load_hu(load_hu),
			     .load_ht(load_ht),
			     .ss_u(ssu_w),
			     .ss_t(sst_w),
			     .ms_u(msu_w),
			     .ms_t(mst_w),
			     .hs_u(hsu_w),
			     .hs_t(hst_w)
			);
bcdto7segdec SECONDS_UNIT(.digit(ssu_w),.led(SUD));
bcdto7segdec SECONDS_TENS(.digit({1'b0,sst_w}),.led(STD));
bcdto7segdec MINUTES_UNIT(.digit(msu_w),.led(MUD));
bcdto7segdec MINUTES_TENS(.digit({1'b0,mst_w}),.led(MTD));
bcdto7segdec HOURS_UNIT(.digit(hsu_w),.led(HUD));
bcdto7segdec HOURS_TENS(.digit({2'b00,hst_w}),.led(HTD));



endmodule





