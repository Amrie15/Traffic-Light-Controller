`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:26:21 06/30/2019
// Design Name:   FSM
// Module Name:   C:/Amrie/HDL1/Traffic_Light_Controller/FSM_TB.v
// Project Name:  Traffic_Light_Controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_TB;

	// Inputs
	reg Reset_Sync;
	reg clock;
	reg Sensor_Sync;
	reg WR;
	reg Prog_Sync;
	reg Expired;

	// Outputs
	wire WR_Reset;
	wire [1:0] Interval;
	wire Start_Timer;
	wire [6:0] LEDs;

	// Instantiate the Unit Under Test (UUT)
	FSM uut (
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

	initial begin
		// Initialize Inputs
		clock = 0;
		Sensor_Sync = 0;
		WR = 0;
		Prog_Sync = 0;
		Expired = 0;
		Reset_Sync=0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always
		# 100 clock=~clock;
		
	initial begin
	#500 
	Expired=1;
	#200
	Expired=0;
	#500 
	Expired=1;
	#200
	Expired=0;

	end 
		

	
	
      
endmodule

