;;bank 3 above 49152
SECTION BANK_03
org 0xc000;;believe this is assumed with target ZX

PUBLIC _background
_background:
	BINARY "background.bin"












;;this PUBLIC needs to be ABSOLUTELY LAST as it's just a marker
;;used to find where in memory the last byte is located
PUBLIC _endmarkerRam3
_endmarkerRam3:
	nop
	
	