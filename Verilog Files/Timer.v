`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:28:43 06/29/2019 
// Design Name: 
// Module Name:    Timer 
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
//Test
module Timer(
	 input [3:0] Value,
    input Hz_1_Enable,
    input Start_Timer,
	 input clock,
	 input Reset_Sync,
    output reg Expired
    );
	 
	reg [3:0] count;
	reg mem;
	 initial 
	 begin
		count=4'd0;
		mem=1;
	 end
	 
	 
	always@(posedge clock) 
	begin
		
		if (Reset_Sync)begin
			count = 0;
		end			
		if (Start_Timer) 
		begin
			mem=1;
			count =0;
		end
		Expired = 0;
		
		if (count==Value) 
		begin
			Expired=1;
			mem=0;
			count=0;
		end
		else
		begin
			Expired =0;
		end
																			
	end	
	
	always @ (posedge Hz_1_Enable)
	begin
		if(mem)
		begin
		count=count+1;
		end
	end
endmodule
