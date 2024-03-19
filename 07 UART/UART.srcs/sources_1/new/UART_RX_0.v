`timescale 1ns / 1ps

// 设计一个UART串口接收逻辑控制器，要求:
// 能够接收8位，无校验位，1位停止位的UART串口数据
// 能够通过一定的方式修改波特率(parameter)
// 每接收完一个数据，将接收到的数据结果显示到EDA扩展板的8位LED灯上
// 每接收完一个数据，将开发板上本身的PL LED状态翻转一次(注意是翻转，不是闪烁，效果同串口发送逻辑的一样)

module UART_RX_0(
    uart_rx,
    clk,
    reset_n,
    Rx_Done,
    Rx_data    
    );

    input uart_rx;
    input clk;
    input reset_n;
    output Rx_Done;
    output [7:0] Rx_data; 

    




endmodule
