//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Wed Sep 29 20:45:58 2021
//Host        : Pavel-PC running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (rst,
    rst_n,
    sys_clk,
    uart_rxd,
    uart_txd);
  input rst;
  input rst_n;
  input sys_clk;
  input uart_rxd;
  output uart_txd;

  wire rst;
  wire rst_n;
  wire sys_clk;
  wire uart_rxd;
  wire uart_txd;

  design_1 design_1_i
       (.rst(rst),
        .rst_n(rst_n),
        .sys_clk(sys_clk),
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd));
endmodule
