`timescale 1ns/1ps
`include "fulladder1b.v"

module tb();
    reg a;
    reg b;
    reg cin;
    wire s;
    wire cout;

    fulladder1b uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    initial begin
        $dumpfile("dump.vcd"); // dump file name
        $dumpvars(0, tb); 

        a=1'h0; b=1'h0; cin=1'h0;
        #10 a=1'h0; b=1'h0; cin=1'h1;
        #10 a=1'h0; b=1'h1; cin=1'h0;
        #10 a=1'h0; b=1'h1; cin=1'h1;
        #10 a=1'h1; b=1'h0; cin=1'h0;
        #10 a=1'h1; b=1'h0; cin=1'h1;
        #10 a=1'h1; b=1'h1; cin=1'h0;
        #10 a=1'h1; b=1'h1; cin=1'h1;

        #10 
        $finish;
    end

    initial begin
        $monitor("a + b + cin = (%b + %b + %b) -> s = %b, cout = %b", a, b, cin, s, cout);
    end
endmodule
