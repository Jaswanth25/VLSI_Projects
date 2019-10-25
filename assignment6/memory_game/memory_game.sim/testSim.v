`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2019 11:08:13
// Design Name: 
// Module Name: testSim
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


module testSim(
 
    );
    reg clk;
    initial begin clk = 0;
        always #1000000000
         clk = ~clk;
        end
endmodule
