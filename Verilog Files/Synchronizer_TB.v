`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:42:24 06/29/2019
// Design Name:   Synchronizer
// Module Name:   C:/Amrie/HDL1/Traffic_Light_Controller/Synchronizer_TB.v
// Project Name:  Traffic_Light_Controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Synchronizer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Synchronizer_TB;

	// Inputs
	reg Reset;
	reg Sensor;
	reg Walk_Request;
	reg Reprogram;
	reg clock;

	// Outputs
	wire Reset_Sync;
	wire Sensor_Sync;
	wire WR_Sync;
	wire Prog_Sync;

	// Instantiate the Unit Under Test (UUT)
	Synchronizer uut (
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

	initial begin
		// Initialize Inputs
		Reset = 0;
		Sensor = 0;
		Walk_Request = 0;
		Reprogram = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always 
			#10 clock=!clock;
			
	initial begin
		Reset = 1;
		Sensor=1;
		Walk_Request=1;
		Reprogram=1;
		#15
		Reset =0;
		Sensor=0;
		Walk_Request=0;
		Reprogram=0;
	
	
	# 500
	$finish;
	end 
      
endmodule

