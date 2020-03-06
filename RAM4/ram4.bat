SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin 

echo off

cd codemaps
	del objects.o
cd ..

cd game_maps
	copy "level1.map" "..\"
	copy "level2.map" "..\"
	copy "level3.map" "..\"
cd ..

echo on

zcc +zx -v -c -clib=new --fsigned-char -o objects @ram4.lst

echo off
rem cleanup

copy "objects.o" "ram4.o"
move "ram4.o" "..\"
move "objects.o" "codemaps\"

del zcc_opt.def
del zcc_proj.lst


del "level1.map"
del "level2.map"
del "level3.map"
	

cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	z80nm objects.o > ram4.txt
	copy "ram4.txt" "..\"
	echo off
cd ..
