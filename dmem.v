`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/23 23:23:36
// Design Name: 
// Module Name: dmem
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


module dmem(
input clk,
input wena,
input [31:0] raddr,
input [31:0] waddr,
input [31:0] wdata,
input [2:0]choose,
output reg  [31:0] data_out
    );
reg [7:0]memory[1024-1:0];

parameter LB=0;
parameter LBU=1;
parameter LH=2;
parameter LHU=3;
parameter LW=4;
parameter SB=5;
parameter SW=6;
parameter SH=7;

    always@(posedge clk)
        begin
          if(wena)
       case(choose)
           SB:memory [waddr-32'h10010000]<=wdata[7:0];
           SW:{memory[waddr-32'h10010000],memory[waddr-32'h10010000+1],memory[waddr-32'h10010000+2],memory[waddr-32'h10010000+3]}<=wdata;
           SH:{memory[waddr-32'h10010000],memory[waddr-32'h10010000+1]}<=wdata[15:0];
endcase
end
      always @(*)
      begin
       case(choose)
           LB: data_out={{24{memory[raddr-32'h10010000][7]}},memory[raddr-32'h10010000]};
           LBU: data_out={24'b0,memory[raddr-32'h10010000]};
           LH: data_out={{16{memory[raddr-32'h10010000][7]}},memory[raddr-32'h10010000],memory[raddr-32'h10010000+1]};
           LHU: data_out={16'b0,memory[raddr-32'h10010000],memory[raddr-32'h10010000+1]};
           LW: data_out={memory[raddr-32'h10010000],memory[raddr-32'h10010000+1],memory[raddr-32'h10010000+2],memory[raddr-32'h10010000+3]};
endcase
end
endmodule
