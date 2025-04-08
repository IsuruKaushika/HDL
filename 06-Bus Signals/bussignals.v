
module bussignals
(
  input wire [3:0]a,
  input wire [3:0]b,
  input wire c,
  output wire [3:0]p //output is also a wire 
);

wire [3:0] cbus;
assign cbus ={4{c}};

assign p =(a & (~cbus) | (b & cbus)) ;

endmodule


