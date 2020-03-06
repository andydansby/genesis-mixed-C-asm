;;contended memory from 24600-32767
;;8167 bytes total

;;The ULA bug which causes snow when I is set to point to contended memory still occurs, and also appears to crash the machine shortly after I is set to point to contended memory.

;;THIS MEANS ISR CANNOT BE IN CONTENDED MEMORY!!!

;;ATTENTION
;;Breakpoint in code is $611B
;;ATTENTION

SECTION CONTENDED


org 0x6018
;;24600

;;in RAMMAIN
EXTERN _setrambank1
EXTERN _IM2table
EXTERN _isrdummy
EXTERN _ISR_space
;--------------------------
;;in RAM 0
EXTERN _INICIO



;;org 0x6018;;24600-32767 program start and below uncontended

;;original found in test.c C_Code_1-4-2020

INCLUDE "depack.asm"


;;starts at $6018-$602A
;;called from $927B
;; runs once during game setup
PUBLIC _interuptSetup
;#BEGIN_ASM
_interuptSetup:

	nop	;;used to make sure that the next line is compiled
	ld a, r
	and $7f
	ld r,a
	;; clear the highest bit of the R register. It will be used to flag for a screen switch
	
	ld a, 0x8a
	
	ld hl, _IM2table
	;;	ld hl, 0x6018
	;; 0x8000 was a 257 byte table for the interupt manager
	;;now 257 byte from 6018 - 6119


	ld de, _gameISR1	
	;;	ld de, $614f
	;;load de with actual _gameISR
	
	;;ATTENTION $6088 calls _read_joystick first and then calls asm routine found in utils.h
	
	call _SetIM2
;;seems to only run once
;;seems to crash program
;; perhaps because of fastcall
ret
;#END_ASM

;----------------------------------

;;starts at $612e - $614e
;;CRASHES
;;probally because it fills a direct address space rather than the _IM2table table

PUBLIC _SetIM2
;#BEGIN_ASM
;; Set IM2 mode, prepare IM2 table (257 bytes with the same value)
;;
;; INPUT: 
;;	A: byte to set for the table -> interrupt will go to AA
;;	HL: IM2 table (257 bytes, L must be 0)
;;	DE: address with the ISR handler
	
_SetIM2:
	di
	
	
	;;ATTENTION gets funny here
	;;some self modifying code
	ld (_israddr), de
	;; set address in handler
	;;ld (_israddr + 1), de

	;;THIS IS CERTAINLY SELF MODIFYING CODE
	;; in _israddr there is a CALL 0000
	;;the 0000 gets replaced
	
	

	push af
	ld a, h
	ld i, a
	pop af						; set the I register

	ld (hl), a
	
	;;;;;
	ld d,h
	ld e,l
	inc de
	;;could perhaps make a 27 or 28 byte table that would be empty and fill in that table with ISR
	
	
	ld bc, 256
	ldir
	; fill the 257 byte table
	;;Source address in HL, a target address in DE, and a 16-bit count in BC
	

	;;ld de, _ISR_space
	ld d, a
	ld e, a;; DE=AA	
	;;ld de, _ISR_space

	
	ld hl, _BASICISR
	ld bc, 27
	ldir				
	;; copy BASIC ISR, which will call to the cool one
	;; Source address in HL, a target address in DE, and a 16-bit count in BC

	im 2

	ei
ret
;#END_ASM

;-----------------------------------

;;starts #614F-#6159
PUBLIC _BASICISR
;#BEGIN_ASM
_BASICISR:
	push hl
	push af
	push bc
	push de
	push ix
	push iy
	ex af, af'
	push af
	ex af, af'
;#END_ASM

;-----------------------------------
;;starts $615A-#61aa
PUBLIC _israddr
_israddr:
;#BEGIN_ASM
	;;	ATTENTION
	;;	call 0 	; to be substituted with the actual ISR handler address
	
	call _gameISR1
	;; to be substituted with the actual ISR handler address
	
	

	ex af, af'
	pop af
	ex af, af'
	pop iy
	pop ix
	pop de
	pop bc
	pop af
	pop hl

	ei
ret	; total: 27 bytes!
;#END_ASM

;-----------------------------------

;;starts at #615B-6166
PUBLIC _gameISR1
;#BEGIN_ASM
_gameISR1:
	ld a,r
	jp p, _noscreenswitch	; the highest bit of R is 0, no screen switch yet
	
	call _switchscreen	; switch screen
	
	ld a, r
	and $7f
	ld r,a	
	;; clear the highest bit of the R register. It will be used to flag for a screen switch
ret
;#END_ASM

;-----------------------------------

;;starts at #6176-618D
PUBLIC _noscreenswitch
;#BEGIN_ASM
_noscreenswitch:
	ld a, (0x5b5c)
	and $07				; keep low bits
	ld (_isrdummy), a	; save current state
	
	ld b, 0;;<<ATTENTION	
	call _setrambank0	
;; go to ram bank 0 for the music ISR

;;#6047
;;ATTENTION problem / all nop's
	call _INICIO
;;call #c042 BANK 0
;;call _WYZ_PLAY/INICIO
	
	ld a, (_isrdummy)
	
	ld b, a ;;<<ATTENTION
	call _setrambank0	; go back to normal state
ret
;#END_ASM

;-----------------------------------

;;starts at #618E-619B
PUBLIC _switchscreen
;#BEGIN_ASM
_switchscreen:
	; Change the visible screen, without doing anything else
	ld	a,(0x5b5c)	;System variable with the previous value
	xor	8			;Change screen
	ld	bc,0x7ffd	;Port to write to
	;	di			;disable interupts
	ld	(0x5b5c),a	;Update system variable
	out	(c),a		;Address
	;	ei			;Enable interupts
ret
;#END_ASM

;-----------------------------------

;;starts at #6060-606e
PUBLIC _setrambank0
;#BEGIN_ASM
_setrambank0:
	;; B: new RAM page to put in $C000 - $FFFF
	;; We assume interrupts disabled
	ld a, ($5b5c)		
	;; System variable with the previous value 23388
	and $f8			;; keep high bits and 248
	or b			;; we put page B above
	ld bc, $7ffd	;; Port to write to
	ld	($5b5c),a	;;Update system variable
	out	(c),a		;;Address
ret
;#END_ASM

;-----------------------------------

PUBLIC _borderTest
;#BEGIN_ASM
_borderTest:
ld hl, 0
call borderChange
ld hl, 4
call borderChange
jp _borderTest

borderChange:
ld a, l
and 7
ld l, a
ld a, (value)
and 248
or l
ld (value), a
out (254), a
ret

value:
defb 7
;#END_ASM





;;SECTION code_crt_common
;;this SECTION is near the start of the binary



;;2305 in zx assembler

;;this PUBLIC needs to be absolutely last as it's just a marker
;;used to find where in memory the last byte is located


;;SECTION code_crt_common
;;this SECTION is near the start of the binary


SECTION CODE_END
;;this section places the code at the end of compiled SECTION.


;;just to identify memory area
;;#61ae
PUBLIC _RAM_marker_LOW
_RAM_marker_LOW:
;;	halt
;;	nop
;;	halt
;;	halt	;;for troubleshooting
ret


