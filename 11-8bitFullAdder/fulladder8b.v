module fulladder1b(
    input wire [7:0]a,
    input wire [7:0]b,
    input wire cin,
    output wire [7:0]s,
    output wire cout
);

assign {cout,s}=a+b+cin;

endmodule