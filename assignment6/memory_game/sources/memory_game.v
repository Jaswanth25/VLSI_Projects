`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2019 16:47:27
// Design Name: 
// Module Name: mem_game
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


module mem_game(
    input clk,
    input start,
    input enter,
    input [3:0] input_value,
    output reg [7:0] out
    );
    
    //memory store locations
    reg [3:0] primary_mem [0:3];
    reg [3:0] secondary_mem [0:2];
    reg [1:0] address_p=0;
    reg [1:0] address_s=0;
    reg [1:0] address_i=0;
    
    
    //flags for acknowledgement
    reg flag_store_over=0;
    reg flag_show_over=0;
    reg flag_input_over=0;
    
    
    //reduced clk
    wire clk_reduced;
    
    //temp_variables
    wire [3:0] temp_rand;
    wire [1:0] result;
    reg [7:0] dummy_display;
    reg [25:0] debounce =0;
    
    
    //modules that run independently
    lfsr rand(.clk(clk),.rand_out(temp_rand));
    freq_div #(.DIV(100_000_000)) f(.clk_in(clk),.clk_reduced(clk_reduced));
    compare comp(.comp_11(primary_mem[0]),.comp_12(primary_mem[1]),.comp_13(primary_mem[2]),
                  .comp_21(secondary_mem[0]),.comp_22(secondary_mem[1]),.comp_23(secondary_mem[2]),.result(result));
    
    
    //store random numbers
    always@(posedge clk)
        begin
            if(start && address_p<3)
                begin
                    primary_mem[address_p] =temp_rand;
                    address_p <=address_p+1;
                    flag_store_over <=0;
                end
            else if(start && address_p==3)
                begin
                    flag_store_over<=1;
                    address_p<=address_p;
                end
            else
                begin
                    flag_store_over<=0;
                    address_p<=0;
                end
        end
    always@(posedge clk_reduced)
        begin
            if(flag_store_over==1 && address_s<3)
                begin
                    dummy_display = primary_mem[address_s];
                    address_s <= address_s+1;
                    flag_show_over <=0;
                end
            else if(flag_store_over==1 && address_s==3)
                begin
                    flag_show_over<=0;
                    address_s<=address_s+1;
                    dummy_display <= 8'b11111111;
                end
            else if(flag_store_over==1 && address_s==4)
                begin
                    flag_show_over<=1;
                    address_s<=address_s;
                    dummy_display<=0;
                end
            else
                begin
                    flag_show_over<=0;
                    address_s<=0;
                end
        end
    //user input store with debounce
    always@(posedge clk)
        begin
            if(debounce ==26'b11_1111_1111_1111_1111_1111_1111)
                begin
                    if(enter && address_i<3)
                        begin
                            secondary_mem[address_i] =input_value;
                            address_i<= address_i+1;
                            debounce<=0;
                        end
                     else if(enter && address_i==3)
                        begin
                            flag_input_over<=1;
                            address_i<=address_i;
                            debounce<=debounce;
                        end
                     else
                        begin
                            debounce<=debounce;
                        end
                end
            else
                begin
                    debounce<=debounce+1;
                    flag_input_over<=0;
                end
        end                    
        
        //decide winner     
        always@(posedge clk)
            begin
                if(flag_input_over)
                    begin
                        if(result==2'b11)
                            begin
                                out<=8'b11111111;
                            end
                        else if(result==2'b10)
                            begin
                                out<=8'b10101010;
                            end
                        else 
                            begin
                                out<=8'b00000000;
                            end
                    end
                else
                    begin
                        flag_input_over<=flag_input_over;
                    end
            end      
    
endmodule
