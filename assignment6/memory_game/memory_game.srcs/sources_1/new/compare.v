`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2019 23:52:32
// Design Name: 
// Module Name: compare
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


module compare(
    input [3:0] comp_11,
    input [3:0] comp_12,
    input [3:0] comp_13,
    input [3:0] comp_21,
    input [3:0] comp_22,
    input [3:0] comp_23,
    output reg [1:0] result
    );
    always@*
        begin
            if((comp_11==comp_21) && (comp_12==comp_22) && (comp_13==comp_23))
                begin
                    result<=2'b11;
                end
            else if((comp_11==comp_22) && (comp_12==comp_21) && (comp_13==comp_23))
                begin
                    result<=2'b10;
                end
            else if((comp_11==comp_22) && (comp_12==comp_23) && (comp_13==comp_21))
                begin
                    result<=2'b10;
                end
            else if((comp_11==comp_23) && (comp_12==comp_21) && (comp_13==comp_22))
                begin
                    result<=2'b10;
                end
            else if((comp_11==comp_23) && (comp_12==comp_22) && (comp_13==comp_21))
                begin
                    result<=2'b10;
                end
            else if((comp_11==comp_21) && (comp_12==comp_23) && (comp_13==comp_22))
                begin
                    result<=2'b10;
                end
            else
                begin
                    result<=2'b01;
                end
            
        end
endmodule
