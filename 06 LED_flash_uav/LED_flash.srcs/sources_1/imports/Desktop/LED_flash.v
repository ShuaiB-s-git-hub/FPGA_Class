// 完成任务，LED闪烁0.25秒，熄灭0.75秒，如此交替循环

module LED_flash
(
    clk,
    reset_n,
    led);

    input clk;
    input reset_n;
    output reg led;

    reg [24:0] counter;

    // parameter LED_1 = 12_500_000;
    // parameter MCNT = 50_000_000;
    parameter LED_1 = 25_000_000;
    parameter MCNT = 100_000_000;

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
            led<=1'b0;
        else if(counter==0)
            led<=1'b1;
        else if(counter==LED_1)
            led<=1'b0;
        // else if(counter==LED_2-1)
        //     led<=1'b0;
    end
endmodule
