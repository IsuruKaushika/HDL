module intmwire(
    input wire a,
    input wire b,
    input wire c,
    output wire p,
    output wire q

);

wire intmwire;//additional wire

assign intmwire =a & b;
assign p = intmwire & c ;
assign q = intmwire | c;

endmodule

