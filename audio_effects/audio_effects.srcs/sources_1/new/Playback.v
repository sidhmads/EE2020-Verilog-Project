`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2017 11:16:23
// Design Name: 
// Module Name: Playback
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


module Playback(
    input CLOCK,
    input clk_20k,
    input togglePlayPause,
    output [11:0] playback
    );
    
    wire current_clk;
    wire Q;
    
    reg toggle = 1;
    reg [12:0] COUNT = 13'b0;
    
    dff debouncer (CLOCK, togglePlayPause, Q);
    
    always @ (posedge Q) begin
        toggle <= ~toggle;
    end
    
    assign current_clk = (toggle == 1) ? clk_20k : toggle;

    always @ (posedge current_clk) begin
        COUNT <= COUNT + 1;
    end
    
    dist_mem_gen_0 dmg0 (COUNT, playback);
    
endmodule
