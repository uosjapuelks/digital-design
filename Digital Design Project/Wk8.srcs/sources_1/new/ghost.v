`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 11:00:58 PM
// Design Name: 
// Module Name: ghost
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


module ghost(
input CLOCK,
input slowclk,
input [15:0]bg_data,
output reg [15:0]ghost_data,
input [12:0]pixel_index,
input [12:0]pos_col,
input [12:0]pos_row,
input [15:0]ghostcolour,
input pulsel,
input pulser
    );
    reg [2:0]count;
    reg [12:0]row;
    reg [12:0]col;
    reg rotation = 1;
    
    always @ (posedge slowclk) begin
    
        count = ( rotation == 1 )? count + 1  : count - 1  ;
    end   
    
    always @ (posedge CLOCK) begin
        rotation = (pulsel) ? 1 : ((pulser)? 0 : rotation ) ;
        row = pixel_index / 96;
        col = pixel_index % 96;
        case (count)
            0:
                ghost_data = ((row == pos_row-3 && (col == pos_col-2 || col==pos_col+2)) || (row == pos_row-1 && (col== pos_col-1 || col == pos_col+1)) || (row==pos_row+2&& col ==pos_col-1) ) ? bg_data : ghostcolour ;
            1:
                ghost_data = ((row == pos_row-3 && (col == pos_col-2 || col==pos_col+2)) || (row == pos_row-1 && (col== pos_col-2 || col == pos_col)) || (row==pos_row+2&& (col==pos_col+1 || col ==pos_col-1)) || (row==pos_row-2 && (col == pos_col-2)) ) ? bg_data : ghostcolour ;
            2:
                ghost_data = ((row == pos_row-3 && (col == pos_col-2 || col==pos_col+2)) || (row == pos_row-1 && col== pos_col-1) || (row==pos_row+2&& (col==pos_col+1 || col ==pos_col-1 || col==pos_col+2)) || (row==pos_row-2 && (col == pos_col-2)) ) ? bg_data : ghostcolour ;
            3:
                ghost_data = ((row == pos_row-3 && (col == pos_col-2 || col==pos_col+2)) || (row == pos_row-1 && col== pos_col-2) || (row==pos_row+2&& (col==pos_col+1 || col ==pos_col)) || (row==pos_row-2 && (col == pos_col-2)) ) ? bg_data : ghostcolour ;
            5:
                ghost_data = ((row == pos_row-3 && (col == pos_col-2 || col==pos_col+2)) || (row==pos_row+2&& (col==pos_col+1 || col ==pos_col+2)) ) ? bg_data : ghostcolour ;
            4:
                ghost_data = ((row == pos_row-3 && (col == pos_col-2 || col==pos_col+2)) || (row == pos_row-1 && col== pos_col+2) || (row==pos_row+2&& (col==pos_col+2 || col ==pos_col-1 || col==pos_col+1)) || (row==pos_row-2 && (col == pos_col+2)) ) ? bg_data : ghostcolour ;
            6:
                ghost_data = ((row == pos_row-3 && (col == pos_col-2 || col==pos_col+2)) || (row == pos_row-1 && col== pos_col+1) || (row==pos_row+2&& (col==pos_col+1 || col ==pos_col-1)) ) ? bg_data : ghostcolour ;
            7:
                ghost_data = ((row == pos_row-3 && (col == pos_col-2 || col==pos_col+2)) || (row == pos_row-1 && (col== pos_col || col == pos_col+2)) || (row==pos_row+2&& (col==pos_col+1 || col ==pos_col-2)) ) ? bg_data : ghostcolour ;
        endcase
    end
endmodule
