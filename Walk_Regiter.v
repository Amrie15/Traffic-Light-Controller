`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:18:35 06/29/2019 
// Design Name: 
// Module Name:    Walk_Regiter 
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
module Walk_Regiter(
	 input clock,
    input WR_Sync,
    input WR_Reset,
    output reg WR
    );
	 
	 always @ (posedge clock)
	 begin
	 if (WR_Reset)
	 begin
			WR<= 0; 
	 end
	 else 
	 begin
		if(WR)
		begin
			 WR<=WR;
		end
		else
		begin
			 WR<=WR_Sync;
		end
		end 
	 end 
	

endmodule
