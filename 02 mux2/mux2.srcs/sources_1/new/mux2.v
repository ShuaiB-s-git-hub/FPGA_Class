// 在这里完成一个二选一的数据选择器

 // Verilog代码区分大小写
module mux2(   // 声明端口
    a,b,
    sel,
    out
);
    input a,b,sel; //声明信号的方向
    output out;
// 当sel等于0的时候 out为a，否则为b
// 在这里使用assign语句实现
    assign out = (sel==0)?a:b;  // 这里基本上就跟C语言一毛一样
    
endmodule