`timescale 1ns / 1ps


module LED_run_tb();

reg clk,reset_n;
wire [7:0] led;

LED_run_1#
(
    .MCNT(25_000)
) // 这么写是为了缩短仿真时间
LED_run_1_a
(
    .clk(clk),
    .reset_n(reset_n),
    .led(led)
);

initial clk=1;
always#10 clk=~clk;

 initial begin
    reset_n = 0;
    #201;
    reset_n = 1;
    #4_000_000;
    #4_000_000;
    $stop;
 end

endmodule
