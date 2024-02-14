`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 17:02:04
// Design Name: 
// Module Name: memory_3bit
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


module memory_3bit(
  input wire iclk,
  input wire irst,
  input wire wr_en,
  input wire rd_en,
  input wire [9:0] addr,
  input wire [13:0] data_in,
  output reg [13:0] data_out
    );
    
   reg [2:0] memory [0:3];
   
   always @(posedge iclk)
  begin
    if(wr_en)
      memory[addr] <= data_in;
    if(rd_en)
      data_out <= memory[addr];
  end
    
    
    
    
    
    
endmodule
