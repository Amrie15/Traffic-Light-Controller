`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:28:25 06/30/2019 
// Design Name: 
// Module Name:    FSM 
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
module FSM(
	 input Reset_Sync,
	 input clock,
    input Sensor_Sync,
    input WR,
    output reg WR_Reset,
    input Prog_Sync,
    output reg [1:0] Interval,
    output reg Start_Timer,
    input Expired,
    output reg [6:0] LEDs
    );
	 
	 
	 reg [3:0] state;
	 
	parameter S0_Gm = 0;
	parameter S1_Gm_HIGH_TRAFFIC  = 1;
	parameter S2_Gm_LOW_TRAFFIC = 2;
	parameter S3_Ym = 3;
	parameter S4_WALK_REQ = 4;
	parameter S5_Gs = 5;
	parameter S6_Gs_HIGH_TRAFFIC = 6;
	parameter S7_Ys = 7;
	
	parameter ON=1;
	parameter OFF=0;
	
	parameter tBASE=2'd0;
	parameter tEXT=2'd1;
	parameter tYEL=2'd2;
	
	
	 //LEDs[6] = Rm
	 //LEDs[5] = Ym
	 //LEDs[4] = Gm
	 //LEDs[3] = Rs
	 //LEDs[2] = Ys
	 //LEDs[1] = Gs
	 //LEDs[0] = Walk
	 parameter Rm = 7'b1000000;
	 parameter Ym = 7'b0100000;
	 parameter Gm = 7'b0010000;
	 parameter Rs = 7'b0001000;
	 parameter Ys = 7'b0000100;
	 parameter Gs = 7'b0000010;
	 parameter Walk=7'b0000001;
	 
	initial 
	begin
		Interval<=2'd0;
		LEDs<=Ym|Ys|Walk;
		state=S0_Gm;
		WR_Reset=OFF;
		
	end
	
	
	always @ (posedge clock)
	begin
		Start_Timer=0;
		
		if (Reset_Sync || Prog_Sync)
		begin
			state<=S0_Gm;
			Interval<=tBASE;
			Start_Timer=ON;
			WR_Reset=OFF;
		end
		
		if(Expired)
		begin
			Start_Timer<=ON;
			case(state)
				S0_Gm:
				begin
					// High Traffic
					if(Sensor_Sync)
					begin
						Interval<=tEXT;
						state<=S1_Gm_HIGH_TRAFFIC;
					end
					// No Traffic
					else
					begin
						Interval<=tBASE;
						state<=S2_Gm_LOW_TRAFFIC;
					end
				end
				
				S1_Gm_HIGH_TRAFFIC:
				begin
					Interval<=tEXT;
					state<=S3_Ym;
				end
				
				S2_Gm_LOW_TRAFFIC:
				begin
					Interval<=tEXT;
					state<=S3_Ym;
				end
				
				S3_Ym:
				begin
					// Pedastrians make a request
					if (WR)
					begin
						Interval<=tEXT;
						state<=S4_WALK_REQ;
					end
					else
					begin
						Interval<=tBASE;
						state<=S5_Gs;
					end
				end
				
				S4_WALK_REQ:
				begin
					Interval<=tBASE;
					state<=S5_Gs;
					WR_Reset=ON;
				end
				
				S5_Gs:
				begin
					if(Sensor_Sync)
					begin
						Interval<=tEXT;
						state<=S6_Gs_HIGH_TRAFFIC;
					end
					else
					begin
						Interval<=tBASE;
						state<=S7_Ys;
					end
				end
				
				S6_Gs_HIGH_TRAFFIC:
				begin
					Interval<=tYEL;
					state<=S7_Ys;
				end
				
				S7_Ys:
				begin
					Interval<=tBASE;
					state<=S0_Gm;
				end
					
			default:begin
				state<=4'd15;
			end
			endcase 
		end
		else
		begin
			case (state)
			S0_Gm:LEDs<=Gm|Rs;
			S1_Gm_HIGH_TRAFFIC:LEDs<=Gm|Rs;
			S2_Gm_LOW_TRAFFIC:LEDs<=Gm|Rs;
			S3_Ym:LEDs<=Ym|Rs;
			S4_WALK_REQ:LEDs<=Rm|Rs|Walk;
			S5_Gs:LEDs<=Gs|Rm;
			S6_Gs_HIGH_TRAFFIC:LEDs<=Gs|Rm;
			S7_Ys:LEDs<=Ys|Rm;
			
			default:begin
				LEDs<=Ym|Ys|Walk;
			end
			
			endcase
		end
		
	end 


endmodule
