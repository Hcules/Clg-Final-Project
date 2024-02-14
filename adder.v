`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 15:13:01
// Design Name: 
// Module Name: adder
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


module adderr(
    input wire [2:0]a,
    input wire [2:0]b,
	input wire iclk,
    input wire irst,
    output  reg [2:0] adder_out
    );

always @(posedge iclk)
begin
    if(irst)
    begin
        adder_out<=0; 
    end 
    else
    begin 
        adder_out<= a+b;
    end
end

endmodule