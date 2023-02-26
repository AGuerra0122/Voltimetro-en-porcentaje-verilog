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
//-- Module Name: DivisorDeFrecuencia100Hz 
//----------------------------------------------------------------------------------
module DivisorDeFrecuencia100Hz(
    input  wire Clk_125mhz, 
    input wire Reset, 
    output reg clk100hz = 0 
);
    integer Temp_Cuenta = 0; // Un entero es una variable general de 32 bits utilizada para manipular 
    // cantidades que no se consideran registros de hardware.
    always @(posedge(Clk_125mhz), posedge(Reset)) begin 
        if (Reset) 
            Temp_Cuenta <= 0; 
        else begin
            if (Temp_Cuenta <625000) // cuenta debe llegar a 625000 para una frecuencia de 100
                                       // cuenta debe llegar a 62500000 para una frecuencia de 1
                Temp_Cuenta = Temp_Cuenta + 1; 
            else begin
                Temp_Cuenta <= 0; 
                clk100hz = ~clk100hz; 
            end
        end
    end
endmodule
