`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2024 10:30:27
// Design Name: 
// Module Name: comparator_14bit
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


module comparator_14bit(
  inout wire iclk,
  input wire irst,
  input wire [13:0] A,
  input wire [13:0] B,
  output reg [0:2] comp_out
);
    reg [13:0] iA;
    reg [13:0] iB;
  
  always @* 
  begin  
    iA <= A;
    iB <= B; 
  end
  
    always@(posedge iclk)
    begin
        if(irst)
            comp_out<=3'b000;
        else
        begin
            if(iA<iB)
                comp_out<=3'b001;
            else if (iA==iB)
                comp_out<=3'b010;
            else if (iA>iB)
                comp_out<=3'b100;
         end
    end


endmodule