#ifndef GRAPHICUTILS_H
#define GRAPHICUTILS_H


extern unsigned char background[];


void clean_screen(void)
{
__asm
	di

	ld b, 5
	call setrambank		; we put it in $c000 - $ffff	
	
	ld hl, $C000
	ld de, $C001
	ld (hl),0
	ld bc, 4095
	ldir
	ld hl, $d800
	ld de, $d801
	ld (hl), $05
	ld bc, 511
	ldir

	ld b, 7
	call setrambank		; we put it in $c000 - $ffff	
	
	ld hl, $C000
	ld de, $C001
	ld (hl),0
	ld bc, 4095
	ldir
	ld hl, $d800
	ld de, $d801
	ld (hl), $05
	ld bc, 511
	ldir
	
	ld b, 0
	call setrambank		; back to normal
	ei

__endasm
}

void load_background(void)
{
	__asm
		di
	__endasm
	bank(3);// Static images in RAM3	

	aplib_depack(16384, background);
	//aplib_depack(16384, 49152);
	//aplib_depack(16384,(unsigned char)screen1);

	__asm
		di
	__endasm
	bank (7);
	
	copytoAltScreen();

	bank (0);

__asm
	ei
__endasm
}



/*void DrawGameMap(void)
{
	
//ATTENTION this routine hangs up somewhere
__asm


call _borderTest

	ld a, (_current_screen)	; we load the screen
	ld b, a
	call _setrambank0		; we put it on $c000 - $ffff
	

	
	ld a, (_current_screen)
	xor 2			; 5 xor 2 = 7; 7 xor 2 = 5
	ld (_current_screen), a	; we exchange the screen on which we are going to write



	ld a, (_CurLevel_XLength)
	ld h,0
	ld l,a
	ld d, $a0
	ld a, (_map_xpos)
	ld e, a				; the map will always start at $a000, so the displacement will always be in E
	ld a, (_map_displacement)
	and $03
	ld c, a				; displacement in pixels within tile
	ld a, (_map_displacement)
	and $0C
	rrca
	rrca
	ld b, a				; displacement in chars within tile
	call DrawMap
__endasm


}*/


void DrawSpriteList(void)
{
	{
		// First draw the ship
		__asm
			ld a, (_ship_x)
			ld b, a
			ld a, (_ship_y)
			ld c,a
			ld de, 0		; _ship01
			call drawsprite

			ld a, (_ship_x)
			add a,16
			ld b, a
			ld a, (_ship_y)
			ld c,a	
			ld de, 1		;_ship02
			call drawsprite	
		__endasm
	}
// Now, display all enemies, shoots, etc

	for(i=0;i<MAX_ENEMIES;i++)
	{
		if (active_enemies[i].sprnum)	// This enemy is active
		{
			dummy_i = active_enemies[i].x;
			dummy_i <<= 8;			// Move X to the upper byte
			dummy_i |= active_enemies[i].y;

			dummy_i2 = active_enemies[i].sprnum;
			__asm
				ld bc, (_dummy_i)
				ld de, (_dummy_i2)
				call drawsprite
			__endasm
		}

		if (my_active_shoots[i].sprnum)	// This enemy is active
		{
			dummy_i = my_active_shoots[i].x;
			dummy_i <<= 8;			// Move X to the upper byte
			dummy_i |= my_active_shoots[i].y;

			dummy_i2 = my_active_shoots[i].sprnum;
			__asm
				ld bc, (_dummy_i)
				ld de, (_dummy_i2)
				call drawsprite
			__endasm
		}

		if (enemy_active_shoots[i].sprnum)	// This enemy shot is active
		{
			dummy_i = enemy_active_shoots[i].x;
			dummy_i <<= 8;			// Move X to the upper byte
			dummy_i |= enemy_active_shoots[i].y;

			dummy_i2 = enemy_active_shoots[i].sprnum;
			__asm
				ld bc, (_dummy_i)
				ld de, (_dummy_i2)
				call drawsprite
			__endasm
		}
	}
}


void NewShoot(unsigned char x, unsigned char y, unsigned char type)
{
        if(!x) return;  // Cannot create a shoot at X=0, it means we are at the end of the screen

	for (i=0;i<max_shoots;i++)
	{
		current_e=&my_active_shoots[i];
		if(current_e->sprnum == 0) // Found a candidate
		{
			current_e->sprnum = 3;	// FIXME: Substitute with some variable holding the current shoot, defining shoot energy, etc
			current_e->x = x;
			current_e->y = y;
			current_e->movement = MOVE_RIGHT;
			current_e->param1 = 8;   // Fast for now, let's see the rest
			return;
		}
	}
}

void NewEnemy(struct Enemy *e)
{
  for(i=0;i<MAX_ENEMIES;i++)
  {
   if(active_enemies[i].sprnum == 0)
   {
      active_enemies[i].sprnum=e->sprnum;
      active_enemies[i].x=((e->x - map_xpos) * 24) + e->x_desp;
      active_enemies[i].y=e->y;
      active_enemies[i].movement=e->movement;
      active_enemies[i].param1=e->param1;
      active_enemies[i].param2=e->param2;
      return;
   }
  }
}


#endif