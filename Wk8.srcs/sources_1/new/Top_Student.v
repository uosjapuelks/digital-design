`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): MONDAY P.M, TUESDAY P.M, WEDNESDAY P.M, THURSDAY A.M., THURSDAY P.M
//
//  STUDENT A NAME: 
//  STUDENT A MATRICULATION NUMBER: 
//
//  STUDENT B NAME: 
//  STUDENT B MATRICULATION NUMBER: 
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input CLK100MHZ,
    input [15:0] sw,
    input btnC,
    input btnL,
    input btnR,
    input btnD,
    input btnU,
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    // Delete this comment and include other inputs and outputs here
    output [15:0]led,
    output [6:0] JC,
    output [0:6] seg,
    output [3:0] an
    );
    
    reg reset = 0;
    
    wire [5:0] level;
 
    wire pulsel;
    wire pulser;
    wire pulseu;
    wire pulsec;
    wire pulsed;
    
    wire out;
    wire out2;
    wire out3;
    wire [11:0] mic_in;
    
    wire frame_begin;
    wire sending_pixels;
    wire sample_pixel;
    wire [12:0] pixel_index;
    wire [4:0] teststate;
    
    wire [12:0] pixel_index2;
    wire [30:0]throw;
    
    reg [15:0] oled_data;
    reg [15:0] task_oled;
    reg [15:0] oled_out;
    wire [15:0] oled_data1;
    wire [15:0] oled_data2;
    wire [15:0] oled_data3;
    wire [15:0] oled_data4;
    wire [15:0] oled_data5;
    wire [15:0] oled_data6;
    
    wire [3:0] mode;
        
    // Delete this comment and write your codes and instantiations here
    adj_clk cl (CLK100MHZ, 2500, out);
    adj_clk cl2 (CLK100MHZ, 8, out2);
    adj_clk cl3 (CLK100MHZ, 4, out3);
    
    single_pulse l_pulse (out2, btnL, pulsel);
    single_pulse r_pulse (out2, btnR, pulser);
    single_pulse u_pulse (out2, btnU, pulseu);
    single_pulse d_pulse (out2, btnD, pulsed);
    single_pulse c_pulse (out2, btnC, pulsec);

//  Audio capture module       
    Audio_Capture dut1 (CLK100MHZ,out,J_MIC3_Pin3,J_MIC3_Pin1,J_MIC3_Pin4,mic_in);

//  Controlling anode  
    anode_control anode_control (CLK100MHZ,sw, mic_in, level, led, seg, an);

//  o_led_ctrls normal (out2, sw[15:13], oled_data1, pixel_index, pulsel, pulser, level, border_color, base, low, med,high);
    o_led_ctrls normal (out2,sw[11], sw[15:13], oled_data1, pixel_index, pulsel, pulser, level, 16'b1111111111111111, 16'b0, 16'b11111100000, 16'b1111111111100000,16'b1111100000000000);
    o_led_ctrls custom (out2,sw[11], sw[15:13], oled_data2, pixel_index, pulsel, pulser, level, 16'b1010101010101010, 16'b0001000101101000, 16'b1100000100110000, 16'b1111110011000000, 16'b1110111010110110);
    
//  menu (out2, pixel_index, sw, pulseu, pulsed, pulsec, mode, pixel_data)
    menu menu (out2, pixel_index, sw, pulseu, pulsed, pulsec, mode, oled_data3);
//  feature 1    
    gameone gameone (CLK100MHZ, out2, pixel_index, level, oled_data4);
//  feature 2
    gametwo gametwo (CLK100MHZ, out2, pixel_index, level, oled_data5);
//  feature 3
    game_mix gameteam (out2, mode, sw, pixel_index, oled_data6, pulsel, pulser, pulseu, pulsed, level);

//  decide which screen to show  
    always @ (out2) begin
        task_oled = (sw[8]) ? oled_data3 : ((sw[12]) ? oled_data2 : oled_data1 );
        case (mode)
            1: oled_data = oled_data4;
            2: oled_data = oled_data5;
            3: oled_data = oled_data6;
            default: oled_data = task_oled; 
        endcase
        oled_out = (sw[8]) ? oled_data : task_oled;
    end
        
//  output to oled
    Oled_Display dut2 (out2, reset, frame_begin, sending_pixels,
    sample_pixel, pixel_index, oled_out, JC[0], JC[1], JC[2], JC[3], JC[4], JC[5],
    JC[6],teststate);
    
endmodule