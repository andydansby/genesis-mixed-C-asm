rem zcc +zx -vn -a -clib=new filename.?

SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin 

echo off

cd codemaps
	del objects.o
cd ..

rem cls

cd supportcode
 	copy "engine.h" "..\"
 	copy "variables.h" "..\"
 	copy "constants.h" "..\"
 	copy "structs.h" "..\"
 	copy "externs.h" "..\"
cd ..
echo on




rem zcc +zx -v -c -clib=new --fsigned-char -no-cleanup objects @ramlow.lst

zcc +zx -vn -a -clib=new --fsigned-char -no-cleanup ramlow.c @ramlow.lst






cd codemaps
	echo on
	@REM all these objects match up
rem	z80nm objects.o
rem	z80nm objects.o > ramlow.txt
rem	copy "ramlow.txt" "..\"
rem 	echo off
cd ..