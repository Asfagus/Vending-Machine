`timescale 1ns / 1ps
//This is the Project for Vending Machine
//Make it modular and warning free
module top(
	input clk,
	input r1,r2,r5,reset,
	output reg [7:0] seg,
	output reg [7:0] digit2,
	output reg [7:0] digit0,
	output reg led_M5,led_M11,led_P7,
	output reg [3:0] an,
	output reg [3:0]bcd,
	output reg [1:0]refresh_counter = 0
	 );
//output reg divided_clock = 0,
//output reg divided_clock1 = 0
    	 
	 
wire divided_clock,divided_clock1;

Clock Clock(clk,divided_clock,divided_clock1);
 

//7segment selector for money collector
always @ (refresh_counter)
begin
	case (refresh_counter)
		2'b00: 
		begin
			an <= 4'b1110;
			seg <= digit0;
		end
		2'b01:
		begin
			an <= 4'b1101;
			seg <= 8'b11000000;
		end
		2'b10: 
		begin
			an <= 4'b1011;
			seg <= digit2;
		end
		2'b11: 
		begin
			an <= 4'b0111;
			seg <= 8'b11000000;
		end
	endcase
end

//Money collector
always @ (posedge divided_clock1 or posedge reset)
begin
	if(reset)
		begin
			bcd <= 0;//should be zero not 15
			led_M11 <= 1'b0;
			led_M5 <= 1'b0;
		end
	else
		begin
			if(r1)
			bcd <= bcd +1;
			else if(r2)
				bcd <= bcd +2;
			else if(r5)
				bcd <= bcd +5;
			else bcd <= bcd;
			//Drink costs 10Rs
			if(bcd > 9)
			begin
				if (bcd >= 10)
				begin
					if (bcd > 10)
					begin
						led_M11 <= 1'b1;//Drink out
					end
					led_M5  <= 1'b1;//change
				end
				bcd <= 0;
			end
		end
end

//money updater
always @(bcd)
begin
	case (bcd) //case statement
		0 : 
		begin
			digit2 <= 8'b11000000;
			if (bcd < 10) //To reset Change
				digit0 <= 8'b11000000;
		end
		1 : 
		begin
			digit2 <= 8'b11111001;
			if (bcd < 10) //To reset Change
				digit0 <= 8'b11000000;
		end
		2 : 
		begin
			digit2 <= 8'b10100100;
			if (bcd < 10) //To reset Change
				digit0 <= 8'b11000000;
		end
		3 : 
		begin
			digit2 <= 8'b10110000;
			if (bcd < 10) //To reset Change
				digit0 <= 8'b11000000;
		end
		4 : 
		begin
			digit2 <= 8'b10011001;
			if (bcd < 10) //To reset Change
				digit0 <= 8'b11000000;
		end
		5 : 
		begin
			digit2 <= 8'b10010010;
			if (bcd < 10) //To reset Change
				digit0 <= 8'b11000000;
		end
		6 : 
		begin
			digit2 <= 8'b10000010;
			if (bcd < 10) //To reset Change
				digit0 <= 8'b11000000;
		end
		7 : 
		begin
			digit2 <= 8'b11111000;
			if (bcd < 10) //To reset Change
				digit0 <= 8'b11000000;
		end
		8 : 
		begin
			digit2 <= 8'b10000000;
			if (bcd < 10) //To reset Change
				digit0 <= 8'b11000000;
		end
		9 : 
		begin
			digit2 <= 8'b10010000;
			if (bcd < 10) //To reset Change
				digit0 <= 8'b11000000;
		end		
		default : 
		begin
			digit2 <= 8'b11000000;
			digit0 <= 8'b11000000;
			if (bcd > 10) //Change
			begin
				case (bcd -10) //case statement
					1 : digit0 <= 8'b11111001;
					2 : digit0 <= 8'b10100100;
					3 : digit0 <= 8'b10110000;
					4 : digit0 <= 8'b10011001;
					default: digit0 <= 8'b11000000;
				endcase
			end
		end	
	endcase
end

//Refresh Counter
always @(posedge divided_clock)
begin
	refresh_counter <= refresh_counter+1; 
//	led_P7 = ~led_P7;
end

//test speed of clock
always @ (posedge divided_clock1)
	led_P7 = ~led_P7;
endmodule

/*
//Logic for Change
if (bcd > 9)
				seg  <= (bcd -10);
			else
//Logic for reset
15:
		begin
			an <= 4'b0000;
			digit2 <= 8'b11000000;
			led_M11 <= 1'b0;
			led_M5  <= 1'b0;
		end
		
*/
