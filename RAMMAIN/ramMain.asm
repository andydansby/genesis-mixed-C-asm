;;uncontended memory from 32768 to 49151
SECTION UNCONTENDED
org 0x8000;;32768 to 49151 below BANK switch and above contended

;;INCLUDEs are at the bottom

;;place our tables and variables at the top

;;257dec = 101h
;;starts #8000-#8100
PUBLIC _IM2table
;#BEGIN_ASM
_IM2table:
	defs 257
	;defs	257		
	; 257 byte table for the Interupt Manager
;#END_ASM

;;#8101
;;this was the problem of my compiling woes
;;was 	defb _isrdummy <----
PUBLIC _isrdummy
_isrdummy:
	defb 1

;;#8102
PUBLIC _ISR_space
_ISR_space:
	defs 27
	
PUBLIC _current_screen
_current_screen:
	defb 0


;; RESOLVED
;;ATTENTION HARD CODED ADDRESSES

;; Definitions for sprite cache addresses
;; sprite cache table, 1K	
;;SprCacheTable 	EQU $8C00
;;defc	SprCacheTable 	= $8C00
;;used in drawsprite.asm
PUBLIC SprCacheTable
SprCacheTable:
	defs 1024
	
PUBLIC LRU_next
;; cache list next pointers
;; 43 bytes used 
;; (some bytes wasted!)
;;LRU_next	EQU $8B00
;;defc	LRU_next      	= $8B00
;;used in drawsprite.asm
LRU_next:
	defs 43
	
PUBLIC LRU_prev
;; cache list prev pointers, 
;; 43 bytes used 
;; (some bytes wasted!)
;;LRU_prev	EQU $8A00
;;defc	LRU_prev      	= $8A00
LRU_prev:
	defs 43

PUBLIC LRU_first
LRU_first:
	defb 0

PUBLIC LRU_last
LRU_last:
	defb 41	
;; pointers to the first and last entry in the cache

PUBLIC LRU_LASTENTRY
defc LRU_LASTENTRY = 42

;;unknown 0x2A = 42
;; LRU_LASTENTRY   EQU 42
;; defc 	LRU_LASTENTRY   = 42
;;ERROR AT 193

PUBLIC movetop_prev
movetop_prev:
	defb 0

PUBLIC movetop_next
movetop_next:
	defb 0

PUBLIC SCRADD
SCRADD:
	defw 0

PUBLIC LINECOUNT
LINECOUNT:
	defb 0

PUBLIC SAVE_RAMBANK
SAVE_RAMBANK:
	defb 0

;PUBLIC SPRITES_BANK
;; SPRITES_BANK	EQU 1
;;defc	SPRITES_BANK	= 1
;SPRITES_BANK:
;	defb 1
defc	SPRITES_BANK	= 1

PUBLIC Multiply_by_96
Multiply_by_96:
  defw 0,96,192,288,384,480,576,672,768,864,960,1056,1152,1248,1344,1440,1536,1632,1728,1824,1920,2016,2112,2208,2304,2400,2496,2592,2688,2784,2880,2976,3072,3168,3264,3360,3456,3552,3648,3744,3840,3936


PUBLIC _MAP_START
MAP_START:
defs 4096

;;;--------------------------------

INCLUDE "drawmap.asm"
INCLUDE "drawsprite.asm"

INCLUDE "input.asm"
INCLUDE "engine.asm"
INCLUDE "rambanks.asm"
INCLUDE "displayloop.asm"
INCLUDE "clearMapArea.asm"
INCLUDE "drawGameMap.asm"
INCLUDE "levelutils.asm"


INCLUDE "create_shifted_tables.asm"


;;ATTENTION
;defc MOVE_NONE		= 0	;MOVE_NONE EQU 0
;defc MOVE_LEFT		= 1	;MOVE_LEFT EQU 1
;defc MOVE_RIGHT 	= 2	;MOVE_RIGHT EQU 2
;defc MOVE_PINGPONG	= 3	;MOVE_PINGPONG EQU 3
;defc MOVE_EXPLOSION	= 4	;MOVE_EXPLOSION EQU 4


;PUBLIC _interupt
;_interupt:





SECTION CODE_END
;;this section places the code close to the end, but not the very end.
;;47 bytes from the end in this iteration
PUBLIC _RAM_marker_MAIN
_RAM_marker_MAIN:
	halt
	halt
	halt
	halt
	nop
	halt
ret