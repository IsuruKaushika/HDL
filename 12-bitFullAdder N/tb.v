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

        a={N{1'b1}}; b={N{1'b1}}; cin=1;#10;
        $display("Edge Case: a=%b , b=%b, cin = %b -> sum=%b,cout=%b",a,b,cin,sum,cout);
        $finish; // End the simulation
    end



endmodule
