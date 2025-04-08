`timescale 1ns/1ps
`include "mynotgate.v"

module tb();
    reg a;
    wire nota; 

mynotgate uut(
    .a(a), //input wire a
    .nota(nota) //output wire b
);
//mynotgate uut2(.a(nota),.nota(b));

initial begin
    a=0;
    //dump Waveform Data(for GTK  Wave)
    $dumpfile("dump.vcd"); //dump file name
    $dumpvars(0,tb); //dump all variables in the module tb//tb=test bench if tb=1 is est becnch 1
    #10; a=1;
    #10; a=0;
    #10; a=1;
    #10; a=0;
end
initial begin
    //monitor the changes in the variables
    $monitor("a=%b, not a=%b", a, nota); //display the values of a and nota
end

endmodule //tb