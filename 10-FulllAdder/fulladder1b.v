module fulladder1b(
    input wire a,
    input wire b,
    input wire cin,
    output wire s,
    output wire cout
);

assign {cout,s}=a+b+cin;

endmodule

module comp2bfull(
    input wire[1:0] a,
    input wire[1:0] b,
    output reg a_eq_b,
    output reg a_gt_b,
    output reg a_lt_b
);

always @(*) begin
    if(a==b)
    a_eq_b = (a == b);
    a_gt_b = (a > b);
    a_lt_b = (a < b);
end


module busz(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire c,
    output wire [3:0] p,
)

wire [3:0] cbus;

assign cbus ={4{c}};

assign p =( a&(~cbus)|
           b&cbus);
endmodule

module simplemux(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire sel,
    output wire [3:0] c,
);

assign c = sel? a:b;
endmodule



