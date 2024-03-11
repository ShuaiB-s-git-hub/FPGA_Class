module LED_flash
(
    clk,
    reset_n,
    led);

    input clk;
    input reset_n;
    output reg led;

//  板子上的PL端晶振是50Mhz，要完成每秒翻转led的任务（500ms亮，500ms灭）
//  则需要计数25_000_000 ,起码需要25个二进制位才能表示?
    reg [24:0] counter;

    always @(posedge clk or negedge reset_n) begin  //posedge clk or negedge reset_n 到来的时候，这个always语句模块才工作?
        if(!reset_n)//复位
            counter<=0; //非阻塞赋值
        else if(counter==24_999_999)
            counter<=0;
        else
            counter<=counter+1'b1;
    end

    always @(posedge clk or negedge reset_n) begin  
        if(!reset_n)
            led<=1'b0;
        else if(counter==24_999_999)
            led<=~led;
            
    end
endmodule
