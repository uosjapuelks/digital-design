`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 05:09:35 PM
// Design Name: 
// Module Name: Gameone
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


module gameone(
    input CLK100MHZ,
    input CLOCK,
    input [12:0] pixel_index,
    input [5:0] level,
    output reg [15:0] pixel_data
    );
    
    reg [31:0] COUNT = 0;
    
    wire [15:0] frame0;
    wire [15:0] frame1;
    wire [15:0] frame2;
    wire [15:0] frame3;
    
    rain rain (CLOCK, pixel_index, frame0);
    rainL rainL (CLOCK, pixel_index, frame1);
    rainM rainM (CLOCK, pixel_index, frame2);
    rainH rainH (CLOCK, pixel_index, frame3);
    
    always @(posedge CLK100MHZ) begin
        COUNT <= (COUNT == 50000000) ? 0 : (COUNT + 1);
        
        if (level == 0) begin
            pixel_data <= frame0;
        end
 
        if (level > 0 && level < 6) begin
            if (COUNT < 25000000)
                pixel_data = frame0;
            if (COUNT > 25000000)
                pixel_data = frame1;
        end       
        
        if (level > 5 && level < 11) begin
            if (COUNT < 16666666)
                pixel_data <= frame0;
            if (COUNT > 16666666 && COUNT < 33333333)
                pixel_data <= frame1;
            if (COUNT > 33333333)
                pixel_data <= frame2;
        end
        
        if (level > 10 && level < 16) begin
            if (COUNT < 12500000)
                pixel_data = frame0;
            if (COUNT > 12500000 && COUNT < 25000001)
                pixel_data = frame1;
            if (COUNT > 25000001 && COUNT < 37500001)
                pixel_data = frame2;
            if (COUNT > 37500000)
                pixel_data = frame3;
        end   
    end
    
endmodule
