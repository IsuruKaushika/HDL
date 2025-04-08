`timescale 1ns/1ps
`include "comp1b2.v"
`include "comp1b1.v"

module comp10tb;
  reg [1:0] a;
  reg [1:0] b;
  wire aeb;
  wire agb;
  wire alb;

  // Instantiate the unit under test (UUT)
  comp1b uut(
    .a(a),
    .b(b),
    .aeb(aeb),
    .agb(agb),
    .alb(alb)
  );

  // Initial block for applying test vectors
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

    // Apply test cases
    a = 2'b00; b = 2'b00;
    #10 a = 2'b11; b = 2'b00;


    #10;
  end

  // Monitor the outputs
  initial begin
    $monitor("a = %b, b = %b, aeb = %b, agb = %b,agb = %b ", a, b, aeb,agb,alb);
  end

endmodule
