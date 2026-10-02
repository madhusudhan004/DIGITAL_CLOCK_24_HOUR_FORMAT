module bcdto7segdec(
	input [3:0] digit,
	output reg [6:0] led
	);
// Active Low Output 7 segment decoder in the order ABCDEFG
always@(*)
begin
	case(digit)
	4'b0000:led=7'b0000001;
	4'b0001:led=7'b1001111;
	4'b0010:led=7'b0010010;
	4'b0011:led=7'b0000110;
	4'b0100:led=7'b1001100;
	4'b0101:led=7'b0100100;
	4'b0110:led=7'b0100000;
	4'b0111:led=7'b0001111;
	4'b1000:led=7'b0000000;
	4'b1001:led=7'b0001100;
	default:led=7'b0000001;
	endcase
end
endmodule
