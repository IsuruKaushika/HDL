//RTL
/*
module mynotgate(
    input wire a, //input wire a
    output wire nota //output wire b
);

assign nota = ~a; //assign nota to the negation of a

endmodule

*/
// Gate Level
/*
module mynotgate(
    input wire a, //input wire a
    output wire nota //output wire b
);
not ng1(nota,a);

endmodule
*/

//Behavioral

module mynotgate(
    input wire a, //input wire a
    output reg nota //output wire b

);
always @(*) begin
    if(a) nota=0;//a==1
    else nota=1;
end
endmodule


