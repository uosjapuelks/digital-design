`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 11:44:18 PM
// Design Name: 
// Module Name: gametwo
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


module gametwo(
input CLK, input slowCLK, input [12:0]pixel_index, input [5:0]level, output reg [15:0]pixel_data
    );

    wire [15:0]bg_data;
    reg [15:0]temp_data;

    reg [12:0]row;
    reg [12:0]col;
    reg [15:0]red = 16'b1111100000000000;
    reg [15:0]yellow = 16'b1111111111100000;
    reg [15:0]green= 16'b11111100000;

    gametwo_bg bg (CLK, slowCLK, pixel_index, level, bg_data);

    always @ (posedge slowCLK) begin
        row = pixel_index / 96;
        col = pixel_index % 96;
        temp_data = ((col <= 32 && col >= 3 && !(col%6==3 || col%6==2))) ? green : ((col <= 62 && col >= 33 && !(col%6==3 || col%6==2))? yellow : ((col <= 92 && col >= 63 && !(col%6==3 || col%6==2))? red : bg_data ) ) ;
        pixel_data = (row == 58 || row == 60)? ((col>(level*6+3))? bg_data : temp_data ) : ((row==59)? ((col>(level*6+3)||col%6==5||col%6==0)? bg_data : temp_data ) : bg_data );
    end

endmodule