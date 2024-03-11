
module led(
	input 	clk,//开发板晶振频率50MHz
	input 	rst_n,//复位下绛沿有效
	output 	reg     [3:0]	ld //led灯
);
reg [25:0]	cnt; //时钟寄存器

//计时器模块
always@(negedge rst_n or posedge clk)begin
	if(!rst_n)begin
        ld<=4'b1111;
	end
end
endmodule  