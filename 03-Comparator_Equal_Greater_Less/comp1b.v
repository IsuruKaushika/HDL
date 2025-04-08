//Gate Level
/*
module comp1b(
    input wire a,
    input wire b,
    output wire z
);

wire na,nb,na_or_nb;
wire a_or_b;

not NG1(na,a);
not NG2(nb,b);
and AND1(na_or_nb, na, nb);
and AND2(a_or_b, a, b);

or OR1(z, na_or_nb, a_or_b);


endmodule
*/
module comp1b
(
  input wire a,
  input wire b,
  output reg aeb,
  output reg agb,
  output reg alb
  
);

  always @(*) begin
    if (a == b) begin
      aeb = 1;  // Set c to 1 when a equals b
      agb = 0;
      alb = 0;
    end


    else if(a>b) begin
      aeb = 0;  // Set c to 0 when a does not equal b
      agb=1;
      alb=0;
    end
    
    else begin
        aeb=0;
        agb=0;
        alb=1;
  end

  end

endmodule


