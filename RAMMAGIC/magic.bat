


rem combine all object files

z80asm --output=ramALL.o uncontended.o ram0.o ram1.o ram3.o ram4.o ram6.o
 

z80nm ramALL.o > output.txt
	@rem output.txt will have the listing of routines