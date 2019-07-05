`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:20:42 06/29/2019
// Design Name:   Timer
// Module Name:   C:/Amrie/HDL1/Traffic_Light_Controller/Timer_TB.v
// Project Name:  Traffic_Light_Controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Timer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Timer_TB;

	// Inputs
	reg Reset_Sync;
	reg clock;
	reg [3:0] Value;
	reg Hz_1_Enable;
	reg Start_Timer;

	// Outputs
	wire Expired;


	// Instantiate the Unit Under Test (UUT)
	Timer uut (
		.Reset_Sync(Reset_Sync),
		.clock(clock), 
		.Value(Value), 
		.Hz_1_Enable(Hz_1_Enable), 
		.Start_Timer(Start_Timer), 
		.Expired(Expired)
	);

	initial begin
		// Initialize Inputs
		Value = 0;
		Hz_1_Enable = 0;
		Start_Timer = 0;
		Reset_Sync = 0;
		// Wait 100 ns for global reset to finish
		#100;
      Value=4'd5;
		Start_Timer=1;
		//Reset_Sync = 1;
		#100
		Start_Timer=0;
		Reset_Sync = 0;
		#2000;
		Start_Timer=1;
		//Reset_Sync = 1;
		#200
		Start_Timer=0;
		Reset_Sync = 0;
		//Value=4'b1000;
		

	end
	
		initial begin 
			Hz_1_Enable=0;
			forever begin
				#500 Hz_1_Enable= ~Hz_1_Enable;
					  end 
					end
      initial begin 
			clock=0;
			forever begin
				#100 clock= ~clock;
					  end 
					end	
	
		
endmodule

