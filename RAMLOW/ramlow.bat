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
	copy "depack.asm" "..\"
cd ..



echo on

@rem zcc +zx -v -c -clib=new ram0.o --fsigned-char -o objects @ramlow.lst

REM was working with
zcc +zx -v -c -clib=new --fsigned-char -o objects @ramlow.lst


echo off

@rem zcc +zx -v -m -zorg=24450 -startup=31 -clib=new ramALL.o  -o compiled -pragma-include:zpragma.inc
rem this line compiles all files
@rem zcc +zx -v -m -startup=31 -clib=new ramALL.o -o compiled -pragma-include:zpragma.inc @ramlow.lst

@rem TROUBLESHOOTING COMPILE
@rem zcc +zx -v -c -clib=new --fsigned-char -no-cleanup objects @ramlow.lst

copy "objects.o" "ramlow.o"
move "ramlow.o" "..\"
move "objects.o" "codemaps\"

del zcc_opt.def
del zcc_proj.lst

del "engine.h"
del "variables.h"
del "constants.h"
del "structs.h"
del "externs.h"
del "depack.asm"


cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	z80nm objects.o > ramlow.txt
	copy "ramlow.txt" "..\"
	echo off
cd ..



