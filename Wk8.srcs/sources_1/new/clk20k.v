`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 03:17:24 PM
// Design Name: 
// Module Name: clk20k
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


module adj_clk( 
    input CLOCK,
    input [31:0] freq,  
    output reg out = 0
    );
    
    reg [31:0] COUNT = 0;
    
    always @(posedge CLOCK) begin
        COUNT = COUNT + 1;
        out = (COUNT == freq) ? ~out:out;
        COUNT = (COUNT == freq) ? 0 : COUNT;           
    end
    
endmodule
