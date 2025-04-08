//RTL
/*
module comp1b(
    input wire x, //input wire a
    input wire y, //input wire b
    output wire z //output wire b
);
wire xay,nx,ny,nxany; //x and y,not x,not y,not x and not y

and (xay,x,y); //and gate to get x and y
not (nx,x); //not gate to get not x
not (ny,y); //not gate to get not y
and (nxany,nx,ny); //and gate to get not x and not y
or  (z,xay,nxany); //or gate to get x and y or not x and not y


endmodule
*/

// Gate level

module comp1b(
    input wire a,
    input wire b,
    input wire z
);

wire na,nb,na_or_nb;
wire a_or_b;

not NG1(na,a);
not NG2(nb,b);
and AND1(na or nb, na, nb);
and AND2(a or b, a, b);

or OR1(z, na or nb, a or b);
endmodule

/*
module comp1b(
    input wire x, //input wire a is one bit
    input wire y, //input wire b
    output wire z //output wire b
);

assign z= (x & y) | (~x & ~y); //assign z to the result of x and y or not x and not y

endmodule
*/

//Behavioral
/*
module mynotgate(
    input wire a, //input wire a
    output reg nota //output wire b

);
always @(*) begin
    if(a) nota=0;//a==1
    else nota=1;
end
endmodule

*/
