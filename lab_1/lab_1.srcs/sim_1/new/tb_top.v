`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 29.09.2021 20:42:27
// Design Name:
// Module Name: tb_top
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


module tb_top();

  reg rst = 1;
  reg sys_clk = 0;
  reg uart_rxd;
  wire uart_txd;

  initial
    forever
      #(83.33/2
) sys_clk <= ~sys_clk;

  initial
  begin
    #100 rst <= 0;
  end

  design_1_wrapper dut
                   (.rst(rst),
                    .rst_n(~rst),
                    .sys_clk(sys_clk),
                    .uart_rxd(uart_rxd),
                    .uart_txd(uart_txd));

endmodule
