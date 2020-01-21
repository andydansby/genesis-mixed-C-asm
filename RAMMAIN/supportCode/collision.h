#ifndef COLLISION_H
#define COLLISION_H

unsigned char shoot_hits_enemy(struct Entity *shoot)
{
 shoot_xchar = (shoot->x) / 8;
 shoot_ychar = (shoot->y) / 8;

 for(j=0;j<MAX_ENEMIES;j++)	// For now, a crude bounding box collision detection. If it works...
 {
  current_e = &active_enemies[j];
  if(current_e->sprnum)	// This is a real active enemy
  {
	 enemy_xchar = (current_e->x) / 8;
	 enemy_ychar = (current_e->y) / 8;

	 enemy_xchar -= shoot_xchar;
	 enemy_ychar -= shoot_ychar;

	 if((enemy_xchar < 2) && (enemy_xchar > -2))
	 {
	  if((enemy_ychar < 2) && (enemy_ychar > -2))	return j;
	 }
  }
 }
 return 255;
}

// Initially, use the same bounding box algorithm. We will have to be a bit more precise.



unsigned char enemy_hits_ship(void)
{
  for(j=0;j<MAX_ENEMIES;j++)
  {
	current_e = &active_enemies[j];
	if (current_e->sprnum)	// This enemy is active
	{
	 diff_x = ship_x;
	 diff_x -= current_e->x;

	 diff_y = ship_y;
	 diff_y -= current_e->y;

	 if((diff_x < 24) && (diff_x > -24))
	 {
	   if((diff_y < 12) && (diff_y > -12))  return j; // HIT this enemy!
	 }
	}
  }
 return 255; // No hit
}

#endif