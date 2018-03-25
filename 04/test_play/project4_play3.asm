//Rectangel drawing pseudo code

//0.Write C style
//	for (i=0; i<n; i++){
//		draw 16 black pixels at begin of row i
//	}

//1.Write psudo code
//	addr = SCREEN
//	n = RAM[0}
//	i = 0
//LOOP:
//	if i > n goto END
//	RAM[addr] = -1 // 1111 1111 1111 1111
//  advance to next row
//  addr = addr + 32
//	i = i + 1
//	goto LOOP
//END: 
//	goto END

//2.Translate
	
	@SCREEN
	D=A
	@addr
	M=D		//addr = 16384 (SCREEN)
	
	@0
	D=M
	@n
	M=D		// n = RAM[0]
	
	@i
	M=0		// i = 0
	
(LOOP)
	@i 
	D=M
	@n 
	D=D-M
	@END
	D;JGT	//if i>n goto END
	
	@addr
	A=M
	M=-1	//RAM[addr}= 11111111..
	
	@i 
	M=M+1	// i=i+1
	@32
	D=A
	@addr
	M=D+M	//addr = addr + 32
	@LOOP
	0;JMP	//goto LOOP
	
(END)
	@END
	0;JMP