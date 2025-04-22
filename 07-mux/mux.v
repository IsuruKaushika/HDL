 module simplemux (
 input wire [3:0] a, // Input 1
 input wire [3:0] b, // Input 2
 input wire se , // Select
 input wire en,//enable disanle
 output wire [3:0] c // Output
 ) ;
assign c = en ? (se ? a : b) : 4'bz; //This is using in RTL modeling
 
 endmodule
