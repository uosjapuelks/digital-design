`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 08:35:01 PM
// Design Name: 
// Module Name: game_mix
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
module game_mix(
input CLK,
input [3:0] mode,
input [15:0] sw,
input [12:0]pixel_index,
output reg [15:0]pixel_data,
input pulsel,
input pulser,
input pulseu,
input pulsed,
input [15:0]vol_level
);
//ghost colours
reg [15:0]red = 16'b1111100000000000;
reg [15:0]sound = 16'b1010101101101101;
reg [15:0]ghost_colour = 16'b0101110100011001;

reg [15:0]temp_data;

reg [12:0]ghost_col = 12;
reg [12:0] ghost_row = 10;

//reg on;

reg [12:0]col;
reg [12:0]row;
reg[1:0]waves;
reg [15:0] wavecolour;
reg [30:0]squared_row;
reg [30:0]squared_col;
reg [30:0] squared_vol;
reg [12:0] squared_wave;
reg [12:0]row_diff;
reg [12:0]col_diff;

reg [12:0]ear_row_diff;
reg [12:0]ear_col_diff;
reg [30:0]squared_row_ear;
reg [30:0]squared_col_ear;

reg win = 0;
reg lose = 0;

reg [12:0] man_col = 1;
reg [12:0] man_row = 37;
reg [15:0] man_colour = 16'b1111111111111111;

wire GHOSTCLK;
wire slowClk;
wire [15:0]ghost_data;
wire [15:0]bg_data;
wire [15:0] grave_data;
wire [15:0] man_data;
wire [15:0] score_display1;
wire [15:0] score_display2;
wire [15:0] score_display1_end;
wire [15:0] score_display2_end;



wire [15:0] VICTORY;
wire [15:0] over_data;
reg [15:0] out_data;

reg [31:0] count = 0;
reg [4:0] score = 0;
reg [4:0] score_f = 0;
reg [4:0] score_s = 0;
reg [12:0] score_row = 6;
reg [12:0] score_f_col = 86;
reg [12:0] score_s_col=79;

reg [12:0] score_end_row = 48;
reg [12:0] score_end_col_f = 50;
reg [12:0] score_end_col_s = 42;



game_background background (CLK, pixel_index, bg_data);
ghost getghost (CLK, GHOSTCLK , bg_data, ghost_data, pixel_index, ghost_col, ghost_row, ghost_colour, pulsel, pulser);
man getman (CLK, GHOSTCLK , bg_data, man_data, pixel_index, man_col, man_row, man_colour);
grave getgrave (CLK, GHOSTCLK , bg_data, grave_data, pixel_index, man_col, man_row, man_colour);
score_board score_track1 (CLK, GHOSTCLK , bg_data, score_display1, pixel_index, score_f, score_row, score_f_col);
score_board score_track2 (CLK, GHOSTCLK , bg_data, score_display2, pixel_index, score_s,score_row, score_s_col);

score_board score_end_track1 (CLK, GHOSTCLK , over_data, score_display1_end, pixel_index, score_f, score_end_row, score_end_col_f);
score_board score_end_track2 (CLK, GHOSTCLK , over_data, score_display2_end, pixel_index, score_s,score_end_row, score_end_col_s);


gameover gameover (CLK,pixel_index,over_data);
gamewin gamewin (CLK,pixel_index,VICTORY);

adj_clk clkghost (CLK, 250000, GHOSTCLK);
adj_clk wave (CLK, 1000, slowClk);

always @ (posedge slowClk) begin
    if (mode == 3)
    waves = waves + 1;
end

always @ (posedge GHOSTCLK) begin
    if (mode == 3) begin
        count <= (win == 0) ? 0 : ((count == 40) ? 0 : (count+1));
        man_col <= (sw[9] || sw[7]) ? 0 : ((win == 1) ? man_col : ((count == 40) ? 0 : (man_col + 1)));
    end
    score <= (sw[9] || sw[7]) ? 0 : ((count == 40) ? ((score < 99) ? (score+1) : 99) : score);
    score_f = score%10;
    score_s = score/10;
end

always @ (posedge CLK) begin
    if (mode == 3) begin
    
    ghost_row = (sw[9] || sw[7] || (win && count == 40) ) ? 10 : ghost_row;
    ghost_col = (sw[9] || sw[7] || (win && count == 40)) ? 12 : ghost_col;

    if (pulsel) begin
        ghost_col = (ghost_col < 6)? ghost_col : ghost_col - 3 ;
    end
    if (pulser) begin
        ghost_col = (ghost_col > 89) ? ghost_col: ghost_col + 3;
    end
    if (pulseu) begin
        ghost_row = (ghost_row < 10)? ghost_row : ghost_row - 3 ;
    end
    if (pulsed) begin
        ghost_row = (ghost_row > 50) ? ghost_row: ghost_row + 3;
    end
    wavecolour <= sound;
    row = pixel_index / 96;
    col = pixel_index % 96;
    row_diff = (row > ghost_row) ? (row - ghost_row) : (ghost_row - row) ;
    col_diff = (col > ghost_col) ? (col - ghost_col + 1) : (ghost_col + 1 - col) ;

    //man ears
//    ear_row_diff = ((man_row + 9) > ghost_row) ? (row - ghost_row + 9) : (ghost_row - row + 9) ;
//    ear_col_diff = ((man_col + 7) > ghost_col) ? (col - ghost_col + 7) : (ghost_col + 1 - col + 7) ;
    ear_row_diff = ((man_row + 9) > ghost_row) ? (man_row - ghost_row + 9) : (ghost_row - man_row + 9) ;
    ear_col_diff = ((man_col + 7) > ghost_col) ? (man_col - ghost_col + 7) : (ghost_col + 1 - man_col + 7) ;
    squared_row_ear = ear_row_diff**2;
    squared_col_ear = ear_col_diff**2;

    squared_row = row_diff**2;
    squared_col = col_diff**2;
    squared_vol = vol_level**2;
    squared_wave = waves**2;
    temp_data = bg_data;

    lose = (sw[9] || sw[7]) ? 0 : ((man_col >= 94) ? 1 : lose);

    win = (sw[9] || sw[7]) ? 0 : ((count == 40) ? 0 : ((((squared_row_ear + squared_col_ear) <= squared_vol)) ? 1 : win ));
    pixel_data = (lose) ? (((row >= 48 && row <= 56) && (col >= 51 && col <= 56))? score_display1_end :((((row >= 48 && row <= 56) && (col >= 43 && col <= 48))? score_display2_end :(over_data)))) : ((score==99)? (((row >= 48 && row <= 56) && (col >= 51 && col <= 56))? score_display1_end :((((row >= 48 && row <= 56) && (col >= 43 && col <= 48))? score_display2_end :(VICTORY)))) : (((row >= ghost_row - 3 && row <= ghost_row + 2) && (col > ghost_col - 2 && col <= ghost_col + 3) ) ? ghost_data : (((squared_row + squared_col <= squared_vol) && ((squared_row + squared_col)%4 == waves))? wavecolour : (((row>=man_row&&row<=man_row+22)&&(col>=man_col&&col<=man_col+18)) ? ((win == 1) ? grave_data : man_data ) : (((row >= 6 && row <= 14) && (col >= 87 && col <= 92))? score_display1 :((((row >= 6 && row <= 14) && (col >= 80 && col <= 85))? score_display2 :(temp_data)))))))) ;

    end
end


endmodule
