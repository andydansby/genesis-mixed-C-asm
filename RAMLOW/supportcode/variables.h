

// Game variables
unsigned char ship_x;
unsigned char ship_y;
char speed_x;
char speed_y;
unsigned char frames_to_shoot;		// Can we shoot now?
unsigned char current_screen;
unsigned char map_xpos;
unsigned char map_displacement;  // Displacement in tile: 0000YYXX, where XX is the displacement in pixels (0, 1==2, 2==4, 3==6), and YY is the displacement in chars (0-2).

unsigned char max_shoots; 	// Maximum number of shoots allowed with the current weapon

// Temporary definition of structs. If they work as-is, we will move them to an include file
unsigned char CurLevel_XLength;		// Length in X of the current level
unsigned char CurLevel_NTiles;		// Number of tiles for the current level
unsigned int keys[]={KEY_Q,KEY_A,KEY_O,KEY_P,KEY_SPACE};
unsigned char joy;

// Array of existing enemies and shoots (max 8 enemies for now)

struct Entity active_enemies[MAX_ENEMIES];
struct Entity my_active_shoots[MAX_ENEMIES];
struct Entity enemy_active_shoots[MAX_ENEMIES];
struct Entity *current_e;	// Useful for functions needing a global variable...

// Array of enemy locations in the game
// We use the same Entity structure, with just one difference: X now means the tile

struct Enemy enemy_locations[128]; // up to 128 enemies per level, 8 bytes per enemy: 1K
unsigned char new_enemy;

// Loop counters and temporary variables

unsigned char i,j;
unsigned char dummy_b;
unsigned int dummy_i;
unsigned int dummy_i2;

unsigned char isrdummy;

// Levels have compressed data, let's see how it goes when loading them

unsigned char *level_pointer;
unsigned int *int_pointer;
unsigned int length_tiles;
unsigned int length_map;

char shoot_xchar, shoot_ychar;
char enemy_xchar, enemy_ychar;

int diff_x, diff_y;



