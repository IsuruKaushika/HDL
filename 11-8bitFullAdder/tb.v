`timescale 1ns/1ps
`include "fulladder1b.v"

module tb();
    reg [7:0]a;
    reg [7:0]b;
    reg cin;
    wire [7:0]s;
    wire cout;

    fulladder8b uut (
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
        $monitor("a + b + cin = (%8b + %8b + %9b) -> s = %8b, cout = %b", a, b, cin, s, cout);
    end
endmodule
