`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:36:44 06/29/2019 
// Design Name: 
// Module Name:    Time_Parameters 
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
module Time_Parameters(
	 input clock,
	 input Reset_Sync,
    input [1:0] TP_Selector,
    input [3:0] Time_Value,
    input Prog_Sync,
    input [1:0] Interval,
    output reg [3:0] Value
    );
	 
	 reg [3:0] Base=4'd0;
	 reg [3:0] Ext=4'd0;
	 reg [3:0] Yel=4'd0;
	 
	 // Interval[0]=t_BASE 
	 // Interval[1]=t_EXT
	 // Interval[2]=t_YEL
 	 
	 parameter DEFAULT_BASE= 4'b0110;	//6
	 parameter DEFAULT_EXT= 4'b0011;		//3
	 parameter DEFAULT_YEL= 4'b0010;		//2
	 
	 parameter SELECTOR_BASE=2'b00;
	 parameter SELECTOR_EXT=2'b01;
	 parameter SELECTOR_YEL=2'b10;
	 initial 
	 begin 
	 Base <= DEFAULT_BASE;
	 Ext <= DEFAULT_EXT;
	 Yel <= DEFAULT_YEL;
	 end
	 
	 always @ (posedge clock)
	 begin
		if(Reset_Sync)
		begin
			Base <= DEFAULT_BASE;
			Ext <= DEFAULT_EXT;
			Yel <= DEFAULT_YEL;
		end 
		else if(Prog_Sync)
		begin
			case(TP_Selector)
				SELECTOR_BASE: Base <= (Time_Value !== 4'b0000) ? Time_Value : 4'b0001;
				SELECTOR_EXT: Ext <= (Time_Value !== 4'b0000) ? Time_Value : 4'b0001;
				SELECTOR_YEL: Yel <= (Time_Value !== 4'b0000) ? Time_Value : 4'b0001;
				default :
				begin 
					Base<=4'b1111;
					Ext<=4'b1111;
					Yel<=4'b1111;
					
				end 
			endcase 
				
		end 
		case (Interval)
			SELECTOR_BASE: Value <= Base;
			SELECTOR_EXT: Value <= Ext;
			SELECTOR_YEL: Value <= Yel;
			default: 
			begin
				Value=4'b1111;
			end 
		endcase 
		
	 end 
	 
endmodule
