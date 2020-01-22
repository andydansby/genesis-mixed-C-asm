;;contended memory from 24600-32767
SECTION CONTENDED
org 0x6018;;24600-32767 program start and below uncontended











;;this PUBLIC needs to be absolutely last as it's just a marker
;;used to find where in memory the last byte is located
PUBLIC _endmarkerRamLow
_endmarkerRamLow:
	nop
