`timescale 1ns / 1ps

//Clock Divider module
//Formula (50mhz/(2*Freq))  - 1  
//1hz: 24999999  2Hz: 12499999 50Hz: 499999 100Hz: 249999 10khz: 4999

module Clock(
	input clk,
	output reg divided_clock,
	output reg divided_clock1
	
    );

localparam div_value = 4999;// Refresh clock
localparam div_value1 = 24999999;//pushbutton 

integer counter_value = 0;
integer counter_value1 = 0;

always @ (posedge clk)
begin
	
	//clock
	if (counter_value == div_value)
		counter_value <= 0;
	else
		counter_value <= counter_value+1;
	//clock1	
	if (counter_value1 == div_value1)
		counter_value1 <= 0;
	else
		counter_value1 <= counter_value1+1;
end

always @ (posedge clk)
begin
	//clock
	if (counter_value == div_value)
		divided_clock <= ~divided_clock;
	else
		divided_clock <= divided_clock;
	//clock1	
	if (counter_value1 == div_value1)
		divided_clock1 <= ~divided_clock1;
	else
		divided_clock1 <= divided_clock1;

end


endmodule
