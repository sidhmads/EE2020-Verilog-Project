`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2017 14:13:24
// Design Name: 
// Module Name: VolumeControl
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


module VolumeControl(
    input CLK,
    input clk_20k,
    input clk_5,
    input [11:0] MIC_IN,
    input btnD,
    output reg [15:0] led,
    output reg [11:0] display
    );
    reg [11:0] maximum;
    reg [11:0] count;
    wire change;
    reg toggle = 1;
    
    dff buttonD (CLK, btnD, change);
    
    always @ (posedge change) begin
        toggle <= ~toggle;
    end
   
    always @ (posedge clk_20k) begin 
        count <= count +1;
        if (maximum < MIC_IN)
          maximum = MIC_IN;
        if (count == 4000) begin
            maximum = MIC_IN;
            count = 0;
        end
    end
    
    always @ (posedge clk_5) begin
        if (toggle) begin 
            if (maximum < 2000)
                led = 16'b0000000000000001;
            else if (maximum >= 2000 && maximum < 2131)
                led = 16'b0000000000000011;
            else if (maximum >= 2131 && maximum < 2262) 
                led = 16'b0000000000000111;
            else if (maximum >= 2262 && maximum < 2393) 
                led = 16'b0000000000001111;
            else if (maximum >= 2393 && maximum < 2524) 
                led = 16'b0000000000011111;
            else if (maximum >= 2524 && maximum < 2655) 
                led = 16'b0000000000111111;
            else if (maximum >= 2655 && maximum < 2786)
                led = 16'b0000000001111111;
            else if (maximum >= 2786 && maximum < 2917)
                led = 16'b0000000011111111;
            else if (maximum >= 2917 && maximum < 3048)
                led = 16'b0000000111111111;
            else if (maximum >= 3048 && maximum < 3179)
                led = 16'b0000001111111111;
            else if (maximum >= 3179 && maximum < 3310)
                led = 16'b0000011111111111; 
            else if (maximum >= 3310 && maximum < 3441)
                led = 16'b0000111111111111;
            else if (maximum >= 3441 && maximum < 3572)
                led = 16'b0001111111111111;
            else if (maximum >= 3572 && maximum < 3703)
                led = 16'b0011111111111111;
            else if (maximum >= 3703 && maximum < 3834)
                led = 16'b0111111111111111;
            else if (maximum >= 3834)
                led = 16'b1111111111111111;
        end
        else
            led = MIC_IN;
        display = maximum;
    end
    
endmodule
