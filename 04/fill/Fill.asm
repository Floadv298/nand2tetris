// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


//1)Pseudo code
//loop
//Keyboard is not 0
//jmp blackfill
//else
//jump whitefill
//
//blackfill
//black01
//set screen value 8192 (starting from 16384)
//set black 
//- screen vale = 0? if yes jump loop, if no jump black01
//
//whitefill
//see blackfill just 0 instead of -1

// Put your code here.
	@2			//initialize to 0 and use later as comparison
	M=0
(LOOP)
	@KBD		//load Keyboard content
	D=M
	@2			
	D=D-M		//compare to 0 (no key pressed)
	@WHITEFILL
	D;JEQ		//if 0-0 = 0 go to whitefill
	@BLACKFILL
	0,JMP		//otherwise go blackfill

(WHITEFILL)

	@8191	//maybe +1 if 1 line missing
	D=A
	@R1
	M=D			//save total range at R1 

	@SCREEN 
	D=A
	@8191
	D=D+A		//load last screen address
	@R0
	M=D			//save screen adress to R0

(WHITE01)	
	//set screen to black
	//set screen address -1
	//check if screen adress - screen is greater 0 if yes, jump blck01
	@R0
	A=M 	//save screen adress from R0 to A
	M=0	//manipulate screen directly
	@R0
	D=M
	MD=D-1	//-1 on screen address
	@R1
	D=M
	MD=D-1
	@WHITE01
	D;JGE	//loop if still bigger equal 0
	@LOOP
	0;JMP	//otherise go back	
	
(BLACKFILL)

	@8191	//maybe +1 if 1 line missing
	D=A
	@R1
	M=D			//save total range at R1 

	@SCREEN 
	D=A
	@8191
	D=D+A		//load last screen address
	@R0
	M=D			//save screen adress to R0

(BLACK01)	
	//set screen to black
	//set screen address -1
	//check if screen adress - screen is greater 0 if yes, jump blck01
	@R0
	A=M 	//save screen adress from R0 to A
	M=-1	//manipulate screen directly
	@R0 
	D=M
	MD=D-1	//-1 on screen address
	@R1
	D=M
	MD=D-1
	@BLACK01
	D;JGE	//loop if still bigger equal 0
	@LOOP
	0;JMP	//otherise go back