`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2024 11:00:58
// Design Name: 
// Module Name: led_lut
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


module led_lut(
    input wire iclk,
    input wire irst,
    input wire [2:0] chk,
    output reg [3:0] led_sel,
    output wire [7:0] lut_out
    );
    
    reg [2:0] ichk;
    reg [7:0] ilut_out;
    
    always @*
    begin
        ichk<=chk;
    end
    
    always @(posedge iclk)
    begin
        if(irst)
        begin
            led_sel<=4'hF;
            ilut_out<=8'hFF;
        end
        else
        begin
            case(ichk)
                3'b001: begin
                    led_sel<=4'b0111;
                    ilut_out<=8'b00000001;
                    end
                3'b010: begin
                    led_sel<=4'b1111;
                    ilut_out<=8'b01000001;
                    end
                3'b100: begin
                    led_sel<=4'b0111;
                    ilut_out<=8'b00000001;
                    end
                default: begin
                    led_sel<=4'b0000;
                    ilut_out<=4'b00000000;
                    end
            endcase
         end
     end  
     
     assign lut_out = ilut_out;         
    
endmodule
