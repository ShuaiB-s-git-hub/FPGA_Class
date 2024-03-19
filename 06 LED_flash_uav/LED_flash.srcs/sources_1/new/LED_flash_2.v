// 以0.25秒为基本的LED状态变化间隔(最小时间单元)
// 以8个小段为一个循环周期(参考任务2的10个小段)
// LED在每一小段该点亮还是熄灭，由一个8位的输入端口指定

module LED_flash_2
(
    clk,
    reset_n,
    SW,
    led);

    input clk;
    input reset_n;
    input [7:0] SW;
    output reg led;

    reg [24:0] counter;
    reg [3:0] counter1;

    parameter MCNT = 12_500_000;

    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n) begin
            counter<=0; 
            counter1<=0;
        end
        else if(counter==MCNT-1) begin
            counter<=0; 
            counter1<=(counter1+1'b1)%8;
        end
        else
            counter<=counter+1'b1;
    end



    always @(posedge clk or negedge reset_n) begin  
        if(!reset_n)
            led<=0;
        else begin
            case(counter1)
                0 : led<= SW[0]; 
                1 : led<= SW[1];
                2 : led<= SW[2];
                3 : led<= SW[3];
                4 : led<= SW[4];
                5 : led<= SW[5];
                6 : led<= SW[6];
                7 : led<= SW[7];
                default : led<=led;
            endcase                
        end
    end
endmodule












