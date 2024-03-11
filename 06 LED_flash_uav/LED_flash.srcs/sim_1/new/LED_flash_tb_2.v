`timescale 1ns / 1ps


module LED_flash_tb_2();

reg clk,reset_n;
wire led;
reg [7:0] SW;

LED_flash_2 LED_flash_a
(
    .clk(clk),
    .reset_n(reset_n),
    .led(led),
    .SW(SW)
);

defparam LED_flash_a.MCNT = 12_500;

initial clk=1;
always#10 clk=~clk;

 initial begin
    reset_n = 0;
    #201;
    reset_n = 1;
    SW=8'b0000_0001;
    #4000000;
    SW=8'b0101_1100;
    #4000000;
    $stop;
 end

endmodule
