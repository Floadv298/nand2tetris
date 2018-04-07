// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
//1)Pseudo Code
//  set R2, R4 to 0
//  R0=0 >end
//  R1=0 >end
//again
//  R4=R0+R0
//  R1-1
//  R1=0 >end 
//  jmp again 
//end 

//2)Real code 
//initalize values

	@R0		//check if R0 = 0 and if yes jump to end
	D=M
	@0
	D=D-A
	@END
	D;JEQ
	
	@R1		//check if R1 = 0 and if yes jump to end
	D=M
	@0
	D=D-A
	@END
	D;JEQ

	@R2		//set R0 to 0
	M=0	
	
(LOOP)
	@R0		//load R0
	D=M 
	@R2
	M=D+M	//save R2=R2+R0
	@R1
	D=M-1	//R1-1
	@END
	D;JLE	//if 0 jump end
	@R1
	M=D 	//not 0, store R1=R1-1
	@LOOP
	0;JMP	//jump to again
	
(END)			//defined ending loop
	@END		//load address of END into A
	0;JMP		//set 0 then jump to A
	