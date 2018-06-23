`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// VGA verilog template
// Author:  Da Cheng
//////////////////////////////////////////////////////////////////////////////////
module vga_demo(ClkPort, vga_h_sync, vga_v_sync, vga_r, vga_g, vga_b, Sw0, Sw1, btnU, btnR, btnL,
	St_ce_bar, St_rp_bar, Mt_ce_bar, Mt_St_oe_bar, Mt_St_we_bar,
	An0, An1, An2, An3, Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp,
	LD0, LD1, LD2, LD3, LD4, LD5, LD6, LD7);
	input ClkPort, Sw0, btnU, btnR, btnL, Sw0, Sw1;
	output St_ce_bar, St_rp_bar, Mt_ce_bar, Mt_St_oe_bar, Mt_St_we_bar;
	output vga_h_sync, vga_v_sync, vga_r, vga_g, vga_b;
	output An0, An1, An2, An3, Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp;
	output LD0, LD1, LD2, LD3, LD4, LD5, LD6, LD7;
	reg vga_r, vga_g, vga_b;

	
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/*  LOCAL SIGNALS */
	wire	reset, start, ClkPort, board_clk, clk, button_clk;
	
	BUF BUF1 (board_clk, ClkPort); 	
	BUF BUF2 (reset, Sw0);
	BUF BUF3 (start, Sw1);
	
	reg [27:0]	DIV_CLK;
	always @ (posedge board_clk, posedge reset)  
	begin : CLOCK_DIVIDER
      if (reset)
			DIV_CLK <= 0;
      else
			DIV_CLK <= DIV_CLK + 1'b1;
	end	

	assign	button_clk = DIV_CLK[18];
	assign	clk = DIV_CLK[1];
	assign 	{St_ce_bar, St_rp_bar, Mt_ce_bar, Mt_St_oe_bar, Mt_St_we_bar} = {5'b11111};
	
	wire inDisplayArea;
	wire [9:0] CounterX;
	wire [9:0] CounterY;


	
	wire[9:0] alien1X, alien2X,alien3X,alien4X,alien5X;
	wire[9:0] alien6X, alien7X,alien8X,alien9X,alien10X;
	wire[9:0] alien11X, alien12X,alien13X,alien14X,alien15X;
	wire[9:0] topY, midY, botY;
	wire[3:0] score;
	 
	wire[9:0] projectileX, projectileY;
	 
	 
	 
	hvsync_generator syncgen(.clk(clk), .reset(reset),.vga_h_sync(vga_h_sync), .vga_v_sync(vga_v_sync), .inDisplayArea(inDisplayArea), .CounterX(CounterX), .CounterY(CounterY));
	/////////////////////////////////////////////////////////////////
	///////////////		VGA control starts here		/////////////////
	/////////////////////////////////////////////////////////////////
	wire [9:0] playerX;
	reg [9:0] playerY;
	wire[9:0] returnX, returnY;
	ee354_spinvaders_sm Invaders(.Clk(DIV_CLK[21]), .reset(reset), .L(btnL), .R(btnR), .shoot(btnU), .topY(topY), .midY(midY), .botY(botY), .position(playerX), .projectileX(projectileX), .projectileY(projectileY), .returnX(returnX), .returnY(returnY),
	.alien1X(alien1X), .alien2X(alien2X), .alien3X(alien3X),.alien4X(alien4X), .alien5X(alien5X), 
	.alien6X(alien6X), .alien7X(alien7X), .alien8X(alien8X), .alien9X(alien9X), .alien10X(alien10X), 
	.alien11X(alien11X), .alien12X(alien12X), .alien13X(alien13X), .alien14X(alien14X),.alien15X(alien15X), .score(score));
	
	
	wire R = (CounterX>=(alien1X-20) && CounterX<=(alien1X+20) && CounterY<=(topY+10) && CounterY>=(topY-10)) || 
		(CounterX>=(alien2X-20) && CounterX<=(alien2X+20) && CounterY<=(topY+10) && CounterY>=(topY-10)) || 
		(CounterX>=(alien3X-20) && CounterX<=(alien3X+20) && CounterY<=(topY+10) && CounterY>=(topY-10)) || 
		(CounterX>=(alien4X-20) && CounterX<=(alien4X+20) && CounterY<=(topY+10) && CounterY>=(topY-10)) || 
		(CounterX>=(alien5X-20) && CounterX<=(alien5X+20) && CounterY<=(topY+10) && CounterY>=(topY-10)) || 
		(CounterX>=(alien6X-20) && CounterX<=(alien6X+20) && CounterY<=(midY+10) && CounterY>=(midY-10)) || 
		(CounterX>=(alien7X-20) && CounterX<=(alien7X+20) && CounterY<=(midY+10) && CounterY>=(midY-10)) || 
		(CounterX>=(alien8X-20) && CounterX<=(alien8X+20) && CounterY<=(midY+10) && CounterY>=(midY-10)) || 
		(CounterX>=(alien9X-20) && CounterX<=(alien9X+20) && CounterY<=(midY+10) && CounterY>=(midY-10)) || 
		(CounterX>=(alien10X-20) && CounterX<=(alien10X+20) && CounterY<=(midY+10) && CounterY>=(midY-10)) || 
		(CounterX>=(alien11X-20) && CounterX<=(alien11X+20) && CounterY<=(botY+10) && CounterY>=(botY-10)) || 
		(CounterX>=(alien12X-20) && CounterX<=(alien12X+20) && CounterY<=(botY+10) && CounterY>=(botY-10)) ||
		(CounterX>=(alien13X-20) && CounterX<=(alien13X+20) && CounterY<=(botY+10) && CounterY>=(botY-10)) || 
		(CounterX>=(alien14X-20) && CounterX<=(alien14X+20) && CounterY<=(botY+10) && CounterY>=(botY-10)) || 
		(CounterX>=(alien15X-20) && CounterX<=(alien15X+20) && CounterY<=(botY+10) && CounterY>=(botY-10)); 
	wire G = CounterX>=(playerX-20) && CounterX<=(playerX+20) && CounterY<=(425+10) && CounterY>=(425-10);
	wire B = (CounterX>=(projectileX-2) && CounterX<=(projectileX+2) && CounterY<=(projectileY+5) && CounterY>=(projectileY-5)) ||
				(CounterX>=(returnX-2) && CounterX<=(returnX+2) && CounterY<=(returnY+5) && CounterY>=(returnY-5));
	
	always @(posedge clk)
	begin
		vga_r <= R & inDisplayArea;
		vga_g <= G & inDisplayArea;
		vga_b <= B & inDisplayArea;
	end
	
	/////////////////////////////////////////////////////////////////
	//////////////  	  VGA control ends here 	 ///////////////////
	/////////////////////////////////////////////////////////////////
	

	
	
	
	
	/////////////////////////////////////////////////////////////////
	//////////////  	  LD control starts here 	 ///////////////////
	/////////////////////////////////////////////////////////////////
	`define QI 			2'b00
	`define QGAME_1 	2'b01
	`define QGAME_2 	2'b10
	`define QDONE 		2'b11
	
	reg [3:0] p2_score;
	reg [3:0] p1_score;
	reg [1:0] state;
	wire LD0, LD1, LD2, LD3, LD4, LD5, LD6, LD7;
	
	assign LD0 = (p1_score == 4'b1010);
	assign LD1 = (p2_score == 4'b1010);
	
	assign LD2 = start;
	assign LD4 = reset;
	
	assign LD3 = (state == `QI);
	assign LD5 = (state == `QGAME_1);	
	assign LD6 = (state == `QGAME_2);
	assign LD7 = (state == `QDONE);
	
	/////////////////////////////////////////////////////////////////
	//////////////  	  LD control ends here 	 	////////////////////
	/////////////////////////////////////////////////////////////////
	
	/////////////////////////////////////////////////////////////////
	//////////////  	  SSD control starts here 	 ///////////////////
	/////////////////////////////////////////////////////////////////
	reg 	[3:0]	SSD;
	wire 	[3:0]	SSD0, SSD1, SSD2, SSD3;
	wire 	[1:0] ssdscan_clk;
	
	assign SSD3 = 4'b1111;
	assign SSD2 = 4'b1111;
	assign SSD1 = 4'B1111;
	assign SSD0 = score[3:0];
	
	// need a scan clk for the seven segment display 
	// 191Hz (50MHz / 2^18) works well
	assign ssdscan_clk = DIV_CLK[19:18];	
	assign An0	= !(~(ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 00
	assign An1	= !(~(ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 01
	assign An2	= !( (ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 10
	assign An3	= !( (ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 11
	
	always @ (ssdscan_clk, SSD0, SSD1, SSD2, SSD3)
	begin : SSD_SCAN_OUT
		case (ssdscan_clk) 
			2'b00:
					SSD = SSD0;
			2'b01:
					SSD = SSD1;
			2'b10:
					SSD = SSD2;
			2'b11:
					SSD = SSD3;
		endcase 
	end	

	// and finally convert SSD_num to ssd
	reg [6:0]  SSD_CATHODES;
	assign {Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp} = {SSD_CATHODES, 1'b1};
	// Following is Hex-to-SSD conversion
	always @ (SSD) 
	begin : HEX_TO_SSD
		case (SSD)		
			4'b1111: SSD_CATHODES = 7'b1111111 ; //Nothing 
			4'b0000: SSD_CATHODES = 7'b0000001 ; //0
			4'b0001: SSD_CATHODES = 7'b1001111 ; //1
			4'b0010: SSD_CATHODES = 7'b0010010 ; //2
			4'b0011: SSD_CATHODES = 7'b0000110 ; //3
			4'b0100: SSD_CATHODES = 7'b1001100 ; //4
			4'b0101: SSD_CATHODES = 7'b0100100 ; //5
			4'b0110: SSD_CATHODES = 7'b0100000 ; //6
			4'b0111: SSD_CATHODES = 7'b0001111 ; //7
			4'b1000: SSD_CATHODES = 7'b0000000 ; //8
			4'b1001: SSD_CATHODES = 7'b0000100 ; //9
			4'b1010: SSD_CATHODES = 7'b0001000 ; //10 or A
			4'b1011: SSD_CATHODES = 7'b1100000 ; //11 or B
			4'b1100: SSD_CATHODES = 7'b0110001 ; //12 or C
			4'b1101: SSD_CATHODES = 7'b1000010 ; //13 or D
			4'b1110: SSD_CATHODES = 7'b0110000 ; //14 or E
			4'b1111: SSD_CATHODES = 7'b0111000 ; //15 or F
			default: SSD_CATHODES = 7'bXXXXXXX ; // default is not needed as we covered all cases
		endcase
	end
	
	/////////////////////////////////////////////////////////////////
	//////////////  	  SSD control ends here 	 ///////////////////
	/////////////////////////////////////////////////////////////////
endmodule
