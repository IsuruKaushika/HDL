`timescale 1ns/1ps
`include "compb1Behave.v"

module tb();

    reg a;
    reg b;
    wire c;

    com uut(
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        a=0; b=0;
        #10 a=0; b=1;
        #10 a=1; b=0;
        #10 a=1; b=1;
        #10 a=0; b=0;
        #10 a=0; b=1;
        #10;
    end

    initial begin
        $monitor("a=%b, b=%b, c=%b", a, b, c);
    end

endmodule

