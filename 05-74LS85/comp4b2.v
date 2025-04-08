
module comp1b
(
  input wire [7:4]a,
  input wire [7:4]b,
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


