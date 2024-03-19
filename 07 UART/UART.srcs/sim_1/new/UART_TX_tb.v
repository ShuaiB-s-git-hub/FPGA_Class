`timescale 1ns / 1ps

module UART_TX_tb();

reg clk,reset_n;
wire led,uart_tx;
reg [7:0] data;

UART_TX_2#(
    .MCNT_DLY(50_000)
)
UART_TX_init(
    .data(data),
    .clk(clk),
    .reset_n(reset_n),
    .uart_tx(uart_tx),
    .led(led)
);



initial clk=1;
always#10 clk=~clk;

 initial begin
    reset_n = 0;
    #201;
    reset_n = 1;
    data=8'b1001_1001;
    #30000000;

    data=8'b1011_0101;
    #30000000;

    $stop;
 end


endmodule
