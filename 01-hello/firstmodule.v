// start Module 
//Module Represent a circuit
module firstmodule();

//procedural block
//initial block
//circuit that runs once at the power on
initial begin
    //output goes to console,file,..
    $display("Hello, World!");//cannot be synthesized//to the console
    $finish;//indicate the end of simulation
    end
endmodule
//end of the module