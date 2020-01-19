;;uncontended memory from 32768 to 49151
SECTION UNCONTENDED
org 0x8000;;32768 to 49151 below BANK switch and above contended

;PUBLIC _level1
;_level1:
;	BINARY "level1.map"
INCLUDE "engine.asm"



;;ATTENTION
;defc MOVE_NONE		= 0	;MOVE_NONE EQU 0
;defc MOVE_LEFT		= 1	;MOVE_LEFT EQU 1
;defc MOVE_RIGHT 	= 2	;MOVE_RIGHT EQU 2
;defc MOVE_PINGPONG	= 3	;MOVE_PINGPONG EQU 3
;defc MOVE_EXPLOSION	= 4	;MOVE_EXPLOSION EQU 4



