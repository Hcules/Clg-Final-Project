`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 15:21:53
// Design Name: 
// Module Name: memory
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


module memory
(
  input wire iclk,
  input wire irst,
  input wire wr_en,
  input wire rd_en,
  input wire [9:0] addr,
  input wire [13:0] data_in,
  output reg [13:0] data_out
);

  reg [13:0] memory [0:1023];
  assign rd_en=1;
  
 initial
  begin
    $readmemh("C:/Users/kudsit/OneDrive/Desktop/Sarath/Clg Main/code.txt", memory);
  end
  
  
  always @(posedge iclk)
  begin
    if(wr_en)
      memory[addr] <= data_in;
    if(rd_en)
      data_out <= memory[addr];
  end

endmodule