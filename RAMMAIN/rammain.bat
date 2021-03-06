SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin 

cd codemaps
	del objects.o
cd ..

rem cls

echo off
cd supportCode
	copy "create_shifted_tables.asm" "..\"
	copy "drawmap.asm" "..\"
	copy "drawsprite.asm" "..\"
	copy "engine.asm" "..\"
rem	copy "im2.asm" "..\"
	copy "input.asm" "..\"
	copy "rambanks.asm" "..\"
	copy "displayloop.asm" "..\"
	copy "clearMapArea.asm" "..\"
	copy "drawGameMap.asm" "..\"
	copy "levelutils.asm" "..\"
	
	copy "engine.h" "..\"
	copy "structs.h" "..\"
	copy "movement.h" "..\"
	copy "constants.h" "..\"
	copy "variables.h" "..\"
	copy "utils.h" "..\"
	copy "playercontrols.h" "..\"
	copy "wyzplayer.h" "..\"
	copy "levelutils.h" "..\"
	copy "externs.h" "..\"
	
	copy "graphicutils.h" "..\"
	copy "collision.h" "..\"
	copy "displayloop.h" "..\"
	
	copy "mainmenu.h" "..\"
	
	
rem some of these might do better in low ram
cd ..


echo on



rem this creates an object file
REM not used for anything other than creating a map
zcc +zx -v -c -clib=new --fsigned-char -o objects @ramMain.lst




rem troubleshooting compile
REM zcc +zx -vn -m -startup=31 -clib=new -S -no-cleanup -z80-verb ramALL.o -o compiled -pragma-include:zpragma.inc @ramMain.lst

rem zcc +zx -vn -m -startup=31 -a -clib=new -no-cleanup ramALL.o -o compiled -pragma-include:zpragma.inc @ramMain.lst

rem zcc +zx -vn -m -startup=31 -clib=new -no-cleanup --c-code-in-asm ramALL.o -o compiled -pragma-include:zpragma.inc @ramMain.lst

rem zcc +z80 -vn -a -O3 -clib=new test.c --c-code-in-asm


rem in C:\Users\Andy\AppData\Local\Temp\

REM GOTO bye

rem zcc +zx -vn -m -startup=31 -clib=new -o compiled -pragma-include:zpragma.inc @ramMain.lst

rem normal compile
zcc +zx -vn -m -startup=31 -clib=new ramALL.o -o compiled -pragma-include:zpragma.inc @ramMain.lst

rem ABOVE creates
rem compiled_BANK_00.bin
rem compiled_BANK_01.bin
rem compiled_BANK_03.bin
rem compiled_BANK_04.bin
rem compiled_BANK_06.bin
rem compiled_CODE.bin
rem compiled_UNCONTENDED.bin

rem troubleshooting compile
rem zcc +zx -v -m -startup=31 -clib=new -no-cleanup ramALL.o -o compiled -pragma-include:zpragma.inc @ramMain.lst







@REM if exist "objects.o" (
@rem file exists
@rem ) else (
@REM GOTO bye
@REM )

IF NOT EXIST "objects.o" (
GOTO error
)



IF NOT EXIST "compiled.map" (
GOTO error
)


echo on

copy "objects.o" "uncontended.o"
move "uncontended.o" "..\"
move "objects.o" "codemaps\"
copy "compiled.map" "..\"
REM will finish move in all.bat
move "compiled.map" "codemaps\"


rem move "compiled_CODE.bin"  "codemaps\"
rem move "compiled_BANK_00.bin" "codemaps\"

rem del zcc_opt.def
rem del zcc_proj.lst




rem move "compiled_CONTENDED.bin" "BIN\"






cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	z80nm objects.o > output.txt
@REM	echo off
cd ..



REM START ERROR CHECKING
if not exist "compiled_BANK_00.bin" (
GOTO error
)

if not exist "compiled_BANK_01.bin" (
GOTO error
)

if not exist "compiled_BANK_03.bin" (
GOTO error
)

if not exist "compiled_BANK_04.bin" (
GOTO error
)

if not exist "compiled_BANK_06.bin" (
GOTO error
)

if not exist "compiled_CODE.bin" (
GOTO error
)

if not exist "compiled_CONTENDED.bin" (
GOTO error
)

REM END ERROR CHECKING



echo on

copy "compiled_BANK_00.bin" "BIN\"
copy "compiled_BANK_01.bin" "BIN\"
copy "compiled_BANK_03.bin" "BIN\"
copy "compiled_BANK_04.bin" "BIN\"
copy "compiled_BANK_06.bin" "BIN\"
copy "compiled_CODE.bin" "BIN\"
copy "compiled_CONTENDED.bin" "BIN\"

move "compiled_BANK_00.bin" "..\RAMMAGIC\"
move "compiled_BANK_01.bin" "..\RAMMAGIC\"
move "compiled_BANK_03.bin" "..\RAMMAGIC\"
move "compiled_BANK_04.bin" "..\RAMMAGIC\"
move "compiled_BANK_06.bin" "..\RAMMAGIC\"
move "compiled_CODE.bin" 	"..\RAMMAGIC\"
move "compiled_CONTENDED.bin" "..\RAMMAGIC\"


:bye
echo off
del "create_shifted_tables.asm"
del "drawmap.asm"
del "drawsprite.asm"
del "engine.asm"
rem del "im2.asm"
del "input.asm"
del "rambanks.asm"
del "displayloop.asm"
del "clearMapArea.asm"
del "drawGameMap.asm"
del "levelutils.asm"

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
del "externs.h"
del "mainmenu.h"

rem exit batch file but not close CMD prompt
exit /b


:error
REM Beep when error
@call beep.bat
echo off
del "create_shifted_tables.asm"
del "drawmap.asm"
del "drawsprite.asm"
del "engine.asm"
rem del "im2.asm"
del "input.asm"
del "rambanks.asm"
del "displayloop.asm"
del "clearMapArea.asm"
del "drawGameMap.asm"
del "levelutils.asm"

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
del "externs.h"
del "mainmenu.h"


call beep.bat
call beep.bat
ECHO ON
REM ERROR