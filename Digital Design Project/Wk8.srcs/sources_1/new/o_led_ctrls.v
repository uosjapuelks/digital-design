`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 03:35:39 PM
// Design Name: 
// Module Name: o_led_ctrls
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


module o_led_ctrls(
    input CLK,
    input sw,
    input [2:0]S,  //S[0] is no border, S[1] is thickness 1, S[2] is thickness 3
    output reg [15:0]pixel_data, //volume level
    input [12:0]pixel_index,
    input pulsel,
    input pulser,
    input [15:0]level,
    input [15:0]borderin, input [15:0]basein, input [15:0]lowin, input [15:0]medin, input [15:0]highin
    );
//    reg pulse_countl = 0;
//    reg pulse_countr = 0;
    reg [15:0]temp_data;
    reg [15:0] temp_data2;
    reg [25:0]pos_count = 13'd48;
    reg [12:0]row; 
    reg [12:0]col;
    reg [15:0]low;
    reg [15:0]med;
    reg [15:0]high;
    reg [15:0]border;
    reg [15:0]base;
    reg [12:0]temp_level;
    reg [25:0]count = 0;
    
    always @ (posedge CLK) begin
        low <= lowin;
        med <= medin;
        base<= basein;
        border<=borderin;
        high<=highin;
        pos_count <= (pulsel) ? ((pos_count == 6)?pos_count:pos_count-1) : ((pulser)?((pos_count==88)?pos_count:pos_count+1):pos_count) ;
        temp_level = (63-(level*4));
        row = pixel_index / 96;
        col = pixel_index % 96;
        if (CLK) begin
            temp_data2 <= temp_data;
            temp_data <= (temp_level>0) ? ((temp_level > row)?base:(2 < row && row < 23) ? high : ((22< row && row < 43) ? med : ((row > 42 && 63 > row) ? low : base ) )): base;
        end
        if (!(pos_count - 5 < col && col < pos_count + 6) || ((row)%4==2)) begin
                temp_data<= base;
        end
        
        if (sw) begin
            pixel_data <= base;
        end
        else if (S[0]) begin
            pixel_data <= temp_data;
        end
        else if (S[1]) begin
            pixel_data <=  (row == 0 || row == 63 || col == 0 || col == 95) ? border : temp_data;
        end
        else if (S[2]) begin
            pixel_data <= (!(2 < row && row < 61)||!(2 < col && col< 93))? border : temp_data;
        end
        else begin
            pixel_data <= temp_data;
        end
    end

endmodule