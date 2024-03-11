

// 孔乙己说过：让fpga来实现跑马灯有三种算法
// 当然了，这里会把这三种方法都写一边，但是学习这个方法不是目的，毕竟这个实属不是什么难事
// 这么干的真正意义时为了学习Verilog的语法

// 所以。。。开始吧！跑马灯第二式——循环移位法！

module LED_run_2
(
    clk,
    reset_n,
    led);

    input clk;
    input reset_n;
    output reg [7:0] led;

    reg [24:0] counter;

    parameter MCNT = 25_000_000; 

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
            led<=8'b0000_0001;
        else if(counter==MCNT-1)begin
                led<={led[6:0],led[7]};
            end 
            else
                led<=led;
                           
            
    end
endmodule


// module LED_run_2(
//     Clk,
//     Reset_n,
//     Led
//  );
//     input Clk;
//     input Reset_n;
//     output reg[7:0]Led;
    
//     reg [24:0]counter;
    
//     always@(posedge Clk or negedge Reset_n)
//     if(!Reset_n)
//         counter <= 0;
// //    else if(counter == 25'd24999999)
//     else if(counter == 25'd24999)
//         counter <= 0;
//     else    
//         counter <= counter + 1'b1;
    
//     always@(posedge Clk or negedge Reset_n)
//     if(!Reset_n)        
//         Led <= 8'b0000_0001;
// //    else if(counter == 25'd24999999)begin
//     else if(counter == 25'd24999)begin           
//         Led <= {Led[6:0],Led[7]};
//     end
//     else
//         Led <= Led;

// endmodule
