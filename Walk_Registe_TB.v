`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:38:10 06/29/2019
// Design Name:   Walk_Regiter
// Module Name:   C:/Amrie/HDL1/Traffic_Light_Controller/Walk_Registe_TB.v
// Project Name:  Traffic_Light_Controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Walk_Regiter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Walk_Registe_TB;

	// Inputs
	reg clock;
	reg WR_Sync;
	reg WR_Reset;

	// Outputs
	wire WR;

	// Instantiate the Unit Under Test (UUT)
	Walk_Regiter uut (
		.clock(clock), 
		.WR_Sync(WR_Sync), 
		.WR_Reset(WR_Reset), 
		.WR(WR)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		WR_Sync = 0;
		WR_Reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always 
			#10 clock=!clock;
			
	initial begin
	WR_Sync =1;
	#20
	WR_Sync=0;
	#200
	WR_Reset=1;
	#50
 	
	# 500
	$finish;
	end 
      
endmodule

