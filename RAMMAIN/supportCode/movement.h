#ifndef MOVEMENTS_H
#define MOVEMENTS_H
extern void  *movement_funcs[];

#define MOVE_NONE 0
#define MOVE_LEFT 1
#define MOVE_RIGHT 2
#define MOVE_PINGPONG 3
#define MOVE_EXPLOSION 4

#endif




/////  These following functions are defined in movement.c

#include "structs.h"

// Simple go left movement
// param1: speed

void move_left(struct Entity *e)
{
	if(e->x > e->param1)
	{
	 e->x-=e->param1;
	}
	else
	  e->sprnum =0;
}

// Simple go right movement
// param1: speed

void  move_right(struct Entity *e)
{
	if(e->x < 239-e->param1)
	{
	 e->x+=e->param1;
	}
	else
	  e->sprnum =0;
}

// ping-pong movement
// param1: 0 (move left), 1 (move right)
// param2: speed

void  move_pingpong(struct Entity *e)
{
	if(e->param1 == 0) // moving left
	{
		if(e->x > e->param2)
		{
		 e->x-=e->param2;
		}
		else
		 e->param1=1;
	}
	else
	{
		if(e->x < 239-e->param2)
		{
		 e->x+=e->param2;
		}
		else e->param1=0;
	}
}

// Movement type for explosions

void move_explosion(struct Entity *e)
{
	if(e->sprnum < 7)
	{
		e->sprnum++;
	}
	else e->sprnum=0;

}

// Dummy movement, does nothing

void move_none(struct Entity *e)
{
	return;
}


void  *movement_funcs[]={move_none,move_left,move_right,move_pingpong,move_explosion};
