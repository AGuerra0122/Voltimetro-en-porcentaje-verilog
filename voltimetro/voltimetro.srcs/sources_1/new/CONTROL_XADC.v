//      Create Date: 03/10/2022 07:31:51 AM
//      Module Name: Ejemplo de Manejo_XADC 
//      Revision 0.01 - File Created
//      Additional Comments:
//                                  SEconFPGA     ehv
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module CONTROL_XADC(
    input Clk_125mhz,
    input Reset,
    input vp,
    input vn,
    output [6:0] VltDig
    );

    wire [15:0] reading ;

    XADC #(	// INIT_40 - INIT_42: XADC configuration registers
            .INIT_40(16'h3003), /* Canal 6, Tiempo de ACQ No-Incrementado, Muestreo Continuo, Unipolar, Mux-Ext no habilitado
                                   Promedio de 256 Muestras de la Señal, Promedio de 16 muestras para calcular Coeficientes de Calibración */
            .INIT_41(16'h3FAF), /* Over-Temp y Alarmas (7) No-Habilitadas, Corrección de Offset y Gain ERRORs del ADC y de la FUENTE DE 
                                   ALIMENTACIÓN, Modo de 1 solo canal */
            .INIT_42(16'h0F00)  /*  ADCCLK = DCLK/5 = 125MHz/F = 8.33 MHz, ADC = 962 Ksps */
          )

    XADC_inst (	// ALARMS: 8-bit (each) output: ALM, OT
                    .ALM(), // 8-bit output: Output alarm for temp, Vccint, Vccaux and Vccbram
                    .OT(), // 1-bit output: Over-Temperature alarm
                // Dynamic Reconfiguration Port (DRP): 16-bit (each) output: Dynamic Reconfiguration Ports
                    .DO(reading), // 16-bit output: DRP output data bus
                    .DRDY(), // 1-bit output: DRP data ready
                // STATUS: 1-bit (each) output: XADC status ports
                    .BUSY(), // 1-bit output: ADC busy output
                    .CHANNEL(), // 5-bit output: Channel selection outputs
                    .EOC(), // 1-bit output: End of Conversion
                    .EOS(), // 1-bit output: End of Sequence
                    .JTAGBUSY(), // 1-bit output: JTAG DRP transaction in progress output
                    .JTAGLOCKED(), // 1-bit output: JTAG requested DRP port lock
                    .JTAGMODIFIED(), // 1-bit output: JTAG Write to the DRP has occurred
                    .MUXADDR(), // 5-bit output: External MUX channel decode
                // Auxiliary Analog-Input Pairs: 16-bit (each) input: VAUXP[15:0], VAUXN[15:0]
                    .VAUXN(), // 16-bit input: N-side auxiliary analog input
                    .VAUXP(), // 16-bit input: P-side auxiliary analog input
                // CONTROL and CLOCK: 1-bit (each) input: Reset, conversion start and clock inputs
                    .CONVST(), // 1-bit input: Convert start input
                    .CONVSTCLK(), // 1-bit input: Convert start input
                    .RESET(Reset), // 1-bit input: Active-high reset
                // Dedicated Analog Input Pair: 1-bit (each) input: VP/VN
                    .VN(vn), // 1-bit input: N-side analog input
                    .VP(vp), // 1-bit input: P-side analog input
                // Dynamic Reconfiguration Port (DRP): 7-bit (each) input: Dynamic Reconfiguration Ports
                    .DADDR(7'h03), // 7-bit input: DRP address bus
                    .DCLK(Clk_125mhz), // 1-bit input: DRP clock
                    .DEN(1), // 1-bit input: DRP enable signal
                    .DI(), // 16-bit input: DRP input data bus
                    .DWE(0) // 1-bit input: DRP write enable
                );

    assign VltDig = reading[15:9];
   
endmodule