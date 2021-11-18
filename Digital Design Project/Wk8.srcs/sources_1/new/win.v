`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 07:52:54 PM
// Design Name: 
// Module Name: game_background
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


module gamewin(
    input CLOCK,
    input [12:0] pixel_index,
    output reg [15:0] pixel_data
    );
    
    always @(posedge CLOCK) begin
        case (pixel_index)
            2909: pixel_data = 16'b1111011111111110;
        2913: pixel_data = 16'b1111011111011111;
        2916: pixel_data = 16'b1111111111111110;
        2917: pixel_data = 16'b1111011111111111;
        2920: pixel_data = 16'b1111011111111110;
        2923: pixel_data = 16'b1111111111111110;
        2927: pixel_data = 16'b1111111111111111;
        2931: pixel_data = 16'b1111111111111111;
        2933: pixel_data = 16'b1111111111011111;
        2934: pixel_data = 16'b1111011111111110;
        2935: pixel_data = 16'b1111011111111111;
        2937: pixel_data = 16'b1111011111111110;
        2940: pixel_data = 16'b1111111111111111;
        2943: pixel_data = 16'b1111011111111111;
        2947: pixel_data = 16'b1111111111011110;
        2951: pixel_data = 16'b1111111111011111;
        3005: pixel_data = 16'b1111111111011110;
        3009: pixel_data = 16'b1111011111111111;
        3011: pixel_data = 16'b1111011111011110;
        3014: pixel_data = 16'b1111111111011111;
        3016: pixel_data = 16'b1111111111111111;
        3019: pixel_data = 16'b1111011111111111;
        3023: pixel_data = 16'b1111111111111110;
        3027: pixel_data = 16'b1111111111011110;
        3030: pixel_data = 16'b1111111111011111;
        3033: pixel_data = 16'b1111011111011110;
        3034: pixel_data = 16'b1111111111011111;
        3036: pixel_data = 16'b1111011111011110;
        3039: pixel_data = 16'b1111111111111111;
        3043: pixel_data = 16'b1111011111111111;
        3047: pixel_data = 16'b1111111111111111;
        3102: pixel_data = 16'b1111011111111110;
        3103: pixel_data = 16'b1111011111111111;
        3104: pixel_data = 16'b1111111111111110;
        3107: pixel_data = 16'b1111111111111110;
        3110: pixel_data = 16'b1111111111111111;
        3112: pixel_data = 16'b1111011111011110;
        3115: pixel_data = 16'b1111011111111110;
        3119: pixel_data = 16'b1111111111011110;
        3121: pixel_data = 16'b1111011111011110;
        3123: pixel_data = 16'b1111011111111110;
        3126: pixel_data = 16'b1111111111011111;
        3129: pixel_data = 16'b1111111111011110;
        3131: pixel_data = 16'b1111111111011110;
        3132: pixel_data = 16'b1111011111011111;
        3135: pixel_data = 16'b1111111111111111;
        3139: pixel_data = 16'b1111111111111110;
        3143: pixel_data = 16'b1111111111111110;
        3199: pixel_data = 16'b1111111111111110;
        3203: pixel_data = 16'b1111111111111111;
        3206: pixel_data = 16'b1111011111011110;
        3208: pixel_data = 16'b1111111111011110;
        3211: pixel_data = 16'b1111111111011110;
        3215: pixel_data = 16'b1111111111111110;
        3216: pixel_data = 16'b1111011111011110;
        3218: pixel_data = 16'b1111011111111111;
        3219: pixel_data = 16'b1111011111011110;
        3222: pixel_data = 16'b1111111111111110;
        3225: pixel_data = 16'b1111111111111111;
        3228: pixel_data = 16'b1111111111111111;
        3295: pixel_data = 16'b1111011111111110;
        3300: pixel_data = 16'b1111111111011110;
        3301: pixel_data = 16'b1111111111011110;
        3305: pixel_data = 16'b1111111111111110;
        3306: pixel_data = 16'b1111111111011110;
        3311: pixel_data = 16'b1111011111111110;
        3315: pixel_data = 16'b1111011111111110;
        3317: pixel_data = 16'b1111111111111111;
        3318: pixel_data = 16'b1111111111011111;
        3319: pixel_data = 16'b1111111111111111;
        3321: pixel_data = 16'b1111011111011110;
        3324: pixel_data = 16'b1111011111011110;
        3327: pixel_data = 16'b1111111111011111;
        3331: pixel_data = 16'b1111111111011111;
        3335: pixel_data = 16'b1111111111111111;
        default: pixel_data = 16'b0;
        endcase
    end
    
endmodule