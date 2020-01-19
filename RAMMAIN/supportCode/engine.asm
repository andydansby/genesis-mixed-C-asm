; This is the main file for the scrolling engine
; It will just set the assembler origin, and include the files


;org 33025
include "drawmap.asm"
include "rambanks.asm"
include "drawsprite.asm"
include "input.asm"
include "create_shifted_tables.asm"
include "im2.asm"




defc		SPRITE_START = $9000	;36864
; we have 4k for sprites, $9000 - $9FFF

defc 		MAP_START	= $A000		;40960
; 4k for the game map, $a000 - $afff

defc		TablaTiles	= $B000		;45056

;SPRITE_START EQU $9000		; we have 4k for sprites, $9000 - $9FFF
;MAP_START    EQU $A000		; 4k for the game map, $a000 - $afff
;TablaTiles   EQU $B000

