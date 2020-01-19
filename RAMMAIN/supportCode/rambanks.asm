;;ATTENTION - This probally should go in LOW RAM

; I am very lazy, and I copy + modify original routines of Metalbrain :)



PUBLIC _setrambank
_setrambank:
	; B: new RAM page to put in $C000 - $FFFF
	; We assume interrupts disabled, ojito!!!!!!
	ld a, (23388)		; System variable with the previous value
	and $f8			; keep high bits
	or b			; we put page B above
	ld bc, $7ffd		; Puerto en el que escribir
	ld	(23388),a	;Actualizar variable del sistema
	out	(c),a		;Direccionar
ret		


PUBLIC _switchscreen
_switchscreen:
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
