module compb(
    input wire a, // Input signal
    input wire b, // Input signal
    output wire c // Output signal (comparison result)
    );

wire na,nb,na_and_nb;
wire a_and_b;

not NG1(na,a); // Invert a
not NG2(nb,b); // Invert b
and AG1(na_and_nb,na,nb); // AND gate for inverted inputs
and AG2(a_and_b,a,b); // AND gate for original inputs

or OG1(c,na_and_nb,a_and_b); // OR gate for final output

endmodule