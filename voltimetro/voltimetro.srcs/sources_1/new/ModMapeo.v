`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2023 01:51:44 PM
// Design Name: 
// Module Name: ModMapeo
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


module ModMapeo(VltDig,panD,panU);    
    input [6:0]VltDig;
    output [3:0]panD;
    output [3:0]panU;
    reg [3:0]panD;
    reg [3:0]panU;
    
    integer vltDig100;
    always @(VltDig)begin
        vltDig100 = VltDig;
        vltDig100 = vltDig100 * 99 / 127;
        panD = vltDig100 / 10;
        panU = vltDig100 % 10;
    
    end
endmodule
