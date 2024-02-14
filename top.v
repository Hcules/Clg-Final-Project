`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2024 11:43:55
// Design Name: 
// Module Name: top
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


module top(
    input wire [1:0] slt,
    input wire clk,
    input wire rst,
    
    output wire [3:0] led_sel,
    output wire [7:0] led

    );
    
    wire [2:0] slt_2_pos;
    wire [2:0] slt_2_thresh;
    
    assign slt_2_pos=slt;
    assign slt_2_thresh=slt;
    
    wire [19:0] pos_2_div;
    wire [27:0] thresh_2_div;
    
    wire [9:0] div_2_mem1;
    wire [9:0] div_2_mem2;
    
    wire [13:0] mem1_2_comp1;
    wire [13:0] mem2_2_comp2;
    
    wire [13:0] thresh_2_comp1;
    wire [13:0] thresh_2_comp2;
    
    wire [2:0] comp1_2_adder;
    wire [2:0] comp2_2_adder;
    
    wire [2:0] adder_2_led_lut;
    
    pos_lut Upos_lut (
            .islt(slt_2_pos),
            .iclk(clk),
            .irst(rst),
            .pos_out(pos_2_div)
            );
            
    threshold_lut Uthreshold_lut(
            .islt(slt_2_thresh),
            .iclk(clk),
            .irst(rst),
            .thresh_out(thresh_2_div)
            );
            
    div_bit Udiv_bit(
            .iclk(clk),
            .irst(rst),
            .pos(pos_2_div),
            .thresh(thresh_2_div),
            .pos1(div_2_mem1),
            .pos2(div_2_mem2),
            .thresh1(thresh_2_comp1),
            .thresh2(thresh_2_comp2)
            );
            
    memory Umemory1(
            .iclk(clk),
            .irst(rst),
            .addr(div_2_mem1),
            .data_out(mem1_2_comp1)
            );

    memory Umemory2(
            .iclk(clk),
            .irst(rst),
            .addr(div_2_mem2),
            .data_out(mem2_2_comp2)
            ); 
                    
    comparator_14bit Ucomparator1(
            .iclk(clk),
            .irst(rst),
            .A(mem1_2_comp1),                  
            .B(thresh_2_comp1),
            .comp_out(comp1_2_adder)
            );
            
    comparator_14bit Ucomparator2(
            .iclk(clk),
            .irst(rst),
            .A(mem2_2_comp2),                  
            .B(thresh_2_comp2),
            .comp_out(comp2_2_adder)
            );    
    
    adderr Uadder(
            .a(comp1_2_adder),
            .b(comp2_2_adder),
            .iclk(clk),
            .irst(rst),
            .adder_out(adder_2_led_lut)
            );
            
    led_lut Uled_lut(
            .iclk(clk),
            .irst(rst),
            .chk(adder_2_led_lut),
            .led_sel(led_sel),
            .lut_out(led)
            );        
                
    
endmodule
