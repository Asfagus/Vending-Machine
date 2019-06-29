`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:14:01 06/29/2019
// Design Name:   seg_7
// Module Name:   E:/Xilinx/Xilinx_Projects/p7_7_Segment_Display/test.v
// Project Name:  p7_7_Segment_Display
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seg_7
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;
	reg r1;
	reg r2;
	reg r5;
	reg reset;

	// Outputs
	wire [7:0] seg;
	wire [7:0] digit2;
	wire [7:0] digit0;
	wire led_M5;
	wire led_M11;
	wire led_P7;
	wire [3:0] an;
	wire [3:0] bcd;
	wire [1:0] refresh_counter;
	wire divided_clock;
	wire divided_clock1;

	// Instantiate the Unit Under Test (UUT)
	seg_7 uut (
		.clk(clk), 
		.r1(r1), 
		.r2(r2), 
		.r5(r5), 
		.reset(reset), 
		.seg(seg), 
		.digit2(digit2), 
		.digit0(digit0), 
		.led_M5(led_M5), 
		.led_M11(led_M11), 
		.led_P7(led_P7), 
		.an(an), 
		.bcd(bcd), 
		.refresh_counter(refresh_counter), 
		.divided_clock(divided_clock), 
		.divided_clock1(divided_clock1)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		r1 = 0;
		r2 = 0;
		r5 = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		r1 = 1;
		r2 = 0;
		r5 = 0;
		reset = 0;
		#10;
      
		r1 = 0;
		r2 = 1;
		r5 = 0;
		reset = 0;
		#10;
      r1 = 0;
		r2 = 0;
		r5 = 0;
		reset = 0;
		#10;
      
		r1 = 0;
		r2 = 0;
		r5 = 0;
		reset = 0;
		#10;
		
		r1 = 0;
		r2 = 0;
		r5 = 0;
		reset = 1;

		r1 = 0;
		r2 = 1;
		r5 = 0;
		reset = 0;
		
		
		$finish;
		// Add stimulus here

	end
   always begin #5 clk =~clk;   end
     
endmodule

