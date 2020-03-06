;;levelUtils.asm
;; these are short routines that are pulled from levelutils.h

extern _level_pointer
extern _CurLevel_NTiles

extern _depack0

extern _CreaTablaTiles

section code_user

PUBLIC _funcBorder
_funcBorder:
	call _borderTest
	jp _funcBorder

PUBLIC _unpackMap
;#BEGIN_ASM
;;must be in UNCONTENDED
_unpackMap:


;;	ld de, $a000
		;;have a feeling the problem is here hard coded addy
		;;defc 		MAP_START	= $A000 in engine.asm
	ld de, MAP_START


	ld hl, (_level_pointer)
;	call _depack
halt

	
call _funcBorder

	ld de, $a000;;hard coded addy
	ld a, (_CurLevel_NTiles)
	ld b,a
	call _CreaTablaTiles

ret
;#END_ASM



PUBLIC _unpackLevelPointer
;#BEGIN_ASM
;;must be in UNCONTENDED
_unpackLevelPointer:
;;	ld de, $a000
;;	ld hl, (_level_pointer)
;;	call depack
ret
;#END_ASM


PUBLIC _setAddress
;#BEGIN_ASM
;;must be in UNCONTENDED
_unpackPointer:
;;	ld de, _enemy_locations
;;	ld hl, (_level_pointer)
;;	ld bc, (_dummy_i)
;;	ldir
ret
;#END_ASM