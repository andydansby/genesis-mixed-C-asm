;;bank 4 above 49152
SECTION BANK_04
org 0xc000;;believe this is assumed with target ZX

PUBLIC _level1
_level1:
	BINARY "level1.map"

PUBLIC _enemies1
_enemies1:
; the enemy structure has just one byte detailing the number of enemies
; and the locations in struct Enemy format

	defb  13          ; 13 enemies (for example)
	defb  5,  0, 20, 2, MOVE_PINGPONG, 10, 0, 4
; First enemy, tile X 5, Y 4, sprite 2, move ping-pong, energy=10, param1=0, param2 (speed) 4

	defb  5,  0, 50, 2, MOVE_PINGPONG, 10, 0, 4
	defb  5,  0, 80, 2, MOVE_PINGPONG, 10, 0, 4
	defb  19, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  19, 8, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  19, 8, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  25, 0, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  25, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  30, 0, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  32, 0, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  38, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  40, 0, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  255, 23, 80, 2, MOVE_LEFT, 10, 4, 0
; dummy enemy, to mark the end!



PUBLIC _level2
_level2:
	BINARY "level2.map"

PUBLIC _enemies2
_enemies2:	
; the enemy structure has just one byte detailing the number of enemies
; and the locations in struct Enemy format

	defb  13          ; 13 enemies (for example)
	defb  5,  0, 20, 2, MOVE_PINGPONG, 10, 0, 4
; First enemy, tile X 5, Y 4, sprite 2, move ping-pong, energy=10, param1=0, param2 (speed) 4
	defb  5,  0, 50, 2, MOVE_PINGPONG, 10, 0, 4
	defb  5,  0, 80, 2, MOVE_PINGPONG, 10, 0, 4
	defb  19, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  19, 8, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  19, 8, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  25, 0, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  25, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  30, 0, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  32, 0, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  38, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  40, 0, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  255, 23, 80, 2, MOVE_LEFT, 10, 4, 0
; dummy enemy, to mark the end!



PUBLIC _level3
_level3:
	BINARY "level3.map"

PUBLIC _enemies3
_enemies3:
; the enemy structure has just one byte detailing the number of enemies
; and the locations in struct Enemy format

	defb  13          ; 13 enemies (for example)
	defb  5,  0, 20, 2, MOVE_PINGPONG, 10, 0, 4
; First enemy, tile X 5, Y 4, sprite 2, move ping-pong, energy=10, param1=0, param2 (speed) 4
	defb  5,  0, 50, 2, MOVE_PINGPONG, 10, 0, 4
	defb  5,  0, 80, 2, MOVE_PINGPONG, 10, 0, 4
	defb  19, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  19, 8, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  19, 8, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  25, 0, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  25, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  30, 0, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  32, 0, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  38, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  40, 0, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  255, 23, 80, 2, MOVE_LEFT, 10, 4, 0
; dummy enemy, to mark the end!

PUBLIC _level4
_level4:
PUBLIC _enemies4
_enemies4:

PUBLIC _level5
_level5:
PUBLIC _enemies5
_enemies5:

PUBLIC _level6
_level6:
PUBLIC _enemies6
_enemies6:

PUBLIC _level7
_level7:
PUBLIC _enemies7
_enemies7:




defc MOVE_NONE		= 0	;MOVE_NONE EQU 0
defc MOVE_LEFT		= 1	;MOVE_LEFT EQU 1
defc MOVE_RIGHT 	= 2	;MOVE_RIGHT EQU 2
defc MOVE_PINGPONG	= 3	;MOVE_PINGPONG EQU 3
defc MOVE_EXPLOSION	= 4	;MOVE_EXPLOSION EQU 4



