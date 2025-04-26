module comp1b(
    input wire a, // Input signal
    input wire b, // Input signal
    output wire c // Output signal (comparison result)
    );

//RTL
assign c =(~a & ~b)|(a & b); // Compare the two signals

endmodule