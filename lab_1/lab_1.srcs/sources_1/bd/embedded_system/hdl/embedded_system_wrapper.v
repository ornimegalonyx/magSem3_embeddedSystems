//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Wed Sep 29 06:34:54 2021
//Host        : Pavel-PC running 64-bit major release  (build 9200)
//Command     : generate_target embedded_system_wrapper.bd
//Design      : embedded_system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module embedded_system_wrapper
   (clk_sys,
    rst,
    uart_rxd,
    uart_txd);
  input clk_sys;
  input rst;
  input uart_rxd;
  output uart_txd;

  wire clk_sys;
  wire rst;
  wire uart_rxd;
  wire uart_txd;

  embedded_system embedded_system_i
       (.clk_sys(clk_sys),
        .rst(rst),
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd));
endmodule
