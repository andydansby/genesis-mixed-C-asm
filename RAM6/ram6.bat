SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin

cd codemaps
	del objects.o
cd ..

cls
echo on

cd images
	apack c genesis_title.scr genesis_title.bin
	apack c title_hiscores.scr title_hiscores.bin
	apack c credits_bkg.scr credits_bkg.bin

	copy "genesis_title.bin" "..\"
	copy "title_hiscores.bin" "..\"
	copy "credits_bkg.bin" "..\"
cd ..

cd asm
	copy "menu.asm" "..\"
	copy "move.asm" "..\"
	copy "behav.asm" "..\"
	copy "maindefs.asm" "..\"
cd ..


zcc +zx -v -c -clib=new --fsigned-char -o objects @ram6.lst

echo off
rem cleanup

copy "objects.o" "ram6.o"
move "ram6.o" "..\"
move "objects.o" "codemaps\"

del zcc_opt.def
del zcc_proj.lst

del genesis_title.bin
del title_hiscores.bin
del credits_bkg.bin

del "menu.asm"
del "move.asm"
del "behav.asm"
del "maindefs.asm"
	
	

cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	echo off
cd ..

