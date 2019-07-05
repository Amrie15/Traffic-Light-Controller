`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:48:16 06/29/2019
// Design Name:   Divider
// Module Name:   C:/Amrie/HDL1/Traffic_Light_Controller/Diveder_TB.v
// Project Name:  Traffic_Light_Controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Diveder_TB;

	// Inputs
	reg clock;

	// Outputs
	wire Hz_1_Enable;

	// Instantiate the Unit Under Test (UUT)
	Divider uut (
		.clock(clock), 
		.Hz_1_Enable(Hz_1_Enable)
	);

	initial begin
		// Initialize Inputs
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always 
			#100 clock=!clock;
			

      
endmodule

