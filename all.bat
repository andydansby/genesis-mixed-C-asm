SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin

cls

cd RAMLOADER
	call loader.bat
cd ..

cd RAM0
	call ram0.bat
	echo on
	REM RAM 0 WYZ FILES
cd ..

rem pause

cd RAM1
	call ram1.bat
	echo on
	REM RAM 1 NOTHING YET
cd ..

rem pause

cd RAM3
	call ram3.bat
	echo on
	REM RAM 1 GRAPHICS
cd ..

rem pause

cd RAM4
	call ram4.bat
	echo on
	REM RAM 4 LEVELS and ENEMIES
cd ..

rem pause

cd RAM6	
	call ram6.bat
	echo on
	REM RAM 6 GRAPHICS
cd ..

rem pause

cd RAMLOW
	call ramlow.bat
	echo on
	REM CONTENDED MEMORY 24600-32767
cd ..

rem pause

cd RAMMAIN
	call main.bat
	echo on
	REM UNCONTENDED MEMORY 32768-49151
cd ..

move "*.o" "RAMMAGIC\"
move "loader.tap" "RAMMAGIC\"