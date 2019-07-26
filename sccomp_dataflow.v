`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/03 15:45:20
// Design Name: 
// Module Name: sccomp_dataflow
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


module sccomp_dataflow(
    input clk_in,
    input reset, 
    output [31:0] inst,
    output reg [31:0] pc
);

_CPU54 sccpu(.clock(clk_in), .reset(reset));

assign inst = sccpu.iROut;

always @(posedge clk_in or posedge reset) begin
    if (reset)
        pc <= 32'h00400000;
    else if (sccpu.controller.state == 3'd0) begin
        pc = sccpu.pcOut;
    end else begin
        pc = pc;
    end
end

endmodule
