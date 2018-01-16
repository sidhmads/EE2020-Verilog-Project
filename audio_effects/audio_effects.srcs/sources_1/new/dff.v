`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2017 14:44:31
// Design Name: 
// Module Name: dff
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


module dff(
    input CLOCK,
    input D,
    output Q
    );
    
    reg Q1;
    reg Q2;
    
    wire clk_5Hz;
    clk_5HZ clk5Hz (CLOCK, clk_5Hz);
    
    always @ (posedge clk_5Hz) begin
        Q1 <= D;
        Q2 <= Q1;
    end
    
    assign Q = Q1 & ~Q2;
endmodule
