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

##sub bus of an internal node may not be used 
Section A.5.3 specifies how to handle buses and sub-buses.  
The convention in this HDL is that you can connect to arbitrary sub-buses of chips that you use (even with overlap), 
but that "pins" can not be sub-bused.   

Example: suppose that you have a chip "C" with a 16-bit output bus that you want to connect to a 16-bit pin called sum, 
but also to use the 7th bit to connect to a 1-bit pin called f, then you simply write: 

C(... , out=sum, out[7]=f);

One thing: If you have an input sinal you can use it like this:
Or8Way(in=in[0..7], out=x); 

But if you have an internal bus you can not:
Or8Way(in=sum[0..7], out=x); // DISALLOWED 

-->Workaround 
something (... out[0..7]=sum);
Or8Way(in=sum,..)



