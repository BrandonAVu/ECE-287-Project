module player(VGA_clk, update, rst, xCount, yCount, alien, lost, win, person,left_button,right_button, shoot, bullets);
input VGA_clk, rst, update;
output person;
wire person;
input [9:0]xCount;
input [9:0]yCount;
wire [9:0] xCount;
wire [9:0] yCount;
input left_button,right_button,shoot;
output [31:0]bullets; 
output [31:0] alien;
output reg lost;
output reg win;


reg [9:0] playerX [0:31];
reg [8:0] playerY [0:31];

reg isShot;
reg bullet0;

assign bullets[0] = bullet0;

reg [9:0] bulletX0 [0:31];
reg [8:0] bulletY0 [0:31];

assign person = (person0 || person1 || person2 || person3);
reg person0, person1, person2, person3;

reg [1:0]S; 
reg [1:0]NS;

parameter	IDLE = 2'd0,
				LEFT = 2'd1,
				RIGHT = 2'd2,
				SHOOT = 2'd3;
				
				
always@(posedge VGA_clk) 
	begin	
		person0 = (xCount > (playerX[0] + 10'd11) && xCount < (playerX[0] + 10'd13)) && (yCount > playerY[0] && yCount < (playerY[0] + 9'd3));
		person1 = (xCount > (playerX[0] + 10'd8) && xCount < (playerX[0] + 10'd16)) && (yCount > (playerY[0] + 9'd2) && yCount < (playerY[0] + 9'd5));
		person2 = (xCount > (playerX[0] + 10'd3) && xCount < (playerX[0] + 10'd22)) && (yCount > (playerY[0] + 9'd4) && yCount < (playerY[0] + 9'd7));
		person3 = (xCount > playerX[0] && xCount < (playerX[0] + 10'd25)) && (yCount > (playerY[0] + 9'd6) && yCount < (playerY[0] + 9'd15));
		if(S == SHOOT)
			bullet0 <= (xCount > bulletX0[0] && xCount < (bulletX0[0] + 10'd3)) && (yCount > bulletY0[0] && yCount < (bulletY0[0] + 10'd18));
		else
			bullet0 <= (xCount > bulletX0[0] && xCount < (bulletX0[0] + 10'd1)) && (yCount > bulletY0[0] && yCount < (bulletY0[0] + 10'd1));
		
	end
	
always @(*) 
	case (S)
		IDLE: 
				begin
					if (left_button == 1'b0)
						NS = LEFT;
					else if (right_button == 1'b0)
						NS = RIGHT;
					else if (shoot == 1'b0)
						NS = SHOOT;
					else
						NS = IDLE;
				end
		LEFT:
				begin
					if(left_button == 1'b0)
						NS = LEFT;
					else
						NS = IDLE;
				end
		RIGHT:
				begin
					if(right_button == 1'b0)
						NS = RIGHT;
					else
						NS = IDLE;
				end
		SHOOT:
				begin
					if(shoot == 1'b0)
						NS = SHOOT;
					else
						NS = IDLE;
				end
		
		endcase
		

always @(posedge update)
	begin
		if (rst == 1'b0) 
			begin 
				playerX[0] <= 10'd325;
				playerY[0] <= 9'd440;
				bulletX0[0] <= playerX[0] + 10'd11;
				bulletY0[0] <= playerY[0] - 9'd3;
			end
		else
			case(S)
				IDLE:
					begin
					bulletX0[0] <= playerX[0] + 10'd11;
					bulletY0[0] <= playerY[0] - 9'd3;
					if(playerX[0] > 10'd616)
						playerX[0] <= (10'd10);
					else if(playerX[0] < 10'd10)
						playerX[0] <= (10'd616);
					else
						playerX[0] <= playerX[0];
						playerY[0] <= playerY[0];
					end
				LEFT:
					begin
					if(playerX[0] < 10'd10)
						playerX[0] <= (10'd616);
					else
						playerX[0] <= (playerX[0] - 10'd4);
					end
				RIGHT:
					begin
					if(playerX[0] > 10'd616)
						playerX[0] <= (10'd10);
					else
						playerX[0] <= (playerX[0] + 10'd4);
					end
				SHOOT:
					begin
						isShot <= 1'b1;
						bulletX0[0] <= playerX[0] + 10'd11;
						bulletY0[0] <= bulletY0[0] - 10'd50;
					end
						
				endcase
	end
always @(posedge update) 
begin
	if (rst == 1'b0)
		S <= IDLE;
	else
		S <= NS;
end










//                                 alien code







reg goLeft,goRight;
assign alien[0] = alien0;
assign alien[1] = alien1;
assign alien[2] = alien2;
assign alien[3] = alien3;
assign alien[4] = alien4;
assign alien[5] = alien5;
assign alien[6] = alien6;
assign alien[7] = alien7;
wire alien0;
wire alien1;
wire alien2;
wire alien3;
wire alien4;
wire alien5;
wire alien6;
wire alien7;


assign alien0 = (alien0a || alien0b || alien0c || alien0d || alien0e || alien0f || alien0g || alien0h);
reg alien0a,alien0b,alien0c,alien0d,alien0e,alien0f,alien0g,alien0h;

assign alien1 = (alien1a || alien1b || alien1c || alien1d || alien1e || alien1f || alien1g || alien1h);
reg alien1a,alien1b,alien1c,alien1d,alien1e,alien1f,alien1g,alien1h;

assign alien2 = (alien2a || alien2b || alien2c || alien2d || alien2e || alien2f || alien2g || alien2h);
reg alien2a,alien2b,alien2c,alien2d,alien2e,alien2f,alien2g,alien2h;

assign alien3 = (alien3a || alien3b || alien3c || alien3d || alien3e || alien3f || alien3g || alien3h);
reg alien3a,alien3b,alien3c,alien3d,alien3e,alien3f,alien3g,alien3h;

assign alien4 = (alien4a || alien4b || alien4c || alien4d || alien4e || alien4f || alien4g || alien4h);
reg alien4a,alien4b,alien4c,alien4d,alien4e,alien4f,alien4g,alien4h;

assign alien5 = (alien5a || alien5b || alien5c || alien5d || alien5e || alien5f || alien5g || alien5h);
reg alien5a,alien5b,alien5c,alien5d,alien5e,alien5f,alien5g,alien5h;

assign alien6 = (alien6a || alien6b || alien6c || alien6d || alien6e || alien6f || alien6g || alien6h);
reg alien6a,alien6b,alien6c,alien6d,alien6e,alien6f,alien6g,alien6h;

assign alien7 = (alien7a || alien7b || alien7c || alien7d || alien7e || alien7f || alien7g || alien7h);
reg alien7a,alien7b,alien7c,alien7d,alien7e,alien7f,alien7g,alien7h;

reg [9:0] alienX0 [0:31];
reg [8:0] alienY0 [0:31];
reg [9:0] alienX1 [0:31];
reg [8:0] alienY1 [0:31];
reg [9:0] alienX2 [0:31];
reg [8:0] alienY2 [0:31];
reg [9:0] alienX3 [0:31];
reg [8:0] alienY3 [0:31];
reg [9:0] alienX4 [0:31];
reg [8:0] alienY4 [0:31];
reg [9:0] alienX5 [0:31];
reg [8:0] alienY5 [0:31];
reg [9:0] alienX6 [0:31];
reg [8:0] alienY6 [0:31];
reg [9:0] alienX7 [0:31];
reg [8:0] alienY7 [0:31];


reg isDead0, isDead1, isDead2, isDead3, isDead4, isDead5, isDead6, isDead7;


always@(posedge VGA_clk) 
	begin	
		if (isDead0 == 1'b1 )
		begin
			alien0a =  ( (xCount > alienX0[0]) && (xCount < (alienX0[0] + 10'd1)) )  && (yCount > alienY0[0] && yCount < (alienY0[0] + 9'd1));
		end
		else
		begin
			alien0a = ( ( (xCount > (alienX0[0] + 10'd7)) && (xCount < (alienX0[0] + 10'd12)) ) || ( (xCount > (alienX0[0] + 10'd31)) && (xCount < (alienX0[0] + 10'd36)) ) ) && (yCount > alienY0[0] && yCount < (alienY0[0] + 9'd5));
			alien0b = ( ( (xCount > (alienX0[0] + 10'd11)) && (xCount < (alienX0[0] + 10'd16)) ) || ( (xCount > (alienX0[0] + 10'd27)) && (xCount < (alienX0[0] + 10'd32)) ) ) && (yCount > (alienY0[0] + 9'd4) && yCount < (alienY0[0] + 9'd9));
			alien0c = ( ( (xCount > (alienX0[0] + 10'd7)) && (xCount < (alienX0[0] + 10'd36)) ) ) && (yCount > (alienY0[0] + 9'd8) && yCount < (alienY0[0] + 9'd13));
			alien0d = ( ( (xCount > (alienX0[0] + 10'd3)) && (xCount < (alienX0[0] + 10'd12)) ) || ( (xCount > (alienX0[0] + 10'd15)) && (xCount < (alienX0[0] + 10'd28)) ) || ( (xCount > (alienX0[0] + 10'd31)) && (xCount < (alienX0[0] + 10'd40)) ) ) && (yCount > (alienY0[0] + 9'd12) && yCount < (alienY0[0] + 9'd17));
			alien0e = ( ( (xCount >= alienX0[0]) && (xCount < (alienX0[0] + 10'd44)) ) ) && (yCount > (alienY0[0] + 9'd16) && yCount < (alienY0[0] + 9'd21));
			alien0f = ( ( (xCount >= alienX0[0]) && (xCount < (alienX0[0] + 10'd4)) ) || ( (xCount > (alienX0[0] + 10'd7)) && (xCount < (alienX0[0] + 10'd36)) ) || ( (xCount > (alienX0[0] + 10'd39)) && (xCount < (alienX0[0] + 10'd44)) ) ) && (yCount > (alienY0[0] + 9'd20) && yCount < (alienY0[0] + 9'd25));
			alien0g = ( ( (xCount >= alienX0[0]) && (xCount < (alienX0[0] + 10'd4)) ) || ( (xCount > (alienX0[0] + 10'd7)) && (xCount < (alienX0[0] + 10'd12)) ) || ( (xCount > (alienX0[0] + 10'd31)) && (xCount < (alienX0[0] + 10'd36)) ) || ( (xCount > (alienX0[0] + 10'd39)) && (xCount < (alienX0[0] + 10'd44)) ) ) && (yCount > (alienY0[0] + 9'd24) && yCount < (alienY0[0] + 9'd29));
			alien0h = ( ( (xCount > (alienX0[0] + 10'd11)) && (xCount < (alienX0[0] + 10'd20)) ) || ( (xCount > (alienX0[0] + 10'd23)) && (xCount < (alienX0[0] + 10'd32)) ) ) && (yCount > (alienY0[0] + 9'd28) && yCount < (alienY0[0] + 9'd33));
		end
		if (isDead1 == 1'b1 )
		begin
			alien1a =  ( (xCount > alienX1[0]) && (xCount < (alienX1[0] + 10'd1)) )  && (yCount > alienY1[0] && yCount < (alienY1[0] + 9'd1));
		end
		else
		begin
			alien1a = ( ( (xCount > (alienX1[0] + 10'd7)) && (xCount < (alienX1[0] + 10'd12)) ) || ( (xCount > (alienX1[0] + 10'd31)) && (xCount < (alienX1[0] + 10'd36)) ) ) && (yCount > alienY1[0] && yCount < (alienY1[0] + 9'd5));
			alien1b = ( ( (xCount > (alienX1[0] + 10'd11)) && (xCount < (alienX1[0] + 10'd16)) ) || ( (xCount > (alienX1[0] + 10'd27)) && (xCount < (alienX1[0] + 10'd32)) ) ) && (yCount > (alienY1[0] + 9'd4) && yCount < (alienY1[0] + 9'd9));
			alien1c = ( ( (xCount > (alienX1[0] + 10'd7)) && (xCount < (alienX1[0] + 10'd36)) ) ) && (yCount > (alienY1[0] + 9'd8) && yCount < (alienY1[0] + 9'd13));
			alien1d = ( ( (xCount > (alienX1[0] + 10'd3)) && (xCount < (alienX1[0] + 10'd12)) ) || ( (xCount > (alienX1[0] + 10'd15)) && (xCount < (alienX1[0] + 10'd28)) ) || ( (xCount > (alienX1[0] + 10'd31)) && (xCount < (alienX1[0] + 10'd40)) ) ) && (yCount > (alienY1[0] + 9'd12) && yCount < (alienY1[0] + 9'd17));
			alien1e = ( ( (xCount >= alienX1[0]) && (xCount < (alienX1[0] + 10'd44)) ) ) && (yCount > (alienY1[0] + 9'd16) && yCount < (alienY1[0] + 9'd21));
			alien1f = ( ( (xCount >= alienX1[0]) && (xCount < (alienX1[0] + 10'd4)) ) || ( (xCount > (alienX1[0] + 10'd7)) && (xCount < (alienX1[0] + 10'd36)) ) || ( (xCount > (alienX1[0] + 10'd39)) && (xCount < (alienX1[0] + 10'd44)) ) ) && (yCount > (alienY1[0] + 9'd20) && yCount < (alienY1[0] + 9'd25));
			alien1g = ( ( (xCount >= alienX1[0]) && (xCount < (alienX1[0] + 10'd4)) ) || ( (xCount > (alienX1[0] + 10'd7)) && (xCount < (alienX1[0] + 10'd12)) ) || ( (xCount > (alienX1[0] + 10'd31)) && (xCount < (alienX1[0] + 10'd36)) ) || ( (xCount > (alienX1[0] + 10'd39)) && (xCount < (alienX1[0] + 10'd44)) ) ) && (yCount > (alienY1[0] + 9'd24) && yCount < (alienY1[0] + 9'd29));
			alien1h = ( ( (xCount > (alienX1[0] + 10'd11)) && (xCount < (alienX1[0] + 10'd20)) ) || ( (xCount > (alienX1[0] + 10'd23)) && (xCount < (alienX1[0] + 10'd32)) ) ) && (yCount > (alienY1[0] + 9'd28) && yCount < (alienY1[0] + 9'd33));
		end
		if (isDead2 == 1'b1 )
		begin
			alien2a =  ( (xCount > alienX2[0]) && (xCount < (alienX2[0] + 10'd1)) )  && (yCount > alienY2[0] && yCount < (alienY2[0] + 9'd1));
		end
		else
		begin
			alien2a = ( ( (xCount > (alienX2[0] + 10'd7)) && (xCount < (alienX2[0] + 10'd12)) ) || ( (xCount > (alienX2[0] + 10'd31)) && (xCount < (alienX2[0] + 10'd36)) ) ) && (yCount > alienY2[0] && yCount < (alienY2[0] + 9'd5));
			alien2b = ( ( (xCount > (alienX2[0] + 10'd11)) && (xCount < (alienX2[0] + 10'd16)) ) || ( (xCount > (alienX2[0] + 10'd27)) && (xCount < (alienX2[0] + 10'd32)) ) ) && (yCount > (alienY2[0] + 9'd4) && yCount < (alienY2[0] + 9'd9));
			alien2c = ( ( (xCount > (alienX2[0] + 10'd7)) && (xCount < (alienX2[0] + 10'd36)) ) ) && (yCount > (alienY2[0] + 9'd8) && yCount < (alienY2[0] + 9'd13));
			alien2d = ( ( (xCount > (alienX2[0] + 10'd3)) && (xCount < (alienX2[0] + 10'd12)) ) || ( (xCount > (alienX2[0] + 10'd15)) && (xCount < (alienX2[0] + 10'd28)) ) || ( (xCount > (alienX2[0] + 10'd31)) && (xCount < (alienX2[0] + 10'd40)) ) ) && (yCount > (alienY2[0] + 9'd12) && yCount < (alienY2[0] + 9'd17));
			alien2e = ( ( (xCount >= alienX2[0]) && (xCount < (alienX2[0] + 10'd44)) ) ) && (yCount > (alienY2[0] + 9'd16) && yCount < (alienY2[0] + 9'd21));
			alien2f = ( ( (xCount >= alienX2[0]) && (xCount < (alienX2[0] + 10'd4)) ) || ( (xCount > (alienX2[0] + 10'd7)) && (xCount < (alienX2[0] + 10'd36)) ) || ( (xCount > (alienX2[0] + 10'd39)) && (xCount < (alienX2[0] + 10'd44)) ) ) && (yCount > (alienY2[0] + 9'd20) && yCount < (alienY2[0] + 9'd25));
			alien2g = ( ( (xCount >= alienX2[0]) && (xCount < (alienX2[0] + 10'd4)) ) || ( (xCount > (alienX2[0] + 10'd7)) && (xCount < (alienX2[0] + 10'd12)) ) || ( (xCount > (alienX2[0] + 10'd31)) && (xCount < (alienX2[0] + 10'd36)) ) || ( (xCount > (alienX2[0] + 10'd39)) && (xCount < (alienX2[0] + 10'd44)) ) ) && (yCount > (alienY2[0] + 9'd24) && yCount < (alienY2[0] + 9'd29));
			alien2h = ( ( (xCount > (alienX2[0] + 10'd11)) && (xCount < (alienX2[0] + 10'd20)) ) || ( (xCount > (alienX2[0] + 10'd23)) && (xCount < (alienX2[0] + 10'd32)) ) ) && (yCount > (alienY2[0] + 9'd28) && yCount < (alienY2[0] + 9'd33));
		end
		if (isDead3 == 1'b1 )
		begin
			alien3a =  ( (xCount > alienX3[0]) && (xCount < (alienX3[0] + 10'd1)) )  && (yCount > alienY3[0] && yCount < (alienY3[0] + 9'd1));
		end
		else
		begin
			alien3a = ( ( (xCount > (alienX3[0] + 10'd7)) && (xCount < (alienX3[0] + 10'd12)) ) || ( (xCount > (alienX3[0] + 10'd31)) && (xCount < (alienX3[0] + 10'd36)) ) ) && (yCount > alienY3[0] && yCount < (alienY3[0] + 9'd5));
			alien3b = ( ( (xCount > (alienX3[0] + 10'd11)) && (xCount < (alienX3[0] + 10'd16)) ) || ( (xCount > (alienX3[0] + 10'd27)) && (xCount < (alienX3[0] + 10'd32)) ) ) && (yCount > (alienY3[0] + 9'd4) && yCount < (alienY3[0] + 9'd9));
			alien3c = ( ( (xCount > (alienX3[0] + 10'd7)) && (xCount < (alienX3[0] + 10'd36)) ) ) && (yCount > (alienY3[0] + 9'd8) && yCount < (alienY3[0] + 9'd13));
			alien3d = ( ( (xCount > (alienX3[0] + 10'd3)) && (xCount < (alienX3[0] + 10'd12)) ) || ( (xCount > (alienX3[0] + 10'd15)) && (xCount < (alienX3[0] + 10'd28)) ) || ( (xCount > (alienX3[0] + 10'd31)) && (xCount < (alienX3[0] + 10'd40)) ) ) && (yCount > (alienY3[0] + 9'd12) && yCount < (alienY3[0] + 9'd17));
			alien3e = ( ( (xCount >= alienX3[0]) && (xCount < (alienX3[0] + 10'd44)) ) ) && (yCount > (alienY3[0] + 9'd16) && yCount < (alienY3[0] + 9'd21));
			alien3f = ( ( (xCount >= alienX3[0]) && (xCount < (alienX3[0] + 10'd4)) ) || ( (xCount > (alienX3[0] + 10'd7)) && (xCount < (alienX3[0] + 10'd36)) ) || ( (xCount > (alienX3[0] + 10'd39)) && (xCount < (alienX3[0] + 10'd44)) ) ) && (yCount > (alienY3[0] + 9'd20) && yCount < (alienY3[0] + 9'd25));
			alien3g = ( ( (xCount >= alienX3[0]) && (xCount < (alienX3[0] + 10'd4)) ) || ( (xCount > (alienX3[0] + 10'd7)) && (xCount < (alienX3[0] + 10'd12)) ) || ( (xCount > (alienX3[0] + 10'd31)) && (xCount < (alienX3[0] + 10'd36)) ) || ( (xCount > (alienX3[0] + 10'd39)) && (xCount < (alienX3[0] + 10'd44)) ) ) && (yCount > (alienY3[0] + 9'd24) && yCount < (alienY3[0] + 9'd29));
			alien3h = ( ( (xCount > (alienX3[0] + 10'd11)) && (xCount < (alienX3[0] + 10'd20)) ) || ( (xCount > (alienX3[0] + 10'd23)) && (xCount < (alienX3[0] + 10'd32)) ) ) && (yCount > (alienY3[0] + 9'd28) && yCount < (alienY3[0] + 9'd33));
		end
		if (isDead4 == 1'b1 )
		begin
			alien4a =  ( (xCount > alienX4[0]) && (xCount < (alienX4[0] + 10'd1)) )  && (yCount > alienY4[0] && yCount < (alienY4[0] + 9'd1));
		end
		else
		begin
			alien4a = ( ( (xCount > (alienX4[0] + 10'd7)) && (xCount < (alienX4[0] + 10'd12)) ) || ( (xCount > (alienX4[0] + 10'd31)) && (xCount < (alienX4[0] + 10'd36)) ) ) && (yCount > alienY4[0] && yCount < (alienY4[0] + 9'd5));
			alien4b = ( ( (xCount > (alienX4[0] + 10'd11)) && (xCount < (alienX4[0] + 10'd16)) ) || ( (xCount > (alienX4[0] + 10'd27)) && (xCount < (alienX4[0] + 10'd32)) ) ) && (yCount > (alienY4[0] + 9'd4) && yCount < (alienY4[0] + 9'd9));
			alien4c = ( ( (xCount > (alienX4[0] + 10'd7)) && (xCount < (alienX4[0] + 10'd36)) ) ) && (yCount > (alienY4[0] + 9'd8) && yCount < (alienY4[0] + 9'd13));
			alien4d = ( ( (xCount > (alienX4[0] + 10'd3)) && (xCount < (alienX4[0] + 10'd12)) ) || ( (xCount > (alienX4[0] + 10'd15)) && (xCount < (alienX4[0] + 10'd28)) ) || ( (xCount > (alienX4[0] + 10'd31)) && (xCount < (alienX4[0] + 10'd40)) ) ) && (yCount > (alienY4[0] + 9'd12) && yCount < (alienY4[0] + 9'd17));
			alien4e = ( ( (xCount >= alienX4[0]) && (xCount < (alienX4[0] + 10'd44)) ) ) && (yCount > (alienY4[0] + 9'd16) && yCount < (alienY4[0] + 9'd21));
			alien4f = ( ( (xCount >= alienX4[0]) && (xCount < (alienX4[0] + 10'd4)) ) || ( (xCount > (alienX4[0] + 10'd7)) && (xCount < (alienX4[0] + 10'd36)) ) || ( (xCount > (alienX4[0] + 10'd39)) && (xCount < (alienX4[0] + 10'd44)) ) ) && (yCount > (alienY4[0] + 9'd20) && yCount < (alienY4[0] + 9'd25));
			alien4g = ( ( (xCount >= alienX4[0]) && (xCount < (alienX4[0] + 10'd4)) ) || ( (xCount > (alienX4[0] + 10'd7)) && (xCount < (alienX4[0] + 10'd12)) ) || ( (xCount > (alienX4[0] + 10'd31)) && (xCount < (alienX4[0] + 10'd36)) ) || ( (xCount > (alienX4[0] + 10'd39)) && (xCount < (alienX4[0] + 10'd44)) ) ) && (yCount > (alienY4[0] + 9'd24) && yCount < (alienY4[0] + 9'd29));
			alien4h = ( ( (xCount > (alienX4[0] + 10'd11)) && (xCount < (alienX4[0] + 10'd20)) ) || ( (xCount > (alienX4[0] + 10'd23)) && (xCount < (alienX4[0] + 10'd32)) ) ) && (yCount > (alienY4[0] + 9'd28) && yCount < (alienY4[0] + 9'd33));
		end
		if (isDead5 == 1'b1 )
		begin
			alien5a =  ( (xCount > alienX5[0]) && (xCount < (alienX5[0] + 10'd1)) )  && (yCount > alienY5[0] && yCount < (alienY5[0] + 9'd1));
		end
		else
		begin	
			alien5a = ( ( (xCount > (alienX5[0] + 10'd7)) && (xCount < (alienX5[0] + 10'd12)) ) || ( (xCount > (alienX5[0] + 10'd31)) && (xCount < (alienX5[0] + 10'd36)) ) ) && (yCount > alienY5[0] && yCount < (alienY5[0] + 9'd5));
			alien5b = ( ( (xCount > (alienX5[0] + 10'd11)) && (xCount < (alienX5[0] + 10'd16)) ) || ( (xCount > (alienX5[0] + 10'd27)) && (xCount < (alienX5[0] + 10'd32)) ) ) && (yCount > (alienY5[0] + 9'd4) && yCount < (alienY5[0] + 9'd9));
			alien5c = ( ( (xCount > (alienX5[0] + 10'd7)) && (xCount < (alienX5[0] + 10'd36)) ) ) && (yCount > (alienY5[0] + 9'd8) && yCount < (alienY5[0] + 9'd13));
			alien5d = ( ( (xCount > (alienX5[0] + 10'd3)) && (xCount < (alienX5[0] + 10'd12)) ) || ( (xCount > (alienX5[0] + 10'd15)) && (xCount < (alienX5[0] + 10'd28)) ) || ( (xCount > (alienX5[0] + 10'd31)) && (xCount < (alienX5[0] + 10'd40)) ) ) && (yCount > (alienY5[0] + 9'd12) && yCount < (alienY5[0] + 9'd17));
			alien5e = ( ( (xCount >= alienX5[0]) && (xCount < (alienX5[0] + 10'd44)) ) ) && (yCount > (alienY5[0] + 9'd16) && yCount < (alienY5[0] + 9'd21));
			alien5f = ( ( (xCount >= alienX5[0]) && (xCount < (alienX5[0] + 10'd4)) ) || ( (xCount > (alienX5[0] + 10'd7)) && (xCount < (alienX5[0] + 10'd36)) ) || ( (xCount > (alienX5[0] + 10'd39)) && (xCount < (alienX5[0] + 10'd44)) ) ) && (yCount > (alienY5[0] + 9'd20) && yCount < (alienY5[0] + 9'd25));
			alien5g = ( ( (xCount >= alienX5[0]) && (xCount < (alienX5[0] + 10'd4)) ) || ( (xCount > (alienX5[0] + 10'd7)) && (xCount < (alienX5[0] + 10'd12)) ) || ( (xCount > (alienX5[0] + 10'd31)) && (xCount < (alienX5[0] + 10'd36)) ) || ( (xCount > (alienX5[0] + 10'd39)) && (xCount < (alienX5[0] + 10'd44)) ) ) && (yCount > (alienY5[0] + 9'd24) && yCount < (alienY5[0] + 9'd29));
			alien5h = ( ( (xCount > (alienX5[0] + 10'd11)) && (xCount < (alienX5[0] + 10'd20)) ) || ( (xCount > (alienX5[0] + 10'd23)) && (xCount < (alienX5[0] + 10'd32)) ) ) && (yCount > (alienY5[0] + 9'd28) && yCount < (alienY5[0] + 9'd33));
		end
		if (isDead6 == 1'b1 )
		begin
			alien6a =  ( (xCount > alienX6[0]) && (xCount < (alienX6[0] + 10'd1)) )  && (yCount > alienY6[0] && yCount < (alienY6[0] + 9'd1));
		end
		else
		begin
			alien6a = ( ( (xCount > (alienX6[0] + 10'd7)) && (xCount < (alienX6[0] + 10'd12)) ) || ( (xCount > (alienX6[0] + 10'd31)) && (xCount < (alienX6[0] + 10'd36)) ) ) && (yCount > alienY6[0] && yCount < (alienY6[0] + 9'd5));
			alien6b = ( ( (xCount > (alienX6[0] + 10'd11)) && (xCount < (alienX6[0] + 10'd16)) ) || ( (xCount > (alienX6[0] + 10'd27)) && (xCount < (alienX6[0] + 10'd32)) ) ) && (yCount > (alienY6[0] + 9'd4) && yCount < (alienY6[0] + 9'd9));
			alien6c = ( ( (xCount > (alienX6[0] + 10'd7)) && (xCount < (alienX6[0] + 10'd36)) ) ) && (yCount > (alienY6[0] + 9'd8) && yCount < (alienY6[0] + 9'd13));
			alien6d = ( ( (xCount > (alienX6[0] + 10'd3)) && (xCount < (alienX6[0] + 10'd12)) ) || ( (xCount > (alienX6[0] + 10'd15)) && (xCount < (alienX6[0] + 10'd28)) ) || ( (xCount > (alienX6[0] + 10'd31)) && (xCount < (alienX6[0] + 10'd40)) ) ) && (yCount > (alienY6[0] + 9'd12) && yCount < (alienY6[0] + 9'd17));
			alien6e = ( ( (xCount >= alienX6[0]) && (xCount < (alienX6[0] + 10'd44)) ) ) && (yCount > (alienY6[0] + 9'd16) && yCount < (alienY6[0] + 9'd21));
			alien6f = ( ( (xCount >= alienX6[0]) && (xCount < (alienX6[0] + 10'd4)) ) || ( (xCount > (alienX6[0] + 10'd7)) && (xCount < (alienX6[0] + 10'd36)) ) || ( (xCount > (alienX6[0] + 10'd39)) && (xCount < (alienX6[0] + 10'd44)) ) ) && (yCount > (alienY6[0] + 9'd20) && yCount < (alienY6[0] + 9'd25));
			alien6g = ( ( (xCount >= alienX6[0]) && (xCount < (alienX6[0] + 10'd4)) ) || ( (xCount > (alienX6[0] + 10'd7)) && (xCount < (alienX6[0] + 10'd12)) ) || ( (xCount > (alienX6[0] + 10'd31)) && (xCount < (alienX6[0] + 10'd36)) ) || ( (xCount > (alienX6[0] + 10'd39)) && (xCount < (alienX6[0] + 10'd44)) ) ) && (yCount > (alienY6[0] + 9'd24) && yCount < (alienY6[0] + 9'd29));
			alien6h = ( ( (xCount > (alienX6[0] + 10'd11)) && (xCount < (alienX6[0] + 10'd20)) ) || ( (xCount > (alienX6[0] + 10'd23)) && (xCount < (alienX6[0] + 10'd32)) ) ) && (yCount > (alienY6[0] + 9'd28) && yCount < (alienY6[0] + 9'd33));
		
		end
		if (isDead7 == 1'b1 )
		begin
			alien7a =  ( (xCount > alienX7[0]) && (xCount < (alienX7[0] + 10'd1)) )  && (yCount > alienY7[0] && yCount < (alienY7[0] + 9'd1));
		end
		else
		begin
			alien7a = ( ( (xCount > (alienX7[0] + 10'd7)) && (xCount < (alienX7[0] + 10'd12)) ) || ( (xCount > (alienX7[0] + 10'd31)) && (xCount < (alienX7[0] + 10'd36)) ) ) && (yCount > alienY7[0] && yCount < (alienY7[0] + 9'd5));
			alien7b = ( ( (xCount > (alienX7[0] + 10'd11)) && (xCount < (alienX7[0] + 10'd16)) ) || ( (xCount > (alienX7[0] + 10'd27)) && (xCount < (alienX7[0] + 10'd32)) ) ) && (yCount > (alienY7[0] + 9'd4) && yCount < (alienY7[0] + 9'd9));
			alien7c = ( ( (xCount > (alienX7[0] + 10'd7)) && (xCount < (alienX7[0] + 10'd36)) ) ) && (yCount > (alienY7[0] + 9'd8) && yCount < (alienY7[0] + 9'd13));
			alien7d = ( ( (xCount > (alienX7[0] + 10'd3)) && (xCount < (alienX7[0] + 10'd12)) ) || ( (xCount > (alienX7[0] + 10'd15)) && (xCount < (alienX7[0] + 10'd28)) ) || ( (xCount > (alienX7[0] + 10'd31)) && (xCount < (alienX7[0] + 10'd40)) ) ) && (yCount > (alienY7[0] + 9'd12) && yCount < (alienY7[0] + 9'd17));
			alien7e = ( ( (xCount >= alienX7[0]) && (xCount < (alienX7[0] + 10'd44)) ) ) && (yCount > (alienY7[0] + 9'd16) && yCount < (alienY7[0] + 9'd21));
			alien7f = ( ( (xCount >= alienX7[0]) && (xCount < (alienX7[0] + 10'd4)) ) || ( (xCount > (alienX7[0] + 10'd7)) && (xCount < (alienX7[0] + 10'd36)) ) || ( (xCount > (alienX7[0] + 10'd39)) && (xCount < (alienX7[0] + 10'd44)) ) ) && (yCount > (alienY7[0] + 9'd20) && yCount < (alienY7[0] + 9'd25));
			alien7g = ( ( (xCount >= alienX7[0]) && (xCount < (alienX7[0] + 10'd4)) ) || ( (xCount > (alienX7[0] + 10'd7)) && (xCount < (alienX7[0] + 10'd12)) ) || ( (xCount > (alienX7[0] + 10'd31)) && (xCount < (alienX7[0] + 10'd36)) ) || ( (xCount > (alienX7[0] + 10'd39)) && (xCount < (alienX7[0] + 10'd44)) ) ) && (yCount > (alienY7[0] + 9'd24) && yCount < (alienY7[0] + 9'd29));
			alien7h = ( ( (xCount > (alienX7[0] + 10'd11)) && (xCount < (alienX7[0] + 10'd20)) ) || ( (xCount > (alienX7[0] + 10'd23)) && (xCount < (alienX7[0] + 10'd32)) ) ) && (yCount > (alienY7[0] + 9'd28) && yCount < (alienY7[0] + 9'd33));
		end
	end
	
always @ (posedge update)
	begin
		//collision check
		if (((bulletX0[0] > alienX0[0]) && (bulletX0[0] < (alienX0[0] + 10'd44))) && ((bulletY0[0] > alienY0[0]) && (bulletY0[0] < (alienY0[0] + 9'd33))))
		begin
			isDead0 <= 1'b1;
		end
		if (((bulletX0[0] > alienX1[0]) && (bulletX0[0] < (alienX1[0] + 10'd44))) && ((bulletY0[0] > alienY1[0]) && (bulletY0[0] < (alienY1[0] + 9'd33))))
		begin
			isDead1 <= 1'b1;
		end
		if (((bulletX0[0] > alienX2[0]) && (bulletX0[0] < (alienX2[0] + 10'd44))) && ((bulletY0[0] > alienY2[0]) && (bulletY0[0] < (alienY2[0] + 9'd33))))
		begin
			isDead2 <= 1'b1;
		end
		if (((bulletX0[0] > alienX3[0]) && (bulletX0[0] < (alienX3[0] + 10'd44))) && ((bulletY0[0] > alienY3[0]) && (bulletY0[0] < (alienY3[0] + 9'd33))))
		begin
			isDead3 <= 1'b1;
		end
		if (((bulletX0[0] > alienX4[0]) && (bulletX0[0] < (alienX4[0] + 10'd44))) && ((bulletY0[0] > alienY4[0]) && (bulletY0[0] < (alienY4[0] + 9'd33))))
		begin
			isDead4 <= 1'b1;
		end
		if (((bulletX0[0] > alienX5[0]) && (bulletX0[0] < (alienX5[0] + 10'd44))) && ((bulletY0[0] > alienY5[0]) && (bulletY0[0] < (alienY5[0] + 9'd33))))
		begin
			isDead5 <= 1'b1;
		end
		if (((bulletX0[0] > alienX6[0]) && (bulletX0[0] < (alienX6[0] + 10'd44))) && ((bulletY0[0] > alienY6[0]) && (bulletY0[0] < (alienY6[0] + 9'd33))))
		begin
			isDead6 <= 1'b1;
		end
		if (((bulletX0[0] > alienX7[0]) && (bulletX0[0] < (alienX7[0] + 10'd44))) && ((bulletY0[0] > alienY7[0]) && (bulletY0[0] < (alienY7[0] + 9'd33))))
		begin
			isDead7 <= 1'b1;
		end
		if((isDead0 == 1'b1) && (isDead1 == 1'b1) && (isDead2 == 1'b1) && (isDead3 == 1'b1) && (isDead4 == 1'b1) && (isDead5 == 1'b1) && (isDead6 == 1'b1) && (isDead7 == 1'b1))
			win<=1'b1;
		if (rst == 1'b0) 
			begin
				alienX0[0] <= 10'd50;
				alienY0[0] <= 9'd30;
				alienX1[0] <= 10'd175;
				alienY1[0] <= 9'd30;
				alienX2[0] <= 10'd300;
				alienY2[0] <= 9'd30;
				alienX3[0] <= 10'd425;
				alienY3[0] <= 9'd30;
				alienX4[0] <= 10'd50;
				alienY4[0] <= 9'd90;
				alienX5[0] <= 10'd175;
				alienY5[0] <= 9'd90;
				alienX6[0] <= 10'd300;
				alienY6[0] <= 9'd90;
				alienX7[0] <= 10'd425;
				alienY7[0] <= 9'd90;
				lost <=1'b0;
				goLeft <= 1'b0;
				win<=1'b0;
				isDead0 <= 1'b0;
				isDead1 <= 1'b0;
				isDead2 <= 1'b0;
				isDead3 <= 1'b0;
				isDead4 <= 1'b0;
				isDead5 <= 1'b0;
				isDead6 <= 1'b0;
				isDead7 <= 1'b0;
			end 
			
		else if (alienX0[0] <= 10'd10 || alienX1[0] <= 10'd10 || alienX2[0] <= 10'd10 || alienX3[0] <= 10'd10	|| alienX4[0] <= 10'd10 || alienX5[0] <= 10'd10 || alienX6[0] <= 10'd10 || alienX7[0] <= 10'd10)
		begin
			goLeft <= 1'b0;
			alienY0[0] <= alienY0[0] + 9'd10;
			alienY1[0] <= alienY1[0] + 9'd10;
			alienY2[0] <= alienY2[0] + 9'd10;
			alienY3[0] <= alienY3[0] + 9'd10;
			alienY4[0] <= alienY4[0] + 9'd10;
			alienY5[0] <= alienY5[0] + 9'd10;
			alienY6[0] <= alienY6[0] + 9'd10;
			alienY7[0] <= alienY7[0] + 9'd10;

			
			alienX0[0] <= alienX0[0] + 10'd20;		
			alienX1[0] <= alienX1[0] + 10'd20;
			alienX2[0] <= alienX2[0] + 10'd20;
			alienX3[0] <= alienX3[0] + 10'd20;
			alienX4[0] <= alienX4[0] + 10'd20;
			alienX5[0] <= alienX5[0] + 10'd20;
			alienX6[0] <= alienX6[0] + 10'd20;
			alienX7[0] <= alienX7[0] + 10'd20;

		end
		else if (alienX7[0] >= 10'd615-10'd30 || alienX6[0] >= 10'd615-10'd30 || alienX5[0] >= 10'd615-10'd30 || alienX4[0] >= 10'd615-10'd30 || alienX3[0] >= 10'd615-10'd30 || alienX2[0] >= 10'd615-10'd30 || alienX1[0] >= 10'd615-10'd30 || alienX0[0] >= 10'd615-10'd30)
		begin
			goLeft <= 1'b1;
			alienY0[0] <= alienY0[0] + 9'd10;
			alienY1[0] <= alienY1[0] + 9'd10;
			alienY2[0] <= alienY2[0] + 9'd10;
			alienY3[0] <= alienY3[0] + 9'd10;
			alienY4[0] <= alienY4[0] + 9'd10;
			alienY5[0] <= alienY5[0] + 9'd10;
			alienY6[0] <= alienY6[0] + 9'd10;
			alienY7[0] <= alienY7[0] + 9'd10;
			
			
			alienX0[0] <= alienX0[0] - 10'd5;
				
			alienX1[0] <= alienX1[0] - 10'd5;
		
			alienX2[0] <= alienX2[0] - 10'd5;
			
			alienX3[0] <= alienX3[0] - 10'd5;
			alienX4[0] <= alienX4[0] - 10'd5;
			alienX5[0] <= alienX5[0] - 10'd5;
			alienX6[0] <= alienX6[0] - 10'd5;
			alienX7[0] <= alienX7[0] - 10'd5;


		end
		else if (goLeft)
			begin
				alienX0[0] <= alienX0[0] - 10'd4;
				
				alienX1[0] <= alienX1[0] - 10'd4;
		
				alienX2[0] <= alienX2[0] - 10'd4;
				
				alienX3[0] <= alienX3[0] - 10'd4;
				
				alienX4[0] <= alienX4[0] - 10'd4;
				
				alienX5[0] <= alienX5[0] - 10'd4;
				
				alienX6[0] <= alienX6[0] - 10'd4;
				
				alienX7[0] <= alienX7[0] - 10'd4;


			end
		else if (alienY7[0] >= 10'd400 || alienY6[0] >= 10'd400 || alienY5[0] >= 10'd400 || alienY4[0] >= 10'd400 || alienY3[0] >= 10'd400 || alienY2[0] >= 10'd400 || alienY1[0] >= 10'd400 || alienY0[0] >= 10'd400)
			lost <= 1'b1;
		else
			begin
				alienX0[0] <= alienX0[0] + 10'd4;
				
				alienX1[0] <= alienX1[0] + 10'd4;
		
				alienX2[0] <= alienX2[0] + 10'd4;
				
				alienX3[0] <= alienX3[0] + 10'd4;
				
				alienX4[0] <= alienX4[0] + 10'd4;

				alienX5[0] <= alienX5[0] + 10'd4;
				
				alienX6[0] <= alienX6[0] + 10'd4;
				
				alienX7[0] <= alienX7[0] + 10'd4;
				
			end
		end
	
endmodule
