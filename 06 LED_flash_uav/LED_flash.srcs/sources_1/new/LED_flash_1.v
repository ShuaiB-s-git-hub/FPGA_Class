// // 完成任务，LED闪烁0.25秒，熄灭0.5秒，亮0.75秒，熄灭1秒，如此交替循环

// // 其实这个还可以写一个计数器来记录上述所有数字的最大公因数（0.25）的倍数，然后使用case语句来实现功能

// 这里给出了两种写法

module LED_flash_1
(
    clk,
    reset_n,
    led);
    input clk;
    input reset_n;
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
            counter1<=(counter1+1'b1)%10;
        end
        else
            counter<=counter+1'b1;
    end



    always @(posedge clk or negedge reset_n) begin  
        if(!reset_n)
            led<=0;
        else begin
            case(counter1)
                0 : led<= 1; 
                1 : led<= 0;
                2 : led<= 0;
                3 : led<= 1;
                4 : led<= 1;
                5 : led<= 1;
                6 : led<= 0;
                7 : led<= 0;
                8 : led<= 0;
                9 : led<= 0;
                default : led<=led;
            endcase                
        end
    end
endmodule












// 完成任务，LED闪烁0.25秒，熄灭0.5秒，亮0.75秒，熄灭1秒，如此交替循环

// 其实这个还可以写一个计数器来记录上述所有数字的最大公因数（0.25）的倍数，然后使用case语句来实现功能

// module LED_flash_1
// (
//     clk,
//     reset_n,
//     led);

//     input clk;
//     input reset_n;
//     output reg led;

//     reg [24:0] counter;
//     reg [3:0] counter1;

//     parameter MCNT = 12_500_000;

//     always @(posedge clk or negedge reset_n) begin 
//         if(!reset_n)             counter<=0; 
//         else if(counter==MCNT-1)
//             counter<=0;
//         else
//             counter<=counter+1'b1;
//     end

//     always @(posedge clk or negedge reset_n) begin 
//     if(!reset_n) 
//         counter1<=0; 
//     else if(counter==MCNT-1) begin
//         if(counter1==9)
//             counter1<=0;
//         else
//             counter1<=counter1+1'b1;
//     end
//     end


//     always @(posedge clk or negedge reset_n) begin  
//         if(!reset_n)
//             led<=0;
//         else begin
//             case(counter1)
//                 0 : led<= 1; 
//                 1 : led<= 0;
//                 2 : led<= 0;
//                 3 : led<= 1;
//                 4 : led<= 1;
//                 5 : led<= 1;
//                 6 : led<= 0;
//                 7 : led<= 0;
//                 8 : led<= 0;
//                 9 : led<= 0;
//                 default : led<=led;
//             endcase                
//         end

//     end
// endmodule

