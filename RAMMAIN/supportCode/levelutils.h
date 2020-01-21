#ifndef LEVELUTILS_H
#define LEVELUTILS_H

void load_level(unsigned char level)		
{
	__asm
		di
		push bc
		ld b, 4
		call setrambank		; Levels in RAM4
		pop bc
	__endasm

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
	__asm
		
		ld de, $a000
		ld hl, (_level_pointer)
		call depack

		ld de, $a000
		ld a, (_CurLevel_NTiles)
		ld b,a
		call CreaTablaTiles
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


		ld b, 0
		call setrambank		; vuelta a la normalidad
		ei
	__endasm
}

#endif