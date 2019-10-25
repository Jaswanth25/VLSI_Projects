`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2019 22:37:08
// Design Name: 
// Module Name: lfsr
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


module lfsr(
    input clk,
    output[3:0] rand_out
    );
    reg reset=1;
    reg  [15:0] lfsr_reg =16'h79ab;
    wire feedback;
    assign feedback = lfsr_reg[15] ^ lfsr_reg[13] ^ lfsr_reg[10];
    assign rand_out = lfsr_reg[10:7];
    always@(posedge clk)
        begin
            if(reset==1)
                begin
                    lfsr_reg <= {feedback,lfsr_reg[15:1]};
                end
            else
                begin
                    reset<=0;
                end
        end
endmodule
