`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 18:14:15
// Design Name: 
// Module Name: div_bit
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


module div_bit(
    input wire iclk,
    input wire irst,
    input wire [19:0] pos,
    input wire [27:0] thresh,
    output reg [9:0] pos1,
    output reg [9:0] pos2,
    output reg [13:0] thresh1,
    output reg [13:0] thresh2
    );
        
    reg [9:0] ipos1;
    reg [9:0] ipos2;
    
    reg [13:0] ithresh1;
    reg [3:0] ithresh2;
  
   always @*
   begin  
     ipos1<=pos[9:0];
     ipos2<=pos[19:10];
    
     ithresh1<=thresh[13:0];
     ithresh2<=thresh[27:14];
   end
   
    always@ (posedge iclk)
    begin
        if(irst)
        begin
            pos1<=10'bX;
            pos2<=10'bX;
            thresh1<=14'bX;
            thresh2<=14'bX;
        end
        else
        begin
            pos1<=ipos1;
            pos2<=ipos2;
            thresh1<=ithresh1;
            thresh2<=ithresh2;
        end
    end 
    
    
    
endmodule
