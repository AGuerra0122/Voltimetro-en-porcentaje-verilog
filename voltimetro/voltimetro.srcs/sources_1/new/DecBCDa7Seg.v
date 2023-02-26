`timescale 1ns / 1ps
//----------------------------------------------------------------------------------
//-- Sistemas con FPGA y SoC
//-- Enrique Gerardo Hernandez Vega
//-- Contador_0-59_Cora
//-- Archivo fuente de diseño
//-- Equipo:
//-- Andrew Joshua Barrientos Lonzo 19060754
//-- Jesús Adrián Guerra Delgado 19060742
//-- Jaime Alejandro Herrera Armendariz 19060748
//-- Create Date: 15.02.2023 
//-- Module Name: DecBCDa7Seg 
//----------------------------------------------------------------------------------
module DecBCDa7Seg (Salida_mux, Salidas);
    input [3:0] Salida_mux;
    output [6:0] Salidas;
    reg [6:0] Salidas;
 always @(Salida_mux) begin
    case (Salida_mux) 
    // Cátodo Común g f e d c b a
        0: Salidas = 7'b0111111;
        1: Salidas = 7'b0000110;
        2: Salidas = 7'b1011011;
        3: Salidas = 7'b1001111;
        4: Salidas = 7'b1100110;
        5: Salidas = 7'b1101101;
        6: Salidas = 7'b1111101;
        7: Salidas = 7'b0000111;
        8: Salidas = 7'b1111111;
        9: Salidas = 7'b1101111;
        default: Salidas = 7'bz;
    endcase
 end
endmodule
