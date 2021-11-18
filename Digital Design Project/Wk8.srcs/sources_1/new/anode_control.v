`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 04:05:12 PM
// Design Name: 
// Module Name: anode_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module anode_control(
    input CLK100MHZ,
    input [15:0] sw,
    input [11:0] mic_in,
    output reg [5:0] level,
    output [15:0] led,
    output reg [0:6] seg,
    output reg [3:0] an
    );
    
    reg [26:0] COUNT = 0;
    reg [26:0] COUNT1 = 0;
    reg [11:0] volume = 0;
    reg [15:0] led_out = 0;
    
    wire out;
    
    adj_clk cl (CLK100MHZ, 2500, out);
    
    always @(posedge out) begin
        COUNT <= (COUNT == 5000) ? 0 : COUNT + 1;
        volume <= (COUNT == 0) ? mic_in : ((mic_in > volume) ? mic_in : volume);
        level <= volume[11] ? volume[10:7] : 0;
        
        case (level)
            1: led_out = 16'b1;
            2: led_out = 16'b11;
            3: led_out = 16'b111;
            4: led_out = 16'b1111;
            5: led_out = 16'b11111;
            6: led_out = 16'b111111;
            7: led_out = 16'b1111111;
            8: led_out = 16'b11111111;
            9: led_out = 16'b111111111;
            10: led_out = 16'b1111111111;
            11: led_out = 16'b11111111111;
            12: led_out = 16'b111111111111;
            13: led_out = 16'b1111111111111;
            14: led_out = 16'b11111111111111;
            15: led_out = 16'b111111111111111;
            default: led_out = 16'b0;
        endcase
        
    end
    
    always @(posedge CLK100MHZ) begin
        COUNT1 <= (COUNT1 == 10000) ? 0 : COUNT1 + 1;
        if (COUNT1 >= 0) begin
            an = 4'b0111;
            seg = 7'b0000001;
        end
            
        
        if (COUNT1 >= 2500) begin
            an = 4'b1011;
            seg = 7'b0000001;
        end
        
        if (COUNT1 >= 5000) begin
            an = 4'b1101;
            if (sw[1] == 0) begin
                if (level > 9) begin
                    seg = 7'b1001111;
                end else
                    seg = 7'b0000001;
            end else begin
                seg = 7'b0000001;
            end
        end
        
        if (COUNT1 >= 7500) begin
            an = 4'b1110;
            if (sw[1] == 0) begin
                case (level)
                    1: seg = 7'b1001111;
                    2: seg = 7'b0010010;
                    3: seg = 7'b0000110;
                    4: seg = 7'b1001100;
                    5: seg = 7'b0100100;
                    6: seg = 7'b0100000;
                    7: seg = 7'b0001111;
                    8: seg = 7'b0000000;
                    9: seg = 7'b0000100;
                    11: seg = 7'b1001111;
                    12: seg = 7'b0010010;
                    13: seg = 7'b0000110;
                    14: seg = 7'b1001100;
                    15: seg = 7'b0100100;
                    default: seg = 7'b0000001;
                endcase
            end else begin
                case (level)
                    1: seg = 7'b1110001;
                    2: seg = 7'b1110001;
                    3: seg = 7'b1110001;
                    4: seg = 7'b1110001;
                    5: seg = 7'b1110001;
                    6: seg = 7'b0101011;
                    7: seg = 7'b0101011;
                    8: seg = 7'b0101011;
                    9: seg = 7'b0101011;
                    10: seg = 7'b0101011;
                    11: seg = 7'b1001000;
                    12: seg = 7'b1001000;
                    13: seg = 7'b1001000;
                    14: seg = 7'b1001000;
                    15: seg = 7'b1001000;
                    default: seg = 7'b0000001;
                endcase
            end
        end
    end
    
    assign led = (sw[0] == 0) ? mic_in : led_out; 
    
endmodule
