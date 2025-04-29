`timescale 1ns/1ps
`include "fulladderNb.v"

module tb();

    // Parameter
    parameter N = 16;

    // Signals
    reg  [N-1:0] a;
    reg  [N-1:0] b;
    reg          cin;
    wire [N-1:0] sum;
    wire         cout;

    integer i,j;

    // Instantiate the DUT
    fulladderNb #(.N(N)) uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );


    always @(*) begin

        for (i = 0; i <( 1 << N); i = i + 1) begin
            for (j = 0; j < (1<<N); j = j + 1) begin

                a = i; b = j; cin = 0;
                #10; // Wait for the output to stabilize
                
                $display("a=%b b=%b, cin = %b -> sum=%b,cout=%b",a);

                cin = 1;
                #10; // Wait for the output to stabilize
                $display("a=%b b=%b, cin = %b -> sum=%b,cout=%b",a);    
            
            end
        end
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        a = 16'h0000; b = 16'h0000; cin = 0; #10;
        a = 16'h0001; b = 16'h0001; cin = 0; #10;
        a = 16'h00FF; b = 16'h0001; cin = 0; #10;
        a = 16'hAAAA; b = 16'h5555; cin = 1; #10;
        a = 16'h000F; b = 16'h00F0; cin = 1; #10;
        a = 16'h7FFF; b = 16'h0001; cin = 1; #10;
        a = 16'hFFFF; b = 16'hFFFF; cin = 1; #10;

        #10 $finish;
    end

    initial begin
        $monitor("a = %h, b = %h, cin = %b => sum = %h, cout = %b", a, b, cin, sum, cout);
    end

endmodule
