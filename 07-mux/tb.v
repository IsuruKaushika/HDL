`timescale 1ns/1ps
`include "mux.v"

module simplemux_tb;

  // Inputs
  reg [3:0] a;
  reg [3:0] b;
  reg se;
  reg en;

  // Output
  wire [3:0] c;

  // Instantiate the Unit Under Test (UUT)
  simplemux uut (
    .a(a),
    .b(b),
    .se(se),
    .en(en),
    .c(c)
  );

  initial begin
    // Dump waveforms to VCD file
    $dumpfile("simplemux.vcd");
    $dumpvars(0, simplemux_tb);

    // Monitor changes
    $monitor("|input A|input B|select|enable|output C|");
    $monitor("| a = %b | b = %b | se = %b | en = %b | c = %b |", 
               a, b, se, en, c);

    // Test Case 1
    a = 4'b1010;
    b = 4'b0101;
    se = 0;  
    en = 0;  
    #10;

    // Test Case 2
    se = 1;  
    #10;

    // Test Case 3
    a = 4'b1111;
    b = 4'b0000;
    se = 0;  
    en = 1;
    #10;

    // Test Case 4
    se = 1;  
    #10;

    // Test Case 5 - Disabled mux
    en = 0;  
    #10;

    $finish;
  end

endmodule
