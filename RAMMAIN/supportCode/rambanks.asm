;;ATTENTION - This probally should go in LOW RAM

; I am very lazy, and I copy + modify original routines of Metalbrain :)

SECTION code_crt_common

;;32853 called by 33487
PUBLIC _bank
_bank:
	ld a,(0x5b5c)   
	;//System variable with the previous value
	and 0xf8
	or L
	ld bc,0x7ffd	;//Port to write
;	di
	ld (0x5b5c),a	;//Update system variable
	out (c),a		;//Address
;	ei				;//enable interupts
	
	;ATTENTION
	;;enabling interupts could cause issues down the road, but needed now for testing
ret
 
 
;; This takes what is in the main display (16384) and copies it to RAM 7 display (must bank first) at 49152
PUBLIC _copytoAltScreen
_copytoAltScreen:
	ld hl, 16384
	ld de, $c000
	ld bc, 6912
	ldir			; copy the background to the alternate screen
ret



PUBLIC _setrambank1
_setrambank1:
	; B: new RAM page to put in $C000 - $FFFF
	; We assume interrupts disabled, ojito!!!!!!
	ld a, ($5b5c)		; System variable with the previous value 23388
	and $f8			; keep high bits	and 248
	or b			; we put page B above
	ld bc, $7ffd		; Puerto en el que escribir
	ld	($5b5c),a	;Actualizar variable del sistema
	out	(c),a		;Direccionar
ret



;;ATTENTION to be deleted
PUBLIC _switchscreen2
_switchscreen2:
	; Change the visible screen, without doing anything else
	ld	a,(23388)	;Variable del sistema con el valor previo
	xor	8		;cambiar pantalla
	ld	bc,32765	;Puerto en el que escribir
	;	di			;Interrupciones no, gracias
	ld	(23388),a	;Actualizar variable del sistema
	out	(c),a		;Direccionar
	;	ei			;Habilitar interrupciones
ret			;Volver


PUBLIC _setnormalRAMstate
setnormalRAMstate:
	; Cambia la pantalla visible a la por defecto (en 16384), y la RAM 0 en $C000
	ld a, (23388)		; Variable del sistema con el valor previo
	and $f0			; conservar bits altos, pagina 0, pantalla normal
	ld bc, $7ffd		; Puerto en el que escribir
	di
	ld	(23388),a	;Actualizar variable del sistema
	out	(c),a		;Direccionar
	ei
ret

;PUBLIC _endlessLoop
;	push hl
;	ld hl, 255
;	jp _endlessLoop
;	pop hl
;ret