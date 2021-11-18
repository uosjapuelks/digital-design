`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2021 12:44:20 AM
// Design Name: 
// Module Name: score_board
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

module score_board(
input CLOCK,
input slowclk,
input [15:0]bg_data,
output reg [15:0] pixel_data,
input [12:0]pixel_index,
input [4:0]score_in,
input [12:0]pos_row,
input [12:0]pos_col
    );
    reg [2:0]count;
    reg [12:0]row;
    reg [12:0]col;
    reg [12:0]track_index;
    reg [31:0] frame_count = 0;
    reg [4:0] score;
    
    always @ (posedge CLOCK) begin
        row = pixel_index / 96 - pos_row;
        col = pixel_index % 96 - pos_col;
        track_index = row*6 + col;
        score = score_in;
        if (score == 0) begin
            case (track_index)
            2: pixel_data = 16'b1111111011000110;
            3: pixel_data = 16'b1111111011000110;
            7: pixel_data = 16'b1111111011000110;
            10: pixel_data = 16'b1111111011000110;
            12: pixel_data = 16'b1111111011000110;
            17: pixel_data = 16'b1111111011000110;
            18: pixel_data = 16'b1111111011000110;
            23: pixel_data = 16'b1111111011000110;
            24: pixel_data = 16'b1111111011000110;
            29: pixel_data = 16'b1111111011000110;
            30: pixel_data = 16'b1111111011000110;
            35: pixel_data = 16'b1111111011000110;
            36: pixel_data = 16'b1111111011000110;
            41: pixel_data = 16'b1111111011000110;
            43: pixel_data = 16'b1111111011000110;
            46: pixel_data = 16'b1111111011000110;
            50: pixel_data = 16'b1111111011000110;
            51: pixel_data = 16'b1111111011000110;
            default: pixel_data = bg_data;
            endcase
        end
        
        else if (score == 1) begin
            case (track_index)
            2: pixel_data = 16'b1111111011000110;
            3: pixel_data = 16'b1111111011000110;
            7: pixel_data = 16'b1111111011000110;
            8: pixel_data = 16'b1111111011000110;
            9: pixel_data = 16'b1111111011000110;
            12: pixel_data = 16'b1111111011000110;
            13: pixel_data = 16'b1111111011000110;
            14: pixel_data = 16'b1111111011000110;
            15: pixel_data = 16'b1111111011000110;
            20: pixel_data = 16'b1111111011000110;
            21: pixel_data = 16'b1111111011000110;
            26: pixel_data = 16'b1111111011000110;
            27: pixel_data = 16'b1111111011000110;
            32: pixel_data = 16'b1111111011000110;
            33: pixel_data = 16'b1111111011000110;
            38: pixel_data = 16'b1111111011000110;
            39: pixel_data = 16'b1111111011000110;
            42: pixel_data = 16'b1111111011000110;
            43: pixel_data = 16'b1111111011000110;
            44: pixel_data = 16'b1111111011000110;
            45: pixel_data = 16'b1111111011000110;
            46: pixel_data = 16'b1111111011000110;
            47: pixel_data = 16'b1111111011000110;
            48: pixel_data = 16'b1111111011000110;
            49: pixel_data = 16'b1111111011000110;
            50: pixel_data = 16'b1111111011000110;
            51: pixel_data = 16'b1111111011000110;
            52: pixel_data = 16'b1111111011000110;
            53: pixel_data = 16'b1111111011000110;
            default: pixel_data = bg_data;
            endcase
        end
        
        else if (score == 2) begin
            case (track_index)
            1: pixel_data = 16'b1111111011000110;
            2: pixel_data = 16'b1111111011000110;
            3: pixel_data = 16'b1111111011000110;
            4: pixel_data = 16'b1111111011000110;
            6: pixel_data = 16'b1111111011000110;
            7: pixel_data = 16'b1111111011000110;
            10: pixel_data = 16'b1111111011000110;
            11: pixel_data = 16'b1111111011000110;
            12: pixel_data = 16'b1111111011000110;
            17: pixel_data = 16'b1111111011000110;
            21: pixel_data = 16'b1111100000000000;
            22: pixel_data = 16'b1111111011000110;
            23: pixel_data = 16'b1111111011000110;
            26: pixel_data = 16'b1111111011000110;
            27: pixel_data = 16'b1111111011000110;
            28: pixel_data = 16'b1111111011000110;
            31: pixel_data = 16'b1111111011000110;
            32: pixel_data = 16'b1111111011000110;
            36: pixel_data = 16'b1111111011000110;
            37: pixel_data = 16'b1111111011000110;
            42: pixel_data = 16'b1111111011000110;
            43: pixel_data = 16'b1111111011000110;
            44: pixel_data = 16'b1111111011000110;
            45: pixel_data = 16'b1111111011000110;
            46: pixel_data = 16'b1111111011000110;
            47: pixel_data = 16'b1111111011000110;
            48: pixel_data = 16'b1111111011000110;
            49: pixel_data = 16'b1111111011000110;
            50: pixel_data = 16'b1111111011000110;
            51: pixel_data = 16'b1111111011000110;
            52: pixel_data = 16'b1111111011000110;
            53: pixel_data = 16'b1111111011000110;
            default: pixel_data = bg_data;
            endcase
        end
        
        else if (score == 3) begin
            case (track_index)
            2: pixel_data = 16'b1111111011000110;
            3: pixel_data = 16'b1111111011000110;
            6: pixel_data = 16'b1111111111100000;
            7: pixel_data = 16'b1111111011000110;
            8: pixel_data = 16'b1111111011000110;
            9: pixel_data = 16'b1111111011000110;
            10: pixel_data = 16'b1111111011000110;
            12: pixel_data = 16'b1111111011000110;
            16: pixel_data = 16'b1111111011000110;
            17: pixel_data = 16'b1111111011000110;
            22: pixel_data = 16'b1111111011000110;
            23: pixel_data = 16'b1111111011000110;
            26: pixel_data = 16'b1111111011000110;
            27: pixel_data = 16'b1111111011000110;
            28: pixel_data = 16'b1111111011000110;
            34: pixel_data = 16'b1111111011000110;
            35: pixel_data = 16'b1111111011000110;
            36: pixel_data = 16'b1111111011000110;
            40: pixel_data = 16'b1111111011000110;
            41: pixel_data = 16'b1111111011000110;
            43: pixel_data = 16'b1111111011000110;
            44: pixel_data = 16'b1111111011000110;
            45: pixel_data = 16'b1111111011000110;
            46: pixel_data = 16'b1111111011000110;
            50: pixel_data = 16'b1111111011000110;
            51: pixel_data = 16'b1111111011000110;
            default: pixel_data = bg_data;
            endcase
        end
        
        else if (score == 4) begin
            case (track_index)
            3: pixel_data = 16'b1111111011000110;
            4: pixel_data = 16'b1111111011000110;
            8: pixel_data = 16'b1111111011000110;
            9: pixel_data = 16'b1111111011000110;
            10: pixel_data = 16'b1111111011000110;
            13: pixel_data = 16'b1111111011000110;
            14: pixel_data = 16'b1111111011000110;
            16: pixel_data = 16'b1111111011000110;
            19: pixel_data = 16'b1111111011000110;
            22: pixel_data = 16'b1111111011000110;
            24: pixel_data = 16'b1111111011000110;
            25: pixel_data = 16'b1111111011000110;
            28: pixel_data = 16'b1111111011000110;
            30: pixel_data = 16'b1111111011000110;
            31: pixel_data = 16'b1111111011000110;
            32: pixel_data = 16'b1111111011000110;
            33: pixel_data = 16'b1111111011000110;
            34: pixel_data = 16'b1111111011000110;
            35: pixel_data = 16'b1111111011000110;
            40: pixel_data = 16'b1111111011000110;
            46: pixel_data = 16'b1111111011000110;
            52: pixel_data = 16'b1111111011000110;
            default: pixel_data = bg_data;
            endcase
        end
        
        else if (score == 5) begin
            case (track_index)
            0: pixel_data = 16'b1111111011000110;
            1: pixel_data = 16'b1111111011000110;
            2: pixel_data = 16'b1111111011000110;
            3: pixel_data = 16'b1111111011000110;
            4: pixel_data = 16'b1111111011000110;
            5: pixel_data = 16'b1111111011000110;
            6: pixel_data = 16'b1111111011000110;
            7: pixel_data = 16'b1111111011000110;
            8: pixel_data = 16'b1111111011000110;
            9: pixel_data = 16'b1111111011000110;
            10: pixel_data = 16'b1111111011000110;
            11: pixel_data = 16'b1111111011000110;
            12: pixel_data = 16'b1111111011000110;
            18: pixel_data = 16'b1111111011000110;
            24: pixel_data = 16'b1111111011000110;
            25: pixel_data = 16'b1111111011000110;
            26: pixel_data = 16'b1111111011000110;
            27: pixel_data = 16'b1111111011000110;
            28: pixel_data = 16'b1111111011000110;
            34: pixel_data = 16'b1111111011000110;
            35: pixel_data = 16'b1111111011000110;
            41: pixel_data = 16'b1111111011000110;
            45: pixel_data = 16'b1111111011000110;
            46: pixel_data = 16'b1111111011000110;
            47: pixel_data = 16'b1111111011000110;
            48: pixel_data = 16'b1111111011000110;
            49: pixel_data = 16'b1111111011000110;
            50: pixel_data = 16'b1111111011000110;
            51: pixel_data = 16'b1111111011000110;
            52: pixel_data = 16'b1111111011000110;
            default: pixel_data = bg_data;
            endcase
        end
        
        else if (score == 6) begin
            case (track_index)
            2: pixel_data = 16'b1111111011000110;
            3: pixel_data = 16'b1111111011000110;
            4: pixel_data = 16'b1111111011000110;
            7: pixel_data = 16'b1111111011000110;
            11: pixel_data = 16'b1111111011000110;
            12: pixel_data = 16'b1111111011000110;
            17: pixel_data = 16'b1111111011000110;
            18: pixel_data = 16'b1111111011000110;
            20: pixel_data = 16'b1111111011000110;
            21: pixel_data = 16'b1111111011000110;
            24: pixel_data = 16'b1111111011000110;
            25: pixel_data = 16'b1111111011000110;
            28: pixel_data = 16'b1111111011000110;
            30: pixel_data = 16'b1111111011000110;
            35: pixel_data = 16'b1111111011000110;
            36: pixel_data = 16'b1111111011000110;
            41: pixel_data = 16'b1111111011000110;
            43: pixel_data = 16'b1111111011000110;
            46: pixel_data = 16'b1111111011000110;
            50: pixel_data = 16'b1111111011000110;
            51: pixel_data = 16'b1111111011000110;
            default: pixel_data = bg_data;
            endcase
        end
        
        else if (score == 7) begin
            case (track_index)
            0: pixel_data = 16'b1111111011000110;
            1: pixel_data = 16'b1111111011000110;
            2: pixel_data = 16'b1111111011000110;
            3: pixel_data = 16'b1111111011000110;
            4: pixel_data = 16'b1111111011000110;
            5: pixel_data = 16'b1111111011000110;
            6: pixel_data = 16'b1111111011000110;
            11: pixel_data = 16'b1111111011000110;
            16: pixel_data = 16'b1111111011000110;
            17: pixel_data = 16'b1111111011000110;
            21: pixel_data = 16'b1111111011000110;
            22: pixel_data = 16'b1111111011000110;
            26: pixel_data = 16'b1111111011000110;
            27: pixel_data = 16'b1111111011000110;
            32: pixel_data = 16'b1111111011000110;
            38: pixel_data = 16'b1111111011000110;
            44: pixel_data = 16'b1111111011000110;
            50: pixel_data = 16'b1111111011000110;
            default: pixel_data = bg_data;
            endcase
        end
        
        else if (score == 8) begin
            case (track_index)
            1: pixel_data = 16'b1111111011000110;
            2: pixel_data = 16'b1111111011000110;
            3: pixel_data = 16'b1111111011000110;
            4: pixel_data = 16'b1111111011000110;
            6: pixel_data = 16'b1111111011000110;
            7: pixel_data = 16'b1111111011000110;
            10: pixel_data = 16'b1111111011000110;
            11: pixel_data = 16'b1111111011000110;
            12: pixel_data = 16'b1111111011000110;
            13: pixel_data = 16'b1111111011000110;
            16: pixel_data = 16'b1111111011000110;
            17: pixel_data = 16'b1111111011000110;
            19: pixel_data = 16'b1111111011000110;
            20: pixel_data = 16'b1111111011000110;
            21: pixel_data = 16'b1111111011000110;
            22: pixel_data = 16'b1111111011000110;
            24: pixel_data = 16'b1111111011000110;
            25: pixel_data = 16'b1111111011000110;
            28: pixel_data = 16'b1111111011000110;
            29: pixel_data = 16'b1111111011000110;
            30: pixel_data = 16'b1111111011000110;
            35: pixel_data = 16'b1111111011000110;
            36: pixel_data = 16'b1111111011000110;
            41: pixel_data = 16'b1111111011000110;
            42: pixel_data = 16'b1111111011000110;
            43: pixel_data = 16'b1111111011000110;
            46: pixel_data = 16'b1111111011000110;
            47: pixel_data = 16'b1111111011000110;
            49: pixel_data = 16'b1111111011000110;
            50: pixel_data = 16'b1111111011000110;
            51: pixel_data = 16'b1111111011000110;
            52: pixel_data = 16'b1111111011000110;
            default: pixel_data = bg_data;
            endcase
        end
        
        else if (score == 9) begin
            case (track_index)
            1: pixel_data = 16'b1111111111100000;
            2: pixel_data = 16'b1111111011000110;
            3: pixel_data = 16'b1111111011000110;
            4: pixel_data = 16'b1111111001000000;
            6: pixel_data = 16'b1111111111100000;
            7: pixel_data = 16'b1111111011000110;
            8: pixel_data = 16'b1111110111100000;
            9: pixel_data = 16'b1111111111100000;
            10: pixel_data = 16'b1111111011000110;
            11: pixel_data = 16'b1111110111100000;
            12: pixel_data = 16'b1111111011000110;
            13: pixel_data = 16'b1111111111100000;
            16: pixel_data = 16'b1111111111100000;
            17: pixel_data = 16'b1111111011000110;
            18: pixel_data = 16'b1111111011000110;
            19: pixel_data = 16'b1111111111100000;
            23: pixel_data = 16'b1111111011000110;
            25: pixel_data = 16'b1111111011000110;
            26: pixel_data = 16'b1111111111100000;
            28: pixel_data = 16'b1111111011000110;
            29: pixel_data = 16'b1111111011000110;
            30: pixel_data = 16'b1111111111100000;
            31: pixel_data = 16'b1111111111100000;
            32: pixel_data = 16'b1111111011000110;
            33: pixel_data = 16'b1111111011000110;
            34: pixel_data = 16'b1111111111100000;
            35: pixel_data = 16'b1111111011000110;
            36: pixel_data = 16'b1111111011000110;
            39: pixel_data = 16'b1111111111100000;
            40: pixel_data = 16'b1111111111100000;
            41: pixel_data = 16'b1111111011000110;
            42: pixel_data = 16'b1111111011000110;
            43: pixel_data = 16'b1111111111100000;
            44: pixel_data = 16'b1111111111100000;
            45: pixel_data = 16'b1111110111100000;
            46: pixel_data = 16'b1111111011000110;
            47: pixel_data = 16'b1111111111100000;
            48: pixel_data = 16'b1111111001000000;
            49: pixel_data = 16'b1111111011000110;
            50: pixel_data = 16'b1111111011000110;
            51: pixel_data = 16'b1111111011000110;
            52: pixel_data = 16'b1111111111100000;
            default: pixel_data = bg_data;
            endcase
        end
    end
endmodule
