// 在LED_flash_2的基础上，实现每隔一段时间（1S）执行一轮LED的八个状态切换控制

// 初步想法是再搞一个计数器用来记录空闲时间间隔，空闲则计数，LED运行时不计数

module LED_flash_3(
    clk,
    reset_n,
    SW,
    led);

    input clk;
    input reset_n;
    input [7:0] SW;
    output reg led;

    reg en_counter2; //使能信号
    wire en_counter;

    reg [25:0] counter;
    reg [3:0] counter1;
    reg [25:0] counter2;


    parameter MCNT = 12_500_000;
    parameter MCNT_1S = 50_000_000;


//counter计数模块
    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n) begin
            counter<=0;  
        end
        else if(en_counter)begin
        if(counter==MCNT-1)
            counter<=0; 
        else
            counter<=counter+1'b1;
    end
        else
            counter<=0;
    end

// counter1 计数模块
    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n) begin
            counter1<=0;
    end
        else if(counter==MCNT-1) 
            counter1<=(counter1+1'b1)%8;
    end


// counter2计数模块
    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n)
            counter2<=0; 
        else if(en_counter2)begin
        if(counter2==MCNT_1S-1)
            counter2<=0; 
        else
            counter2<=counter2+1'b1;
    end
        else
            counter2<=0;
    end

    // 控制信号模块
    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n)
            en_counter2<=1'b1;
        else if(counter1==7 && counter==MCNT-1)
            en_counter2<=1'b1;
        else if(counter2==MCNT_1S-1)
            en_counter2<=1'b0;
    end

    assign en_counter = ~en_counter2;


    always @(posedge clk or negedge reset_n) begin  
        if(!reset_n)
            led<=0;
        else if(en_counter2==1)
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












