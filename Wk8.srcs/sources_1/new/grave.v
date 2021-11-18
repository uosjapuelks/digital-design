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


module grave(
input CLOCK,
input slowclk,
input [15:0]bg_data,
output reg [15:0] pixel_data,
input [12:0]pixel_index,
input [12:0]pos_col,
input [12:0]pos_row,
input [15:0]mancolour
    );
    reg [2:0]count;
    reg [12:0]row;
    reg [12:0]col;
    reg [12:0]track_index;
    
    always @ (posedge CLOCK) begin
        row = pixel_index / 96 - pos_row;
        col = pixel_index % 96 - pos_col;
        track_index = row*19 + col;
        
        case (track_index)
        137: pixel_data = 16'b0011100111000111;
        138: pixel_data = 16'b0001100011000011;
        139: pixel_data = 16'b0001100011000011;
        140: pixel_data = 16'b0001100011000011;
        141: pixel_data = 16'b0001100011000011;
        142: pixel_data = 16'b0001100011000011;
        143: pixel_data = 16'b0001100011000011;
        144: pixel_data = 16'b0001100011000011;
        145: pixel_data = 16'b0001100011000011;
        146: pixel_data = 16'b0001100011000011;
        155: pixel_data = 16'b0010000100100100;
        156: pixel_data = 16'b0001100011000011;
        157: pixel_data = 16'b0010000100000100;
        158: pixel_data = 16'b0011000111000110;
        159: pixel_data = 16'b0011000111000110;
        160: pixel_data = 16'b0010000100000100;
        161: pixel_data = 16'b0001100011000011;
        162: pixel_data = 16'b0001100011100011;
        163: pixel_data = 16'b0011000111000110;
        164: pixel_data = 16'b0011000111000110;
        165: pixel_data = 16'b0010000100100100;
        166: pixel_data = 16'b0001100011000011;
        167: pixel_data = 16'b0001100011000011;
        174: pixel_data = 16'b0001100011000011;
        175: pixel_data = 16'b0001100011000011;
        176: pixel_data = 16'b0011000111000110;
        177: pixel_data = 16'b0011000111000110;
        178: pixel_data = 16'b0001100011000011;
        179: pixel_data = 16'b0001100011000011;
        180: pixel_data = 16'b0011000111000110;
        181: pixel_data = 16'b0011000111000110;
        182: pixel_data = 16'b0011000111000110;
        183: pixel_data = 16'b0011000111000110;
        184: pixel_data = 16'b0011000111000110;
        185: pixel_data = 16'b0011000111000110;
        186: pixel_data = 16'b0001100011100011;
        187: pixel_data = 16'b0001100011000011;
        192: pixel_data = 16'b0001100011000011;
        193: pixel_data = 16'b0001100011000011;
        194: pixel_data = 16'b0011000111000110;
        195: pixel_data = 16'b0011000111000110;
        196: pixel_data = 16'b0001100011100011;
        197: pixel_data = 16'b0001100011000011;
        198: pixel_data = 16'b0011000111000110;
        199: pixel_data = 16'b0011000111000110;
        200: pixel_data = 16'b0011000111000110;
        201: pixel_data = 16'b0011000111000110;
        202: pixel_data = 16'b0011000111000110;
        203: pixel_data = 16'b0011000111000110;
        204: pixel_data = 16'b0011000111000110;
        205: pixel_data = 16'b0011000111000110;
        206: pixel_data = 16'b0001100011000011;
        207: pixel_data = 16'b0001100011000011;
        210: pixel_data = 16'b0011000110100110;
        211: pixel_data = 16'b0001100011000011;
        212: pixel_data = 16'b0011000111000110;
        213: pixel_data = 16'b0011000111000110;
        214: pixel_data = 16'b0011000111000110;
        215: pixel_data = 16'b0001100011000011;
        216: pixel_data = 16'b0011000111000110;
        217: pixel_data = 16'b0011000111000110;
        218: pixel_data = 16'b0011000111000110;
        219: pixel_data = 16'b0011000111000110;
        220: pixel_data = 16'b0011000111000110;
        221: pixel_data = 16'b0011000111000110;
        222: pixel_data = 16'b0011000111000110;
        223: pixel_data = 16'b0011000111000110;
        224: pixel_data = 16'b0011000111000110;
        225: pixel_data = 16'b0011000111000110;
        226: pixel_data = 16'b0001100011000011;
        229: pixel_data = 16'b0001100011000011;
        230: pixel_data = 16'b0001100011000011;
        231: pixel_data = 16'b0011000111000110;
        232: pixel_data = 16'b0011000111000110;
        233: pixel_data = 16'b0001100011100011;
        234: pixel_data = 16'b0001100011000011;
        235: pixel_data = 16'b0011000111000110;
        236: pixel_data = 16'b0011000111000110;
        237: pixel_data = 16'b0011000111000110;
        238: pixel_data = 16'b0011000111000110;
        239: pixel_data = 16'b0011000111000110;
        240: pixel_data = 16'b0011000111000110;
        241: pixel_data = 16'b0011000111000110;
        242: pixel_data = 16'b0011000111000110;
        243: pixel_data = 16'b0011000111000110;
        244: pixel_data = 16'b0011000111000110;
        245: pixel_data = 16'b0001100011000011;
        248: pixel_data = 16'b0001100011000011;
        249: pixel_data = 16'b0011000110100110;
        250: pixel_data = 16'b0011000111000110;
        251: pixel_data = 16'b0011000111000110;
        252: pixel_data = 16'b0001100011000011;
        253: pixel_data = 16'b0011000111000110;
        254: pixel_data = 16'b0011000111000110;
        255: pixel_data = 16'b0011000111000110;
        256: pixel_data = 16'b0011000111000110;
        257: pixel_data = 16'b0011000111000110;
        258: pixel_data = 16'b0001100011000011;
        259: pixel_data = 16'b0011000111000110;
        260: pixel_data = 16'b0011000111000110;
        261: pixel_data = 16'b0011000111000110;
        262: pixel_data = 16'b0011000111000110;
        263: pixel_data = 16'b0011000111000110;
        264: pixel_data = 16'b0001100011000011;
        265: pixel_data = 16'b0001000010000010;
        267: pixel_data = 16'b0001100011000011;
        268: pixel_data = 16'b0011000111000110;
        269: pixel_data = 16'b0011000111000110;
        270: pixel_data = 16'b0011000111000110;
        271: pixel_data = 16'b0001100011000011;
        272: pixel_data = 16'b0011000111000110;
        273: pixel_data = 16'b0011000111000110;
        274: pixel_data = 16'b0011000111000110;
        275: pixel_data = 16'b0011000111000110;
        276: pixel_data = 16'b0011000111000110;
        277: pixel_data = 16'b0001100011000011;
        278: pixel_data = 16'b0011000111000110;
        279: pixel_data = 16'b0011000111000110;
        280: pixel_data = 16'b0011000111000110;
        281: pixel_data = 16'b0011000111000110;
        282: pixel_data = 16'b0011000111000110;
        283: pixel_data = 16'b0001100011000011;
        284: pixel_data = 16'b0001100011100011;
        286: pixel_data = 16'b0001100011000011;
        287: pixel_data = 16'b0011000111000110;
        288: pixel_data = 16'b0011000111000110;
        289: pixel_data = 16'b0011000111000110;
        290: pixel_data = 16'b0001100011000011;
        291: pixel_data = 16'b0011000111000110;
        292: pixel_data = 16'b0011000111000110;
        293: pixel_data = 16'b0011000111000110;
        294: pixel_data = 16'b0001100011000011;
        295: pixel_data = 16'b0001100011000011;
        296: pixel_data = 16'b0001100011000011;
        297: pixel_data = 16'b0001100011000011;
        298: pixel_data = 16'b0001100011000011;
        299: pixel_data = 16'b0011000111000110;
        300: pixel_data = 16'b0011000111000110;
        301: pixel_data = 16'b0011000111000110;
        302: pixel_data = 16'b0001100011000011;
        303: pixel_data = 16'b0001100110000011;
        305: pixel_data = 16'b0001100011000011;
        306: pixel_data = 16'b0011000111000110;
        307: pixel_data = 16'b0011000111000110;
        308: pixel_data = 16'b0011000111000110;
        309: pixel_data = 16'b0001100011000011;
        310: pixel_data = 16'b0011000111000110;
        311: pixel_data = 16'b0011000111000110;
        312: pixel_data = 16'b0011000111000110;
        313: pixel_data = 16'b0011000111000110;
        314: pixel_data = 16'b0011000111000110;
        315: pixel_data = 16'b0001100011000011;
        316: pixel_data = 16'b0011000111000110;
        317: pixel_data = 16'b0011000111000110;
        318: pixel_data = 16'b0011000111000110;
        319: pixel_data = 16'b0011000111000110;
        320: pixel_data = 16'b0011000111000110;
        321: pixel_data = 16'b0001100011000011;
        324: pixel_data = 16'b0001100011000011;
        325: pixel_data = 16'b0011000111000110;
        326: pixel_data = 16'b0011000111000110;
        327: pixel_data = 16'b0011000111000110;
        328: pixel_data = 16'b0001100011000011;
        329: pixel_data = 16'b0011000111000110;
        330: pixel_data = 16'b0011000111000110;
        331: pixel_data = 16'b0011000111000110;
        332: pixel_data = 16'b0011000111000110;
        333: pixel_data = 16'b0011000111000110;
        334: pixel_data = 16'b0001100011000011;
        335: pixel_data = 16'b0011000111000110;
        336: pixel_data = 16'b0011000111000110;
        337: pixel_data = 16'b0011000111000110;
        338: pixel_data = 16'b0011000111000110;
        339: pixel_data = 16'b0011000111000110;
        340: pixel_data = 16'b0001100011000011;
        343: pixel_data = 16'b0001100011000011;
        344: pixel_data = 16'b0011000111000110;
        345: pixel_data = 16'b0011000111000110;
        346: pixel_data = 16'b0011000111000110;
        347: pixel_data = 16'b0001100011000011;
        348: pixel_data = 16'b0011000111000110;
        349: pixel_data = 16'b0011000111000110;
        350: pixel_data = 16'b0011000111000110;
        351: pixel_data = 16'b0011000111000110;
        352: pixel_data = 16'b0011000111000110;
        353: pixel_data = 16'b0001100011000011;
        354: pixel_data = 16'b0011000111000110;
        355: pixel_data = 16'b0011000111000110;
        356: pixel_data = 16'b0011000111000110;
        357: pixel_data = 16'b0011000111000110;
        358: pixel_data = 16'b0011000111000110;
        359: pixel_data = 16'b0001100011000011;
        362: pixel_data = 16'b0001100011000011;
        363: pixel_data = 16'b0011000111000110;
        364: pixel_data = 16'b0011000111000110;
        365: pixel_data = 16'b0011000111000110;
        366: pixel_data = 16'b0001100011000011;
        367: pixel_data = 16'b0011000111000110;
        368: pixel_data = 16'b0011000111000110;
        369: pixel_data = 16'b0011000111000110;
        370: pixel_data = 16'b0011000111000110;
        371: pixel_data = 16'b0011000111000110;
        372: pixel_data = 16'b0011000111000110;
        373: pixel_data = 16'b0011000111000110;
        374: pixel_data = 16'b0011000111000110;
        375: pixel_data = 16'b0011000111000110;
        376: pixel_data = 16'b0011000111000110;
        377: pixel_data = 16'b0011000111000110;
        378: pixel_data = 16'b0001100011000011;
        381: pixel_data = 16'b0001100011000011;
        382: pixel_data = 16'b0011000111000110;
        383: pixel_data = 16'b0011000111000110;
        384: pixel_data = 16'b0011000111000110;
        385: pixel_data = 16'b0001100011000011;
        386: pixel_data = 16'b0011000111000110;
        387: pixel_data = 16'b0011000111000110;
        388: pixel_data = 16'b0011000111000110;
        389: pixel_data = 16'b0011000111000110;
        390: pixel_data = 16'b0011000111000110;
        391: pixel_data = 16'b0011000111000110;
        392: pixel_data = 16'b0011000111000110;
        393: pixel_data = 16'b0011000111000110;
        394: pixel_data = 16'b0011000111000110;
        395: pixel_data = 16'b0011000111000110;
        396: pixel_data = 16'b0011000110100110;
        397: pixel_data = 16'b0001100011000011;
        400: pixel_data = 16'b0001100011000011;
        401: pixel_data = 16'b0011000111000110;
        402: pixel_data = 16'b0011000111000110;
        403: pixel_data = 16'b0011000111000110;
        404: pixel_data = 16'b0001100011000011;
        405: pixel_data = 16'b0011000111000110;
        406: pixel_data = 16'b0011000111000110;
        407: pixel_data = 16'b0011000111000110;
        408: pixel_data = 16'b0011000111000110;
        409: pixel_data = 16'b0011000111000110;
        410: pixel_data = 16'b0011000111000110;
        411: pixel_data = 16'b0011000111000110;
        412: pixel_data = 16'b0011000111000110;
        413: pixel_data = 16'b0011000111000110;
        414: pixel_data = 16'b0011000111000110;
        415: pixel_data = 16'b0011000111000110;
        416: pixel_data = 16'b0001100011000011;
        default: pixel_data = bg_data;
        endcase
    end
endmodule
