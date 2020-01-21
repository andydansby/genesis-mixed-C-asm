SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin 

cd codemaps
	del objects.o
cd ..

cls

echo off
cd supportCode
	copy "create_shifted_tables.asm" "..\"
	copy "drawmap.asm" "..\"
	copy "drawsprite.asm" "..\"
	copy "engine.asm" "..\"
	copy "im2.asm" "..\"
	copy "input.asm" "..\"
	copy "rambanks.asm" "..\"
	
	copy "engine.h" "..\"
	copy "structs.h" "..\"
	copy "movement.h" "..\"
	copy "constants.h" "..\"
	copy "variables.h" "..\"
	copy "utils.h" "..\"
	copy "playercontrols.h" "..\"
	copy "wyzplayer.h" "..\"
	copy "levelutils.h" "..\"
	
	copy "graphicutils.h" "..\"
	copy "collision.h" "..\"
	copy "displayloop.h" "..\"
	
	copy "mainmenu.h" "..\"
	
	
rem some of these might do better in low ram
cd ..
echo on

zcc +zx -v -c -clib=new --fsigned-char -o objects @ramMain.lst

echo off
copy "objects.o" "uncontended.o"
move "uncontended.o" "..\"
move "objects.o" "codemaps\"

rem move "compiled_CODE.bin"  "codemaps\"
rem move "compiled_BANK_00.bin" "codemaps\"

rem del zcc_opt.def
rem del zcc_proj.lst




del "create_shifted_tables.asm"
del "drawmap.asm"
del "drawsprite.asm"
del "engine.asm"
del "im2.asm"
del "input.asm"
del "rambanks.asm"
del "engine.h"
del "structs.h"
del "movement.h"
del "constants.h"
del "variables.h"
del "utils.h"
del "playercontrols.h"
del "wyzplayer.h"
del "levelutils.h"
del "graphicutils.h"
del "collision.h"
del "displayloop.h"

del "mainmenu.h"

cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	echo off
cd ..

