#ifndef DISPLAYLOOP_H
#define DISPLAYLOOP_H

void display_loop(void)
{
	__asm
			waitvblank:
			ld a,r
			jp m, waitvblank
			; while the screen has not been switched, we cannot continue

			di
			call _DrawGameMap
			; draw map, interrupts must be disabled

			ld b, 0
			call setrambank
			; we have missed one interrupt for sure, so call player
			call WYZ_PLAY

			ld a, (_current_screen)
			xor 2			
			; 5 xor 2 = 7; 7 xor 2 = 5
			ld b, a
			call setrambank
			; restore the previous paging state
			ei

			call _DrawSpriteList	; draw sprites
			ld a,r
			or $80
			ld r,a
			; set the highest bit of R to 1, so switch screen!!!!

			di
			ld b, 0
			call setrambank
			; leave the RAM bank 0 in place before continuing
			ei
			;	halt			; esperamos el retrazo
			;	call switchscreen	; y mostramos la nueva pantalla!

		__endasm
}

#endif