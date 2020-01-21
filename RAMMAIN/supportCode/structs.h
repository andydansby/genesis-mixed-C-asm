#ifndef STRUCTS_H
#define STRUCTS_H

struct Entity
{
	unsigned char x;
	unsigned char y;
	unsigned char sprnum;	// Number of the entity sprite: if 0, this entity is not active
	unsigned char movement;	// movement type, from one of the predefined ones
	unsigned char energy;
	unsigned char param1;
	unsigned char param2;	// Two parameters, to store some information that is entity-specific
};

// This is a clone of the Entity structure, just for the enemy_locations array. 
// It adds a parameter for displacement within tile!
struct Enemy
{
	unsigned char x;        // Tile in X
	unsigned char x_desp;   // Displacement in tile (0-23)
	unsigned char y;        // Y position
	unsigned char sprnum;	// Number of the enemy sprite: if 0, this enemy is not active
	unsigned char movement;	// movement type, from one of the predefined ones
	unsigned char energy;
	unsigned char param1;
	unsigned char param2;	// Two parameters, to store some information that is entity-specific
};



#endif
