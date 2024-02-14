`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 17:25:25
// Design Name: 
// Module Name: pos_lut
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


module pos_lut(

    input wire [1:0] slt,
    input wire iclk,
    input wire irst,
    output reg [19:0] pos_out
    );
    reg [19:0] i0;
    reg [19:0] i1;
    reg [19:0] i2;
    reg [19:0] i3;
    reg [3:0] POS_SEL;	
    		
 initial 
 begin
    assign i0=20'b10010110101001011010;
    assign i1=20'b11110000111001011010;
    assign i2=20'b10101010101001011010;
    assign i3=20'b01010101011001011010;
 end   		
    		
  always@ (posedge iclk)
  begin
    if(irst)
      POS_SEL <= 4'hX;
    else 						
      POS_SEL <= slt;
  end
  
  
	 always @*
	 begin
		case(POS_SEL)
		2'b00 : pos_out<=i0;
		2'b01 : pos_out<=i1;
		2'b10 : pos_out<=i2;
		2'b11 : pos_out<=i3;
		endcase
	 end

endmodule