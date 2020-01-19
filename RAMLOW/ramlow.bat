SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin 

cd codemaps
rem	del objects.o
cd ..

cls




rem zcc +zx -v -c -clib=new --fsigned-char -o objects @ram0.lst



rem move "objects.o"  "codemaps\"

rem move "compiled_CODE.bin"  "codemaps\"
rem move "compiled_BANK_00.bin" "codemaps\"

rem del zcc_opt.def
rem del zcc_proj.lst




cd codemaps
	echo on
	@REM all these objects match up
	rem z80nm objects.o
	echo off
cd ..

