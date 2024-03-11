`timescale 1ns/1ns
module decoder_3_8_tb();

reg [2:0] X_in;
wire [7:0]Y_out;

decoder_3_8 decoder_3_8_a(
    .X(X_in),
    .Y(Y_out)
);

initial begin
    X_in=3'b000;
    #20;
    X_in=3'b001;
    #20;
    X_in=3'b010;
    #20;
    X_in=3'b011;
    #20;
    X_in=3'b100;
    #20;
    X_in=3'b101;
    #20;
    X_in=3'b110;
    #20;
    X_in=3'b111;
    #20;
    $stop;
    end
    

endmodule

