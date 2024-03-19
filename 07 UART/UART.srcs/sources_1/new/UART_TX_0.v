`timescale 1ns / 1ps

// 设计一个串口发送模块，发送用户输入的数据给电脑，要求:
// 波特率为9600
// 8位数据位
// 1位停止位
// 无校验位
// 无流控功能
// 每1s发送一次当前8位拨码开关的值每次发送完成后将LED0的状态翻转

module UART_TX_0(
    data,
    clk,
    reset_n,
    uart_tx,
    led
);
    input [7:0]data;
    input clk;
    input reset_n;
    
    output reg uart_tx;
    output reg led;

    reg [25:0] counter;
    reg [12:0] count_baud;
    reg [4:0] count_num;

    parameter baud = 5208;  
    parameter width = 8+2;
    parameter MCNT_1S = 50_000_000-baud;

    reg en_counter;
    wire en_counter_num;



    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n) begin
            counter<=0;
            led<=1'b1;  
        end
        else if(en_counter)begin
        if(counter==MCNT_1S-1)
            counter<=0; 
        else
            counter<=counter+1'b1;
    end
        else
            counter<=0;
    end



    always @(posedge clk or negedge reset_n) begin
        if(!reset_n)
            count_baud<=1'b0;
        else 
            count_baud<=(count_baud+1'b0)%baud;
    end 


    always @(posedge clk or negedge reset_n) begin
        if(!reset_n)
            count_num<=1'b0;
        else if(en_counter_num)begin
            if(count_baud == baud-1)
            count_num<=(count_num+1'b1)%width;
            end
        else
            count_num<=1'b0;
    end 




        always @(posedge clk or negedge reset_n) begin 
        if(!reset_n)
            en_counter<=1'b1;
        else if(count_num==7 && count_baud == baud-1)begin
            en_counter<=1'b1;
            led<=~led;
            end
        else if(counter==MCNT_1S-1)
            en_counter<=1'b0;
    end

    assign en_counter_num = ~en_counter;



    always @(posedge clk or negedge reset_n) begin  
        if(!reset_n)
            uart_tx<=0;
        else if(en_counter==1)
            uart_tx<=0;
        else begin
            case(count_baud)
                0 : uart_tx<= 0;
                1 : uart_tx<= data[0]; 
                2 : uart_tx<= data[1];
                3 : uart_tx<= data[2];
                4 : uart_tx<= data[3];
                5 : uart_tx<= data[4];
                6 : uart_tx<= data[5];
                7 : uart_tx<= data[6];
                8 : uart_tx<= data[7];
                9 : uart_tx<= 1;
                default : uart_tx<=uart_tx;
            endcase                
        end
    end

endmodule


