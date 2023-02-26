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
//-- Module Name: muxPantallas7Seg
//----------------------------------------------------------------------------------
module MUX_Pantallas7seg(
    input wire clk100hz,
    input [3:0] panU,
    input [3:0] panD,    
    output reg [3:0] Salida_mux = 0,
    output reg Cat=0       
    ); 
    integer Selc = 0;
     
    always@(posedge(clk100hz)) begin 
        if(Selc==1) begin
            Cat = 0;
            Salida_mux = panU;
            Selc = 0;
        end
        else begin
            Cat = 1;
            Salida_mux = panD;
            Selc = 1;
        end
    end
endmodule
