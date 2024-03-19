`timescale 1ns / 1ps


module LED_flash_tb_3();

reg clk,reset_n;
wire led;
reg [7:0] SW;

LED_flash_3 LED_flash_a
(
    .clk(clk),
    .reset_n(reset_n),
    .led(led),
    .SW(SW)
);

defparam LED_flash_a.MCNT = 12_500;
defparam LED_flash_a.MCNT_1S = 50_000;

initial clk=1;
always#10 clk=~clk;

 initial begin
    reset_n = 0;
    #201;
    reset_n = 1;
    SW=8'b1000_0001;
    #40000000;

    $stop;
 end

endmodule
