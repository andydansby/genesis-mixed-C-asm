;;display loop

extern _current_screen
extern _setrambank0

section code_user

PUBLIC _display_loop
;#BEGIN_ASM
;;can be in CONTENDED
_display_loop:

;;from #9117 to 913c
waitvblank:
;;#9117
;;halt;;for testing
	ld a,r
	jp m, waitvblank
;; while the screen has not been switched, we cannot continue
		
	di	
	;; ATTENTION, does not draw map correctly
	call _DrawGameMap
	;; draw map, interrupts must be disabled
	;;need to work on
		
	ld b, 0
	call _setrambank0	;call setrambank
	
	;;ATTENTION causes crash	
	;; we have missed one interrupt for sure, so call player
	;;	call _INICIO ;//call WYZ_PLAY
	;;need to work on WYZ player

	ld a, (_current_screen);wth
	xor 2			
	;; 5 xor 2 = 7; 7 xor 2 = 5

	ld b, a
	call _setrambank0	;call setrambank
	;; restore the previous paging state

	ei

	;;ATTENTION causes hang
;	call _DrawSpriteList	; draw sprites
	;;need to work on
	
	

	ld a,r
	or $80
	ld r,a
	;; set the highest bit of R to 1, so switch screen!!!!

	di
	ld b, 0
	call _setrambank0	;call setrambank
	;; leave the RAM bank 0 in place before continuing

	ei
	;;	halt			; esperamos el retrazo
	;;	call switchscreen	; y mostramos la nueva pantalla!
	
ret
	
;#END_ASM