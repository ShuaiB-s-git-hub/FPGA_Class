`timescale 1ns / 1ps


module LED_flash_tb();

reg clk,reset_n;
wire led;

LED_flash LED_flash_a
(
    .clk(clk),
    .reset_n(reset_n),
    .led(led)
);

defparam LED_flash_a.LED_1 = 12_500;
defparam LED_flash_a.MCNT = 50_000;

initial clk=1;
always#10 clk=~clk;

 initial begin
    reset_n = 0;
    #201;
    reset_n = 1;
    #2_000_000;
    $stop;
 end

endmodule
