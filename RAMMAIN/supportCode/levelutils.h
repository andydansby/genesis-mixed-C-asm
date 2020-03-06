#ifndef LEVELUTILS_H
#define LEVELUTILS_H



void load_level(unsigned char level)		
{
	
	
	
	//32842
	//look near 33487
	bank(4);
	
	
	
/*	
__asm
	di;;33422
	push bc

	ld b, 4
	

	;call _setrambank1		; Levels in RAM4 levelutils
	;;supposed to call setrambank (33672), but it goes to somewhere else in memory
	;;calls 33929
	;;33684??32872??
	
	;;8489	8388

	pop bc
__endasm
*/


	level_pointer=(unsigned char*)level_address[level];
		
	CurLevel_NTiles = *(level_pointer)++;
	CurLevel_XLength = *(level_pointer)++;	// Load the basic level data
	int_pointer=level_pointer;
	length_tiles = *(int_pointer);
	level_pointer+=2;
	int_pointer=level_pointer;
	length_map = *(int_pointer);
	level_pointer+=2;
		
	// Prepare tiles, preshift them, store them in their final location
	// We will use the map area as decompression buffer
	//remember, we are still in RAM4
	
	
	//ATTENTION (RIGHT NOW we leave alone)
	//$A000 = 40960 is in uncontended normal RAM
	// we can either move it to contended ram 24600-32767
	// or move it to RAM 4 to an unused area (above 49152)
	
	//I think moving them to UNCONTENDED is better especially since the data can be used and not banked out
	

	//defc 		MAP_START	= $A000
	// in engine.asm
	//ld de, MAP_START
	
	


	unpackMap();
	
//junkLoop();// just an endless loop flashing border
	
	
__asm
;;ATTENTION

;	ld de, $a000;;have a feeling the problem is here hard coded addy
	;;MAP_START = A000
	;;defc 		MAP_START	= $A000
	;; in engine.asm
;	ld de, MAP_START
	
	
	
;	ld hl, (_level_pointer)
;	call depack

;	ld de, $a000;;hard coded addy
;	ld a, (_CurLevel_NTiles)
;	ld b,a
;	call CreaTablaTiles
__endasm



	// now, copy the map (uncompress) to its final location
	level_pointer += length_tiles;
		
__asm
	ld de, $a000
	ld hl, (_level_pointer)
	call depack
__endasm
	
	// Copy enemy table
	level_pointer=(unsigned char*)enemy_address[level];

	dummy_i = *level_pointer; // Number of enemies in level
	level_pointer++;
	dummy_i *= sizeof (struct Enemy);

__asm
	ld de, _enemy_locations
	ld hl, (_level_pointer)
	ld bc, (_dummy_i)
	ldir
__endasm


//back to bank (0)
	bank(0);//ATTENTION
	
	__asm
		;ld b, 0
		;call setrambank	; back to normal
		ei
	__endasm

}

#endif