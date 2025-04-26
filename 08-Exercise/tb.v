`timescale 1ns/1ps
`include "mynotgatebehave.v"

module tb();
reg a;
wire nota;

mykenotgate  uut(
    .a(a),
    .nota(nota)
);

initial begin
    a=0;

    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    #10 a=1;
    #10 a=0;
    #10 a=1;
    #10 a=0;

end

initial begin
    $monitor("a=%b, nota=%b", a, nota);
end

endmodule