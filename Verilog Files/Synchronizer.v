`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:40:04 06/29/2019 
// Design Name: 
// Module Name:    Synchronizer 
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
module Synchronizer(
    input Reset,
    input Sensor,
    input Walk_Request,
    input Reprogram,
    input clock,
    output reg Reset_Sync,
    output reg Sensor_Sync,
    output reg WR_Sync,
    output reg Prog_Sync
    );
	reg[3:0] sync; 
	 
	//reg  Reset_Sync;
   //reg Sensor_Sync;
   //reg WR_Sync;
   //reg Prog_Sync;


	always @ ( posedge clock )
	begin	
	Reset_Sync<=sync[3];
	Sensor_Sync<=sync[2];
	WR_Sync<=sync[1];
	Prog_Sync<=sync[0];
	
	sync[3]<= Reset;
	sync[2]<= Sensor;
	sync[1]<= Walk_Request;
	sync[0]<= Reprogram;
	
	end



endmodule
