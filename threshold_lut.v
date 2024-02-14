`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 17:29:45
// Design Name: 
// Module Name: threshold_lut
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


module threshold_lut(
    input wire [1:0] slt,
    input wire iclk,
    input wire irst,
    output reg [27:0] thresh_out
    );
    reg [27:0] i0;
    reg [27:0] i1;
    reg [27:0] i2;
    reg [27:0] i3;
    reg [3:0] THRESH_SEL;	
    		
 initial 
 begin
    assign i0=28'b1001011010100101101001011010;
    assign i1=28'b1111000011101011010001011010;
    assign i2=28'b1001011010101010101001011010;
    assign i3=28'b0101010101011010011001011010;
 end   		
    		
  always@ (posedge iclk)
  begin
    if(irst)
      THRESH_SEL <= 4'hX;
    else 						
      THRESH_SEL <= slt;
  end
  
  
	 always @*
	 begin
		case(THRESH_SEL)
		2'b00 : thresh_out<=i0;
		2'b01 : thresh_out<=i1;
		2'b10 : thresh_out<=i2;
		2'b11 : thresh_out<=i3;
		endcase
	 end

endmodule