;;drawGameMap.asm

extern _borderTest
extern _current_screen
extern _setrambank0
extern _map_xpos
extern _map_displacement
extern _CurLevel_XLength


section code_user

PUBLIC _DrawGameMap
;#BEGIN_ASM
;;can be in CONTENDED
_DrawGameMap:

	ld a, (_current_screen)	
;; we load the screen
	ld b, a
	call _setrambank0
;; we put it on $c000 - $ffff
	
	ld a, (_current_screen)
	xor 2
;; 5 xor 2 = 7; 7 xor 2 = 5
	ld (_current_screen), a	
;; we exchange the screen on which we are going to write

	ld a, (_CurLevel_XLength)
	ld h,0
	ld l,a
	ld d, $a0
	ld a, (_map_xpos)
	ld e, a
;; the map will always start at $a000, so the displacement will always be in E

	ld a, (_map_displacement)
	and $03
	ld c, a	
;; displacement in pixels within tile
	ld a, (_map_displacement)
	and $0C
	rrca
	rrca
	ld b, a
;; displacement in chars within tile

;;halt;;for testing
;;#9166
	call _DrawMap
ret
;#END_ASM

;;before call DrawMap
;;pc 62d5
;;sp 5fd0
;;af 44 OK
;;'af' 7e6d different
;;bc 0 OK
;;'bc' 1007 different
;;de a000 OK
;;'de' 369b OK
;;hl 00ff OK
;;'hl' 2758 OK
;;ix 4 different
;;iy e0 different
;;i 80 OK
;;r 50 different