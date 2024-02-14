`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 16:00:42
// Design Name: 
// Module Name: mux
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

module mux(
  //  input wire [9:0] i0,
  //  input wire [9:0] i1,
   // input wire [9:0] i2,
  //  input wire [9:0] i3,
    input wire [1:0] slt,
    input wire iclk,
    input wire irst,
    output reg [9:0] mux_out
    );
    reg [9:0] i0;
    reg [9:0] i1;
    reg [9:0] i2;
    reg [9:0] i3;
    reg [3:0] APHASE_MUX_SEL;	
    		
 initial 
 begin
    assign i0=10'b1001011010;
    assign i1=10'b1111000011;
    assign i2=10'b1010101010;
    assign i3=10'b0101010101;
 end   		
    		
  always@ (posedge iclk)
  begin
    if(irst)
      APHASE_MUX_SEL <= 4'h0;
    else 						
      APHASE_MUX_SEL <= slt;
  end
  
  
	 always @*
	 begin
		case(APHASE_MUX_SEL)
		2'b00 : mux_out<=i0;
		2'b01 : mux_out<=i1;
		2'b10 : mux_out<=i2;
		2'b11 : mux_out<=i3;
		endcase
	 end

endmodule
