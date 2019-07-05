`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:35:25 06/30/2019
// Design Name:   Traffic_Light_Controller
// Module Name:   C:/Amrie/HDL1/Traffic_Light_Controller/Traffic_Light_Controller_TB.v
// Project Name:  Traffic_Light_Controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Traffic_Light_Controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Traffic_Light_Controller_TB;

	// Inputs
	reg Reset;
	reg Sensor;
	reg Walk_Request;
	reg Reprogram;
	reg [1:0] Time_Parameter;
	reg [3:0] Time_Value;
	reg clock;

	// Outputs
	wire [6:0] LEDs;

	// Instantiate the Unit Under Test (UUT)
	Traffic_Light_Controller uut (
		.Reset(Reset), 
		.Sensor(Sensor), 
		.Walk_Request(Walk_Request), 
		.Reprogram(Reprogram), 
		.Time_Parameter(Time_Parameter), 
		.Time_Value(Time_Value), 
		.clock(clock), 
		.LEDs(LEDs)
	);

	initial begin
		// Initialize Inputs
		Reset = 0;
		Sensor = 0;
		Walk_Request = 0;
		Reprogram = 0;
		Time_Parameter = 0;
		Time_Value = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always 
		#100 clock=!clock;
	//initial begin
		//Walk_Request=1;
		//#200
		//Walk_Request=0;
	//end
      
endmodule

