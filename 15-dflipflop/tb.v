`timescale 1ns/1ps
`include "dflipflop.v"

module tb();

  reg d;
  reg clk;
  reg en;
  reg reset;
  wire q;

  // Instantiate the D flip-flop module
  dflipflop uut (
    .d(d),
    .clk(clk),
    .en(en),
    .reset(reset),
    .q(q)
  );

  // Dump waveform data (for GTKWave)
  initial begin
    $dumpfile("dump.vcd");    // Create VCD file
    $dumpvars(0, tb);         // Dump all variables in the module
  end

  // Clock generation
  initial begin
    clk <= 0;
    forever begin
      #5 clk <= ~clk;         // Toggle clock every 5 ns
    end
  end

  // Stimulus
  initial begin
    en = 1; reset = 0; d = 0;
    #3  d = 1;
    #9  d = 0;
    #6  d = 1;
    #10 d = 0;
    #20 d = 1;
    #23 reset = 1;
    #5  reset = 0;
    #10 en = 0;               // Disable flip-flop
    #3  d = 1;
    #9  d = 0;
    #6  d = 1;
    #23 reset = 1;
    #5  reset = 0;
    #10;
    $finish;
  end

  // Monitor signals
  initial begin
    $monitor("t=%3d, reset=%1b, en=%1b, clk=%1b, d=%1b, q=%1b", 
              $time, reset, en, clk, d, q);
  end

endmodule
