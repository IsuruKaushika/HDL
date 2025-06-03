module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input button_in,
    output reg led
    ); 

    parameter LED_ON = 1'b1 ;
    parameter LED_OFF = 1'b0;
    reg led_status;
    parameter STATE_LED_OFF = 1'b0;
    parameter STATE_LED_ON = 1'b1;
    parameter BTN_pressed = 1'b1; // Button pressed state
    parameter BTN_released = 1'b0; // Button active high


    always @(posedge clk or reset) begin
        if (reset) begin
            led <= LED_OFF; // Reset LED to OFF state
        end 
        else begin
        case (led_status)
            STATE_LED_ON: begin
                if (button_in==BTN_released) begin
                    led <= LED_OFF; 
                    led_status <= STATE_LED_OFF;
                end else begin
                    led <= LED_ON; // Keep LED OFF if button is not pressed
                end
            end
            
            STATE_LED_OFF: begin
                if (button_in==BTN_pressed) begin
                    led <= STATE_LED_ON; // Turn LED OFF when button is released
                    led_status <= STATE_LED_ON; // Update state to LED OFF
                    
                end else begin
                    led <= LED_OFF; // Keep LED ON if button is still pressed
                end
            end
            
            default: begin
                led <= LED_OFF; // Default case, should not happen in normal operation
                led_status <= STATE_LED_OFF;
            end
        endcase 
        end

    end    
endmodule