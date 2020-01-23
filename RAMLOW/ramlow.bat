SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin 

rem echo off

cd codemaps
rem	del objects.o
cd ..

cls

cd supportcode
	copy "engine.h" "..\"
cd ..


echo on

rem zcc +zx -v -c -clib=new --fsigned-char -o objects @ram0.lst

rem zcc +zx -v -m -zorg=24450 -startup=31 -clib=new objects.o  -o compiled -pragma-include:zpragma.inc

zcc +zx -v -m -startup=31 -clib=new ramALL.o -o compiled -pragma-include:zpragma.inc @ramlow.lst




echo off

rem move "objects.o"  "codemaps\"

rem move "compiled_CODE.bin"  "codemaps\"
rem move "compiled_BANK_00.bin" "codemaps\"

rem del zcc_opt.def
rem del zcc_proj.lst

rem del engine.h


cd codemaps
	echo on
	@REM all these objects match up
	rem z80nm objects.o
	echo off
cd ..

