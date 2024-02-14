`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2024 15:35:58
// Design Name: 
// Module Name: tb
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


module tb( );
reg [1:0] slt;
reg clk;
reg rst;

wire [3:0] led_sel;
wire [7:0] led;

top dut(
    .slt(slt),
    .clk(clk),
    .rst(rst),
    .led_sel(led_sel),
    .led(led)
    );
    
initial begin
    clk=0;
    rst=0;
    slt=2'b00;
    #200 $finish(0);
    end

always 
begin
    #5 clk=~clk;
end
    

endmodule
