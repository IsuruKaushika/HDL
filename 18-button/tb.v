`timescale 1ns / 1ps
`include "button.v"  // Ensure this filename matches your top module

module tb_top_module;

    // Testbench signals
    reg clk;
    reg reset;
    reg button_in;
    wire led;

    // Instantiate the DUT (Device Under Test)
    top_module uut (
        .clk(clk),
        .reset(reset),
        .button_in(button_in),
        .led(led)
    );

    // Generate a 100 MHz clock (10 ns period)
    initial clk = 0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        // Create VCD file for GTKWave
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_top_module);  // Dump testbench signals
        $dumpvars(1, uut);            // Dump internal DUT signals (e.g., led_status)

        // Header and monitoring
        $display("Time\tclk\treset\tbutton_in\tled");
        $monitor("%0dns\t%b\t%b\t%b\t\t%b", $time, clk, reset, button_in, led);

        // Initial values
        reset = 1;
        button_in = 0;
        #12;               // Hold reset

        reset = 0;
        #10;

        // Simulate button press (LED ON expected)
        button_in = 1;
        #20;

        // Keep holding (LED remains ON)
        button_in = 1;
        #20;

        // Release button (LED OFF expected)
        button_in = 0;
        #20;

        // Press again (LED ON expected)
        button_in = 1;
        #15;

        // Release (LED OFF expected)
        button_in = 0;
        #20;

        // Press again (LED ON expected)
        button_in = 1;
        #10;

        // Apply reset during button press
        reset = 1;
        #10;

        // Release reset and button
        reset = 0;
        button_in = 0;
        #20;

        // Final test: rapid toggling
        button_in = 1; #5;
        button_in = 0; #5;
        button_in = 1; #5;
        button_in = 0; #10;

        $finish;
    end

endmodule
