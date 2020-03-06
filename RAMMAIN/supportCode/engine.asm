; This is the main file for the scrolling engine
; It will just set the assembler origin, and include the files


;org 33025


;;include "im2.asm"//moved to ramlow



;;ATTENTION - ALL HARD CODED ADDRESSES
defc		SPRITE_START = $9000	;36864
; we have 4k for sprites, $9000 - $9FFF

;defc 		MAP_START	= $A000		;40960
; 4k for the game map, $a000 - $afff
;;4095
;PUBLIC _MAP_START
;_MAP_START:
;defs 4096

defc		TablaTiles	= $B000		;45056

;SPRITE_START EQU $9000		; we have 4k for sprites, $9000 - $9FFF
;MAP_START    EQU $A000		; 4k for the game map, $a000 - $afff
;TablaTiles   EQU $B000

