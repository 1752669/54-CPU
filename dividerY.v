`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/25 20:08:58
// Design Name: 
// Module Name: dividerY
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


module dividerY(
input clk,rst,ena,
input [63:0]data_in,
output reg [63:0] data_out
);

always@(posedge clk or posedge rst )
begin
if (rst)
    data_out <= 0;
else if (ena)
    data_out <= data_in;
else
    data_out <= data_out;
end
endmodule
