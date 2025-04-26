module mykenotgate(
    input wire a, // Input signal
    output reg nota // Output signal (inverted)
    );
always @(*) begin
    if(a) nota=0;
    else nota=1;
end
endmodule