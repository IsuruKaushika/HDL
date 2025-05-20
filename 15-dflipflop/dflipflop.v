/* 
  D-Flip-Flop
  D - Data input
  CLK - Clock input
  RESET - Active-high reset input (asynchronous)
  EN - Enable input
  Q - Output

  Behavior:
  - On the rising edge of CLK:
    - If reset is high, Q is cleared to 0.
    - Else if enable is high, Q follows D.
    - Else, Q retains its value.
*/

module dflipflop (
  input wire d,        // D data input
  input wire clk,      // Clock input
  input wire en,       // Enable input
  input wire reset,    // Asynchronous reset input (active-high)
  output reg q         // Q output
);

  // Asynchronous reset with clocked behavior
  always @ (posedge clk or posedge reset) begin
    if (reset)
      q <= 1'b0;
    else if (en)
      q <= d;
  end

endmodule
