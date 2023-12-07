module SpaceInvaders(FPGA_clk, rst, VGA_R, VGA_G, VGA_B, hsync, vsync, VGA_clk, blank_n, left_button, right_button,shoot);

input FPGA_clk, rst; 
input  left_button, right_button,shoot;  //direction inputs (buttons) 
output hsync, vsync, VGA_clk, blank_n; //non-color outputs to VGA (including the vga clock "FGA_clk", which is the main clock used in this project)

///clocks
clks_converter clocks(FPGA_clk, update, VGA_clk); //converts the board clock to VGA clock and frame update clock
wire VGA_clk; 
wire update; 

player play(VGA_clk,update,rst,xCount,yCount, alien, lost, win, person,left_button,right_button,shoot,bullets);
wire person;
wire [31:0]bullets;
wire [31:0]alien;
wire lost;
wire win;
//display control
wire [9:0] xCount; 
wire [9:0] yCount;
wire ScreenSize;

VGA_Controller VGA(VGA_clk, xCount, yCount, ScreenSize, hsync, vsync, blank_n);

output reg [7:0]VGA_R, VGA_G, VGA_B;

reg R;
reg G;
reg B;

reg border;

wire game_over_text;
wire win_text;


text words(VGA_clk, rst, xCount, yCount, game_over_text, win_text);

always @(posedge VGA_clk) 
	begin
		border <= (((xCount >= 0) && (xCount < 10) || (xCount >= 631) && (xCount < 641)) || ((yCount >= 0) && (yCount < 10) || (yCount >= 471) && (yCount < 481)));
	end
	
always @(posedge VGA_clk)
	begin
		if(lost == 1'b1)
			begin
				R = ScreenSize & !game_over_text;
				G = 1'b0;
				B = 1'b0;
			end
		else if (win == 1'b1)
			begin
				R = 1'b0;
				G = ScreenSize & !win_text;
				B = 1'b0;
			end
		else
			begin
				R = border || alien[0] || alien[1] || alien[2] || alien[3] || alien[4] || alien[5] || alien[6] || alien[7];
				G = border || person || bullets[0];
				B = ScreenSize && border;
			end

	end



always @ (posedge VGA_clk)
	begin
		VGA_R = {8{R}};
		VGA_G = {8{G}};
		VGA_B = {8{B}};
	end 


endmodule 
