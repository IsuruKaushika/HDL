module dividedby3FSM(
    input clk,
    input reset,
    output y
);

    reg [2:0] state, next_state; // Only need 2 bits (00, 01, 10)

    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S0;
            default: next_state = S0;
        endcase
    end

    // Output logic
    assign y = (state == S0);

endmodule
