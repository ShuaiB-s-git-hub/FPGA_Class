`timescale 1ns / 1ps


module LED_flash_tb_1();

reg clk,reset_n;
wire led;

LED_flash_1 LED_flash_a
(
    .clk(clk),
    .reset_n(reset_n),
    .led(led)
);

defparam LED_flash_a.MCNT = 12_500;

initial clk=1;
always#10 clk=~clk;

 initial begin
    reset_n = 0;
    #201;
    reset_n = 1;
    #2_000_0000;
    $stop;
 end

endmodule
