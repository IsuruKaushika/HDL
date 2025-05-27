`timescale 1ns/1ps
`include "fsm-moore.v"

module dividedby3FSM_tb;

    reg clk;
    reg reset;
    wire y;

    // Instantiate the DUT (Device Under Test)
    dividedby3FSM uut (
        .clk(clk),
        .reset(reset),
        .y(y)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus and waveform generation
    initial begin
        $dumpfile("dump.vcd");

        // Dump everything, including internal signals
        $dumpvars(0, dividedby3FSM_tb);

        // Terminal output for reset and y (state not shown in terminal, but will appear in GTKWave)
        $monitor("Time = %0t | reset = %b | y = %b", $time, reset, y);

        // Reset pulse
        reset = 1;
        #10;
        reset = 0;

        #100;
        $finish;
    end

endmodule
