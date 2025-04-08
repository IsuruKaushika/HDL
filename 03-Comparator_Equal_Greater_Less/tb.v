`timescale 1ns/1ps
`include "comp1b.v"

module comp10tb;
  reg a;
  reg b;
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
    a = 0; b = 0;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
    #10 a = 0; b = 1;
    #10 a = 0; b = 0;

    #10;
  end

  // Monitor the outputs
  initial begin
    $monitor("a = %b, b = %b, aeb = %b, agb = %b,agb = %b ", a, b, aeb,agb,alb);
  end

endmodule
