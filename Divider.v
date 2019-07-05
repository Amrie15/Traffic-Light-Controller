`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:21 06/29/2019 
// Design Name: 
// Module Name:    Divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Divider(
    input clock,
    output reg Hz_1_Enable
    );
	 reg[21:0] counter;
	 initial 
	 begin 
		counter=0;
		Hz_1_Enable=0;
	 end

	 always @ (posedge clock)
	 begin
		if(counter == 0)
		begin
			// 5MHz
			counter<=22'd2499999;
			Hz_1_Enable<=!Hz_1_Enable;
		end
		else
		begin
			counter<=counter-1;
		end
	 end
	 
	 
	 


endmodule
