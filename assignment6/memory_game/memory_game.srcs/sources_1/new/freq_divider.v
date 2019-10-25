`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2019 22:45:03
// Design Name: 
// Module Name: freq_div
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


module freq_div(
    input clk_in,
    output reg clk_reduced
    );
    parameter DIV =100;
    reg [$clog2(DIV)-1:0] counter=0;
    reg rst=1;
    always@(posedge clk_in)
        begin
            if(rst)
                begin
                    rst<=0;
                    counter<=0;
                    clk_reduced<=0;
                end
             else 
                begin
                    if(counter==DIV)
                        begin
                            clk_reduced=~clk_reduced;
                            counter<=0;
                        end
                    else
                        begin
                            counter<=counter+1;
                        end
                end
        end
endmodule
