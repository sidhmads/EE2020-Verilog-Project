`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2017 15:04:31
// Design Name: 
// Module Name: instrument
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


module instrument(
    input Do,
    input Re,
    input Mi,
    input Fa,
    input So,
    input La,
    input CLK,
    input toggleMixedNotes,
    output sound
    );
    
    wire clkDo;
    wire clkRe;
    wire clkMi;
    wire clkFa;
    wire clkSo;
    wire clkLa;
    wire singleNote;
    wire mixedNotes;
    
    clk_do clkDO (CLK, clkDo);
    clk_re clkRE (CLK, clkRe);
    clk_mi clkMI (CLK, clkMi);
    clk_fa clkFA (CLK, clkFa);
    clk_so clkSO (CLK, clkSo);
    clk_la clkLA (CLK, clkLa);
    
    assign singleNote = (Do == 1) ? clkDo : ( (Re == 1) ? clkRe : ( (Mi == 1) ? clkMi : ( (Fa == 1) ? clkFa : ( (So == 1) ? clkSo : ( (La == 1) ? clkLa : 0 )))));
    assign mixedNotes = (Do & clkDo) | (Re & clkRe) | (Mi & clkMi) | (Fa & clkFa) | (So & clkSo) | (La & clkLa);
    assign sound = (toggleMixedNotes == 1) ? mixedNotes : singleNote;
    
endmodule
