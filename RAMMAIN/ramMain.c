#include <arch/zx.h>
#include <input.h>
#include <stdlib.h>//standard library
#include <string.h>
//#include <compress/aplib.h>
#include <compress/zx7.h>



#include "ramMain.h"

#include "engine.h"
#include "structs.h"
#include "movement.h"
#include "constants.h"

//-----------
#include "variables.h"
#include "utils.h"
#include "playercontrols.h"
#include "wyzplayer.h"
#include "levelutils.h"

#include "graphicutils.h"
#include "collision.h"
#include "displayloop.h"//used to display sprites and screen in game loop

#include "mainmenu.h"

//there is 16k of uncontended RAM 32768 to 49151
void uncontended(void)
{
}


