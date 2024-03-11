module decoder_3_8(
    X,
    Y
);

    input [2:0] X;
    output reg [7:0] Y;

    always@(*)begin
        case(X)
            3'd0: Y = 8'b0000_0001;
            3'd1: Y = 8'b0000_0010;
            3'd2: Y = 8'b0000_0100;
            3'd3: Y = 8'b0000_1000;
            3'd4: Y = 8'b0001_0000;
            3'd5: Y = 8'b0010_0000;
            3'd6: Y = 8'b0100_0000;
            3'd7: Y = 8'b1000_0000;
         default: Y = 8'b0000_0000;
        endcase
    end
    
//    always@(*)begin
//        case({a,b,c})
//            3'd0: out = 8'b0000_0001;
//            3'd1: out = 8'b0000_0010;
//            3'd2: out = 8'b0000_0100;
//            3'd3: out = 8'b0000_1000;
//            3'd4: out = 8'b0001_0000;
//            3'd5: out = 8'b0010_0000;
//            3'd6: out = 8'b0100_0000;
//            3'd7: out = 8'b1000_0000;
//        endcase
//    end
endmodule
