# Hardware Simulator findings
how to use it

##don't use underlines
don't use underlines when connecting 

##use true and false
true set it to high, false set it to low
you can use 
b[0]=true --> that will 00..001b (depending on the Bus you apply
b=true    --> that will 11..111b (dependign on the bus you apply

##Multiple inputs
	/* THIS IS WRONG:
    *  Mux16 (a[16]=a[16], b[16]=b[16], sel=sel[0], out[16]=c1[16]);
    *  Mux16 (a[16]=c[16], b[16]=d[16], sel=sel[0], out[16]=c2[16]);
    *  Mux16 (a[16]=c1[16], b[16]=c2[16], sel=sel[1], out[16]=out[16]);	
	*/
	
	//Lesson
	//Write like this!
	//Only in the header you need to say if it is a bus.
	//if you use it normal in the script no need to say.
	Mux16 (a=a, b=b, sel=sel[0], out=c1);
    Mux16 (a=c, b=d, sel=sel[0], out=c2);
    Mux16 (a=c1, b=c2, sel=sel[1], out=out);

##Chip not found
this can be e.g. a comment you forget to mark clearly or a chip *somewhere* in your code which does not exist or has a spelling problem


