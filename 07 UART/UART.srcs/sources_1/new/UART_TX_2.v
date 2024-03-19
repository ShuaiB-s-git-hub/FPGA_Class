`timescale 1ns / 1ps

// 虽然UART_TX_0这个项目写得跟屎一样，但是参照梅神的路子，咱还是可以学到很多的
// 比如一开始就要自顶向下的把项目设计好，不要上来就莽，想到哪写到哪，指定出问题呀
// 还有就是要学会取参数的名字，一定要让人看到名字就知道是什么东西


module UART_TX_2(
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

    reg [12:0] baud_cnt;
    parameter MCNT_BAUD = 5208;
    reg en_baud_cnt;

    reg [3:0] bit_cnt;
    parameter WIDTH = 10;

    parameter MCNT_DLY = 50_000_000;
    reg [25:0]delay_cnt;
    reg [7:0] r_Data;


// 波特率计数器(最小时间单位)
    always@(posedge clk or negedge reset_n)begin
        if(!reset_n)
            baud_cnt<=0;
        else if(en_baud_cnt)begin                  // 要是代码里有一个信号不着急实现，但是要先写出来，那就可以先不定义，这样编译器就会报错，防止代码出错，毕竟这东西不像C语言可以调试，这个出现逻辑错误就得程序员自己咔咔反思呀
            baud_cnt<=(baud_cnt+1'b1)%MCNT_BAUD;
            end
        else
            baud_cnt<=0;
    end

// 使能信号
    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n)
            en_baud_cnt<=0;
        else if(delay_cnt==MCNT_DLY-1)
            en_baud_cnt<=1'b1;
        else if((baud_cnt==MCNT_BAUD-1)&&(bit_cnt==WIDTH-1))
            en_baud_cnt<=0;
    end

    

// 时间单位计数器（控制时间在uart_tx端口发送）
    always@(posedge clk or negedge reset_n)begin
        if(!reset_n)
            bit_cnt<=0;
        else if(baud_cnt==MCNT_BAUD-1)
            bit_cnt<=(bit_cnt+1'b1)%WIDTH;
    end


// 延时计数器
    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n)
            r_Data<=0;            
        else if(delay_cnt==MCNT_DLY-1)
            r_Data<=data;
    end

    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n)
            delay_cnt<=0;
        else
            delay_cnt<=(delay_cnt+1'b1)%MCNT_DLY;
    end

// 位发送逻辑
    always @(posedge clk or negedge reset_n) begin  
        if(!reset_n)
            uart_tx<=1'b1;
        else if(en_baud_cnt)
        begin
            case(bit_cnt)
                0 : uart_tx<= 0;
                1 : uart_tx<= r_Data[0]; 
                2 : uart_tx<= r_Data[1];
                3 : uart_tx<= r_Data[2];
                4 : uart_tx<= r_Data[3];
                5 : uart_tx<= r_Data[4];
                6 : uart_tx<= r_Data[5];
                7 : uart_tx<= r_Data[6];
                8 : uart_tx<= r_Data[7];
                9 : uart_tx<= 1;
                default : uart_tx<=uart_tx;
            endcase                
        end

        else
            uart_tx<=1'b1;
    end


// led逻辑
    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n)
            led<=0;
        else if((baud_cnt==MCNT_BAUD-1)&&(bit_cnt==WIDTH-1))
            led<=~led;
    end



endmodule
