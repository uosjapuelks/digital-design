`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 09:24:56 PM
// Design Name: 
// Module Name: single_pulse
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


module single_pulse(
    input CLOCK, b, 
    output out   
    );
    reg q1;
    reg q2;
    
    always @ (posedge CLOCK) begin
        q1 <= b;
        q2 = q1;
    end
    
    assign out = q1 && ~q2;

endmodule
