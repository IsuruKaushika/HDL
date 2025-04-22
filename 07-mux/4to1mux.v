 module 4to1mux (
    input wire [2:0] a, // Input 1
    input wire [2:0] b, // Input 2
    input wire [2:0] c, // Input 3
    input wire [2:0] d, // Input 4
    input wire [1:0] se, // Select lines
    input wire en, // Enable signal
    output reg [2:0] y // Output
 );
// assign y = en? (se[1]? (se[0]? d : c) : (se[0]? b : a)) : 3'bz; // This is using in RTL modeling

always @(*) begin
    if (en)
        case (se)
            2'b00: y = a; // Select input A
            2'b01: y = b; // Select input B
            2'b10: y = c; // Select input C
            2'b11: y = d; // Select input D
            default: y = 2'bzz; // Default case (should not occur)
        endcase
    else 
        y = 2'bz; // High impedance when not enabled
    
    
end

 endmodule
