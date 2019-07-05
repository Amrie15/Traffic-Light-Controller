`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:53:04 06/29/2019
// Design Name:   Time_Parameters
// Module Name:   C:/Amrie/HDL1/Traffic_Light_Controller/Time_Parameters_TB.v
// Project Name:  Traffic_Light_Controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Time_Parameters
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////


module Time_Parameters_TB;

	// Inputs
	reg clock;
	reg Reset_Sync;
	reg [1:0] TP_Selector;
	reg [3:0] Time_Value;
	reg Prog_Sync;
	reg [1:0] Interval;

	// Outputs
	wire [3:0] Value;

	// Instantiate the Unit Under Test (UUT)
	Time_Parameters uut (
		.clock(clock), 
		.Reset_Sync(Reset_Sync), 
		.TP_Selector(TP_Selector), 
		.Time_Value(Time_Value), 
		.Prog_Sync(Prog_Sync), 
		.Interval(Interval), 
		.Value(Value)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		Reset_Sync = 0;
		TP_Selector = 0;
		Time_Value = 0;
		Prog_Sync = 0;
		Interval = 0;

		// Wait 100 ns for global reset to finish
		#100;
		Interval=2'd00;
		#200;
		Interval= 2'b01;
		#200;
		//Time_Value=4'd9;
		//#20;
		//Prog_Sync=0;
		//#100;
		// Add stimulus here

	end
	
	
	always 
			#10 clock=!clock;
			
	initial begin
	//Prog_Sync =1;
	//TP_Selector= 2'b00;
	//Time_Value=4'd12;
	//#20
	//Prog_Sync=0;
	//#30
	//Interval=2'd1;
	//Prog_Sync =1;
	
	
	
	
	
	
	
	end
      
endmodule

