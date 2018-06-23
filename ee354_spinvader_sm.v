
`timescale 1ns / 1ps

module ee354_spinvaders_sm(Clk, reset, L, R, shoot, topY, midY, botY, position, projectileX, projectileY, returnX, returnY,
	alien1X, alien2X,alien3X,alien4X,alien5X,alien6X,alien7X,alien8X,alien9X,alien10X,alien11X,alien12X,alien13X,alien14X,alien15X, score //,
		//An3, An2, An1, An0,			       // 4 anodes
		//Ca, Cb, Cc, Cd, Ce, Cf, Cg,        // 7 cathodes
		);
    input Clk, reset;
	 input L, R;
	 input shoot;
	 output[9:0] topY, midY, botY;
	 output[3:0] score;
	 output reg[9:0] position;
	 output reg[9:0] alien1X, alien2X,alien3X,alien4X,alien5X;
	 output reg[9:0] alien6X, alien7X,alien8X,alien9X,alien10X;
	 output reg[9:0] alien11X, alien12X,alien13X,alien14X,alien15X;
	 reg[9:0] topY, midY, botY, base;
	 reg[3:0] score;
	 reg[3:0] direction;
	 wire gameOver;
	 output reg[9:0] returnX, returnY;
	 reg[3:0] alienSel;
	 // SSD Outputs
	/*output 	Cg, Cf, Ce, Cd, Cc, Cb, Ca, Dp;
	output 	An0, An1, An2, An3;	
	
	
	reg [3:0]	SSD;
	     [3:0]	SSD3, SSD2, SSD1, SSD0; // ****** TODO  in Part 2 ******  reg or wire?
	     [7:0]  SSD_CATHODES; // ****** TODO  in Part 2 ******  reg or wire?
		  */
	 output reg[9:0] projectileX, projectileY;
    initial
	 begin
		
	end
	
	assign gameOver = (score == 15) || (botY > 410) || ( returnY > 415 && returnY < 435 && returnX > position-10 && returnX < position+10);
    always @(posedge Clk) //Movement of the ship
		begin
			if(reset || gameOver)
			begin
				position <= 300;
				//fire <= 0;
			end
			else if(R && ~L)
				position <= position+5;
			else if(L && ~R)
				position <= position-5;

			
		end
	
	always @(posedge Clk) //return fire tracking
	begin
	
		if(reset)
		begin
			alienSel <= 1;
			returnX <= 0;
			returnY <= 0;
		end
		else if( returnY >= 480 )
		begin
			case(alienSel)
			4'd0: alienSel <= alienSel + 6;
			4'd1: 
			if(alien1X == 950) alienSel <=alienSel + 6;
			else
			begin
				returnX <= alien1X;
				returnY <= topY;
			end
			4'd2: 
			if(alien2X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien2X;
				returnY <= topY;
			end
			4'd3: 
			if(alien3X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien3X;
				returnY <= topY;
			end
			4'd4: 
			if(alien4X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien4X;
				returnY <= topY;
			end
			4'd5: 
			if(alien5X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien5X;
				returnY <= topY;
			end
			4'd6: 
			if(alien6X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien6X;
				returnY <= midY;
			end
			4'd7: 
			if(alien7X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien7X;
				returnY <= midY;
			end
			4'd8: 
			if(alien8X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien8X;
				returnY <= midY;
			end
			4'd9: 
			if(alien9X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien9X;
				returnY <= midY;
			end
			4'd10: 
			if(alien10X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien10X;
				returnY <= midY;
			end
			4'd11: 
			if(alien11X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien11X;
				returnY <= botY;
			end
			4'd12: 
			if(alien12X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien12X;
				returnY <= botY;
			end
			4'd13: 
			if(alien13X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien13X;
				returnY <= botY;
			end
			4'd14: 
			if(alien14X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien14X;
				returnY <= botY;
			end
			4'd15: 
			if(alien15X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien15X;
				returnY <= botY;
			end
			endcase
		end
		else
		begin
			returnY <= returnY + 10;
		end
	end
	
	 always @ (posedge Clk) //Projectile tracking
	 begin
		if(direction)
		begin
			if(base > 25)
			begin
				direction <= 0;
				topY <= topY + 7;
				midY <= midY + 7;
				botY <= botY + 7;
			end
			else
			begin
				alien1X <= alien1X + 2; 		
				alien2X <= alien2X + 2;
				alien3X <= alien3X + 2;
				alien4X <= alien4X + 2;
				alien5X <= alien5X + 2;
		
				alien6X <= alien6X + 2;
				alien7X <= alien7X + 2;
				alien8X <= alien8X + 2;
				alien9X <= alien9X + 2;
				alien10X <= alien10X + 2;
		
				alien11X <= alien11X + 2;
				alien12X <= alien12X + 2;
				alien13X <= alien13X + 2;
				alien14X <= alien14X + 2;
				alien15X <= alien15X + 2;
				
				base <= base + 1;
			end
		end
		else
		begin
		if(base == 0)
		begin
				direction <=1;
				
				topY <= topY + 7;
				midY <= midY + 7;
				botY <= botY + 7;
		end
			else
			begin
				base <= base-1;
				alien1X <= alien1X - 2; 		
				alien2X <= alien2X - 2;
				alien3X <= alien3X - 2;
				alien4X <= alien4X - 2;
				alien5X <= alien5X - 2;
		
				alien6X <= alien6X - 2;
				alien7X <= alien7X - 2;
				alien8X <= alien8X - 2;
				alien9X <= alien9X - 2;
				alien10X <= alien10X - 2;
		
				alien11X <= alien11X - 2;
				alien12X <= alien12X - 2;
				alien13X <= alien13X - 2;
				alien14X <= alien14X - 2;
				alien15X <= alien15X - 2;
			end
		end
		if(reset || gameOver)
		begin
			direction <= 1;
			base <= 0;
			projectileX <= 10'd900;
			projectileY <= 0;
			alien1X <= 10'd75; 		
			alien2X <= 10'd175;
			alien3X <= 10'd275;
			alien4X <= 10'd375;
			alien5X <= 10'd475;
		
			alien6X <= 10'd150;
			alien7X <= 10'd250;
			alien8X <= 10'd350;
			alien9X <= 10'd450;
			alien10X <= 10'd550;
		
			alien11X <= 10'd75;
			alien12X <= 10'd175;
			alien13X <= 10'd275;
			alien14X <= 10'd375;
			alien15X <= 10'd475;

			topY <= 10'd50;
			midY <= 10'd100;
			botY <= 10'd150;
			
			score <= 0;
		end
		
		 else if(projectileX == 10'd900 ) //No projectile 
		 begin
			if(shoot) //If shoot command is active. create the new projectile 
			begin
				projectileX <= position;
				projectileY <= 400;
			end
		 end
		 else if(projectileY == 0) //If projectile hits top of screen, delete the projectile
		 begin
			projectileX <= 10'd900;  
			projectileY <= 10;
		 end
		 else if( projectileY <= topY +10 && projectileY >= topY-10) //Y range of top row
		 begin 
			if(projectileX <= alien1X+20 && projectileX >=alien1X-20)
			begin
				projectileX <= 10'd900;
				projectileY <=10;
				alien1X <= 10'd950;
				score <= score + 1;
			end
			else if(projectileX <= alien2X+20 && projectileX >=alien2X-20)
			begin
				projectileX <= 10'd900;
				projectileY <= 10;
				alien2X <= 10'd950;
				score <= score + 1;
			end
			else if(projectileX <= alien3X+20 && projectileX >=alien3X-20)
			begin
				projectileX <= 10'd900;
				projectileY <= 10;
				alien3X <= 10'd950;
				score <= score + 1;
			end
			else if(projectileX <= alien4X+20 && projectileX >=alien4X-20)
			begin
				projectileX <= 10'd900;
				projectileY <= 10;
				alien4X <= 10'd950;
				score <= score + 1;
			end
			else if(projectileX <= alien5X+20 && projectileX >=alien5X-20)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien5X <= 10'd950;
				score <= score + 1;
			end
			else
				projectileY <= projectileY - 10;
		 end
		 else if( projectileY <= midY +10 && projectileY >= midY-10) //Middle row
		 begin
			if(projectileX <= alien6X+20 && projectileX >=alien6X-20)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien6X <= 10'd950;
				score <= score + 1;
			end
			else if(projectileX <= alien7X+20 && projectileX >=alien7X-20) 
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien7X <= 10'd950;
				score <= score + 1;
			end
			else if(projectileX <= alien8X+20 && projectileX >=alien8X-20)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien8X <= 10'd950;
				score <= score + 1;
			end
			else if(projectileX <= alien9X+20 && projectileX >=alien9X-20)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien9X <= 10'd950;
				score <= score + 1;
			end
			else if(projectileX <= alien10X+20 && projectileX >=alien10X-20)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien10X <= 10'd950;
				score <= score + 1;
			end
			else
				projectileY <= projectileY - 10;
		 end
		 else if( projectileY <= botY +10 && projectileY >= botY-10) //Bottom Row
		 begin
			if(projectileX <= alien11X+20 && projectileX >=alien11X-20)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien11X <= 10'd950;
				score <= score + 1;
			end
			else if(projectileX <= alien12X+20 && projectileX >=alien12X-20)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien12X <= 10'd950;
				score <= score + 1;
			end
			else if(projectileX <= alien13X+20 && projectileX >=alien13X-20)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien13X <= 10'd950;
				score <= score + 1;
			end
			else if(projectileX <= alien14X+20 && projectileX >=alien14X-20)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien14X <= 10'd950;
				score <= score + 1;
			end
			else if(projectileX <= alien15X+20 && projectileX >=alien15X-20)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien15X <= 10'd950;
				score <= score + 1;
			end
			else
				projectileY <= projectileY - 10;
		 end
		 else //move projectile up the screen if projectile hasn't hit any aliens or top of screen.
		 begin
			projectileY <= projectileY - 10; 
		 end
	 end
endmodule 