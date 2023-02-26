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
//-- Create Date: 16.02.2023 
//-- Module Name: Top_Level 
//----------------------------------------------------------------------------------

module Top_Level(
    input wire Clk_125mhz,
    input wire Reset,
    input wire vp,
    input wire vn,
    output wire [6:0]Salida,
    output wire SEL
);
    //Señales internas
    wire clk100hz;
    wire [6:0]VltDig;
    wire [3:0]panD;
    wire [3:0]panU; 
    wire [3:0]Salida_mux;
    
    
    DivisorDeFrecuencia100Hz Instancia_DivisorDeFrecuencia100Hz( 
        .Clk_125mhz(Clk_125mhz),
        .Reset(Reset),
        .clk100hz(clk100hz)
    );
    CONTROL_XADC Instancia_XADC(        
        .Clk_125mhz(Clk_125mhz),
        .Reset(Reset),
        .vp(vp),
        .vn(vn),
        .VltDig(VltDig)             
    );        
    ModMapeo Instancia_ModMapeo(
        .VltDig(VltDig),
        .panD(panD),
        .panU(panU)
    );
    MUX_Pantallas7seg Instancia_MUX_Pantallas7seg(
        .panD(panD),
        .panU(panU),
        .clk100hz(clk100hz),
        .Salida_mux(Salida_mux),
        .Cat(SEL)
    );
    DecBCDa7Seg Instancia_DecBCDa7Seg(
        .Salida_mux(Salida_mux),
        .Salidas(Salida)
    );
endmodule
