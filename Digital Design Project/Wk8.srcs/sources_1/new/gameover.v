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


module gameover(
    input CLOCK,
    input [12:0] pixel_index,
    output reg [15:0] pixel_data
    );
    
    always @(posedge CLOCK) begin
        case (pixel_index)
            3000: pixel_data = 16'b1111011111111110;
        3001: pixel_data = 16'b1111011111011110;
        3005: pixel_data = 16'b1111111111011111;
        3006: pixel_data = 16'b1111011111011111;
        3009: pixel_data = 16'b1111111111111110;
        3013: pixel_data = 16'b1111011111011111;
        3015: pixel_data = 16'b1111111111011111;
        3016: pixel_data = 16'b1111111111111111;
        3017: pixel_data = 16'b1111111111011111;
        3018: pixel_data = 16'b1111011111111111;
        3021: pixel_data = 16'b1111011111111110;
        3022: pixel_data = 16'b1111111111011111;
        3025: pixel_data = 16'b1111111111111111;
        3029: pixel_data = 16'b1111011111111111;
        3031: pixel_data = 16'b1111111111111111;
        3032: pixel_data = 16'b1111111111011110;
        3033: pixel_data = 16'b1111011111011110;
        3034: pixel_data = 16'b1111111111111111;
        3036: pixel_data = 16'b1111111111111110;
        3037: pixel_data = 16'b1111011111011111;
        3038: pixel_data = 16'b1111111111111110;
        3042: pixel_data = 16'b1111011111011111;
        3046: pixel_data = 16'b1111111111011111;
        3050: pixel_data = 16'b1111111111011111;
        3095: pixel_data = 16'b1111111111111111;
        3100: pixel_data = 16'b1111011111111110;
        3103: pixel_data = 16'b1111011111111111;
        3105: pixel_data = 16'b1111111111111110;
        3106: pixel_data = 16'b1111011111111111;
        3108: pixel_data = 16'b1111011111011110;
        3109: pixel_data = 16'b1111111111011111;
        3111: pixel_data = 16'b1111111111111111;
        3116: pixel_data = 16'b1111011111011110;
        3119: pixel_data = 16'b1111111111011111;
        3121: pixel_data = 16'b1111011111111110;
        3125: pixel_data = 16'b1111011111111111;
        3127: pixel_data = 16'b1111011111111111;
        3132: pixel_data = 16'b1111111111011110;
        3135: pixel_data = 16'b1111011111111110;
        3138: pixel_data = 16'b1111111111111111;
        3142: pixel_data = 16'b1111111111111111;
        3146: pixel_data = 16'b1111111111111111;
        3191: pixel_data = 16'b1111011111111111;
        3193: pixel_data = 16'b1111111111011110;
        3194: pixel_data = 16'b1111011111011110;
        3196: pixel_data = 16'b1111111111011110;
        3197: pixel_data = 16'b1111111111011110;
        3198: pixel_data = 16'b1111111111011111;
        3199: pixel_data = 16'b1111011111111110;
        3201: pixel_data = 16'b1111111111011111;
        3203: pixel_data = 16'b1111011111011110;
        3205: pixel_data = 16'b1111011111111111;
        3207: pixel_data = 16'b1111111111111110;
        3208: pixel_data = 16'b1111011111011110;
        3209: pixel_data = 16'b1111111111111111;
        3212: pixel_data = 16'b1111111111111111;
        3215: pixel_data = 16'b1111111111011111;
        3218: pixel_data = 16'b1111111111111111;
        3220: pixel_data = 16'b1111011111111110;
        3223: pixel_data = 16'b1111111111111110;
        3224: pixel_data = 16'b1111011111011111;
        3225: pixel_data = 16'b1111111111111111;
        3228: pixel_data = 16'b1111111111011111;
        3229: pixel_data = 16'b1111111111011110;
        3230: pixel_data = 16'b1111011111111111;
        3234: pixel_data = 16'b1111111111111111;
        3238: pixel_data = 16'b1111111111111111;
        3242: pixel_data = 16'b1111111111111111;
        3287: pixel_data = 16'b1111111111011110;
        3290: pixel_data = 16'b1111111111011110;
        3292: pixel_data = 16'b1111111111011111;
        3295: pixel_data = 16'b1111111111011110;
        3297: pixel_data = 16'b1111011111011110;
        3301: pixel_data = 16'b1111011111111110;
        3303: pixel_data = 16'b1111011111011111;
        3308: pixel_data = 16'b1111111111111110;
        3311: pixel_data = 16'b1111011111111110;
        3314: pixel_data = 16'b1111011111111110;
        3316: pixel_data = 16'b1111111111011111;
        3319: pixel_data = 16'b1111011111011111;
        3324: pixel_data = 16'b1111011111011110;
        3326: pixel_data = 16'b1111111111111110;
        3384: pixel_data = 16'b1111111111011110;
        3385: pixel_data = 16'b1111111111111111;
        3388: pixel_data = 16'b1111111111111110;
        3391: pixel_data = 16'b1111011111011110;
        3393: pixel_data = 16'b1111111111111111;
        3397: pixel_data = 16'b1111011111111111;
        3399: pixel_data = 16'b1111011111011111;
        3400: pixel_data = 16'b1111111111011110;
        3401: pixel_data = 16'b1111111111011111;
        3402: pixel_data = 16'b1111111111011110;
        3405: pixel_data = 16'b1111011111111110;
        3406: pixel_data = 16'b1111111111111110;
        3411: pixel_data = 16'b1111011111111110;
        3415: pixel_data = 16'b1111011111011111;
        3416: pixel_data = 16'b1111111111011110;
        3417: pixel_data = 16'b1111111111011110;
        3418: pixel_data = 16'b1111011111111110;
        3420: pixel_data = 16'b1111111111011110;
        3423: pixel_data = 16'b1111111111111111;
        3426: pixel_data = 16'b1111011111011111;
        3430: pixel_data = 16'b1111111111011111;
        3434: pixel_data = 16'b1111111111011110;
        default: pixel_data = 16'b0;
        endcase
    end
    
endmodule