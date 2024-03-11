`timescale 1ns / 1ps

// 3-8译码器法

module LED_run_3(
    clk,
    reset_n,
    led);

    input clk;
    input reset_n;
    output wire [7:0] led;

    reg [24:0] counter;
    reg [2:0] counter2;

    parameter MCNT = 25_000_000;

    decoder_3_8 decoder_3_8_inst1(
    .X(counter2),
    .Y(led)
    );

    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n)//复位
            counter<=0; //非阻塞赋值
        else if(counter==MCNT-1)
            counter<=0;
        else
            counter<=counter+1'b1;
    end

    always @(posedge clk or negedge reset_n) begin  
        if(!reset_n)
            counter2<=3'b000;
        else if(counter==MCNT-1)begin
            if(counter2==3'b111)
                counter2<=3'b000;
            else
                counter2<=counter2+1'b1;
        end            
            
    end
endmodule

