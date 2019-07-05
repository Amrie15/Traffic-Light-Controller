`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:15:05 06/30/2019 
// Design Name: 
// Module Name:    Traffic_Light_Controller 
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
module Traffic_Light_Controller(
    input Reset,
    input Sensor,
    input Walk_Request,
    input Reprogram,
    input [1:0] Time_Parameter,
    input [3:0] Time_Value,
    input clock,
    output [6:0] LEDs
    );
	 
	 wire [1:0] Interval;
	 wire [3:0] Value;
	 wire Reset_Sync,Sensor_Sync,WR_Sync,WR,WR_Reset,Prog_Sync,Start_Timer,Expired,Hz_1_Enabl;
	 
	 Synchronizer synchronizer (
		.Reset(Reset), 
		.Sensor(Sensor), 
		.Walk_Request(Walk_Request), 
		.Reprogram(Reprogram), 
		.clock(clock), 
		.Reset_Sync(Reset_Sync), 
		.Sensor_Sync(Sensor_Sync), 
		.WR_Sync(WR_Sync), 
		.Prog_Sync(Prog_Sync)
	);
	
	Walk_Regiter walk_Regiter (
		.clock(clock), 
		.WR_Sync(WR_Sync), 
		.WR_Reset(WR_Reset), 
		.WR(WR)
	);
	
	Time_Parameters time_Parameters (
		.clock(clock), 
		.Reset_Sync(Reset_Sync), 
		.TP_Selector(Time_Parameter), 
		.Time_Value(Time_Value), 
		.Prog_Sync(Prog_Sync), 
		.Interval(Interval), 
		.Value(Value)
	);
	
	Divider divider (
		.clock(clock), 
		.Hz_1_Enable(Hz_1_Enable)
	);
	
	Timer timer (
		.Reset_Sync(Reset_Sync),
		.clock(clock), 
		.Value(Value), 
		.Hz_1_Enable(Hz_1_Enable), 
		.Start_Timer(Start_Timer), 
		.Expired(Expired)
	);
	
	FSM FSM (
		.Reset_Sync(Reset_Sync),
		.clock(clock), 
		.Sensor_Sync(Sensor_Sync), 
		.WR(WR), 
		.WR_Reset(WR_Reset), 
		.Prog_Sync(Prog_Sync), 
		.Interval(Interval), 
		.Start_Timer(Start_Timer), 
		.Expired(Expired), 
		.LEDs(LEDs)
	);

endmodule
