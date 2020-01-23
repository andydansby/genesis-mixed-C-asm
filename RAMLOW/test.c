#include "engine.h"
//engine.h is FOUND in RAMMAIN



/*
#include "structs.h"
#include "movement.h"
#include "constants.h"

//my includes

#include "variables.h"
#include "utils.h"
#include "playercontrols.h"
#include "wyzplayer.h"
#include "levelutils.h"
#include "graphicutils.h"
#include "collision.h"
#include "displayloop.h"//used to display sprites and screen in game loop
*/
#include <stdio.h>//standard input output

//#include "mainmenu.h"
//#pragma output STACKPTR=24600






void gameloop(void)
{
	for(;;)
	{
		display_loop();// drawing routines for map, calling sprites and music play

		if(joy & JOY_UP)
		{
			if(speed_y > -4) speed_y --;
		}
		else if(joy & JOY_DOWN)
		{
			if(speed_y < 4) speed_y ++;
		}
		else if(speed_y > 0) speed_y--;	// No keys pressed, decrease speed
		else if(speed_y < 0) speed_y++;


		if(joy & JOY_LEFT)
		{
			if(speed_x > -4) speed_x --;
		}
		else if(joy & JOY_RIGHT)
		{
			if(speed_x < 4) speed_x++;
		}
		else if(speed_x > 0) speed_x--;
		else if(speed_x < 0) speed_x++;

		if (joy & JOY_FIRE)
		{
			if (!frames_to_shoot)
			{
				NewShoot(ship_x+32, ship_y,0);
				frames_to_shoot=5;
			}
		}

		// Update ship speed if needed

		ship_x += speed_x;
		if (ship_x > 224)
		{
			if(speed_x > 0) ship_x = 224;
				else ship_x=0;
		}
		ship_y += speed_y;
	
		if (ship_y > 112)
		{
			if(speed_y > 0) ship_y = 112;
				else ship_y=0;
		}

		// Move map to new position
		map_displacement++;
		if (map_displacement > 0xb)
		{
			map_displacement = 0;
			map_xpos++;
		}

		// Move active enemies and shoots
		for(i=0;i<MAX_ENEMIES;i++)
		{
			if (active_enemies[i].sprnum)	// This enemy is active
			{
				(movement_funcs[active_enemies[i].movement])(&active_enemies[i]);  // Process enemy movement
			}

			if (my_active_shoots[i].sprnum)	// This shoot is active
			{
				(movement_funcs[my_active_shoots[i].movement])(&my_active_shoots[i]);  // Process shoot movement
			}

			if (enemy_active_shoots[i].sprnum)	// This enemy shoot is active
			{
				(movement_funcs[enemy_active_shoots[i].movement])(&enemy_active_shoots[i]);  // Process enemy shoot movement
			}
		}
		// Activate/deactivate new enemies

		while(enemy_locations[new_enemy].x < (map_xpos+11))
		{
			NewEnemy(&enemy_locations[new_enemy]);
			new_enemy++;
		}

		// Process shoots
		if (frames_to_shoot) frames_to_shoot--; // Less time to wait
		
		for(i=0;i<max_shoots;i++)
		{
			if (my_active_shoots[i].sprnum)	// This shoot is active
			{
				dummy_b = shoot_hits_enemy(&(my_active_shoots[i]));
				
				if(dummy_b != 255)	// This shoot has hit an enemy
				{
					active_enemies[dummy_b].sprnum=4;	// exploding!
					active_enemies[dummy_b].movement=MOVE_EXPLOSION;
					my_active_shoots[i].sprnum = 0;
				}
			}
		}

		// Check collisions with enemies
	 
		dummy_b = enemy_hits_ship();
		if(dummy_b != 255) 
		{
			__asm
				ld a, 4
				out ($fe), a
			__endasm
		}
		else
		{
			__asm
				ld a, 0
				out ($fe), a
			__endasm  
		}
	}
}


void main(void)
{
	//mainMenu();
	//mainMenuSelection();
	
	
	//ATTENTION
	wyz_load_music(0);
  
	

	__asm
	   ld a, r
	   and $7f
	   ld r,a	; clear the highest bit of the R register. It will be used to flag for a screen switch
	   ld a, 0x8a
	   ld hl, 0x8000
	   ld de, _gameISR
	   call SetIM2
	__endasm

	__asm
		call InitSprCacheList	
		;; initialize sprite cache list
	__endasm


	load_level(0);


	load_background();
	clean_screen();



	 // init everything
	 ship_x=ship_y=map_xpos=map_displacement=0;
	 speed_x=speed_y=frames_to_shoot=0;
	 current_screen = 7;
	 max_shoots=4;

	for (i=0;i<MAX_ENEMIES;i++) active_enemies[i].sprnum=my_active_shoots[i].sprnum=enemy_active_shoots[i].sprnum=0;

	// Activate enemies
	new_enemy=0;

	while(enemy_locations[new_enemy].x < 11)
	{
		NewEnemy(&enemy_locations[new_enemy]);
		new_enemy++;
	}


	gameloop();
}


