module com(
    input wire a,
    input wire b,
    output reg c
    );

always @(*) begin
    if(a==b) c=1;
    else c=0;
end
endmodule