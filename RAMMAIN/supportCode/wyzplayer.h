#ifndef WYZPLAYER_H
#define WYZPLAYER_H

	// WYZ player functions

	void wyz_load_music (unsigned char mzk_number)
	{
		
		dummy_b=mzk_number;		
		__asm
			di
			ld a, (_dummy_b)
			call CARGA_CANCION	
			ei
		__endasm
		
	}

	void wyz_stop_music(void)
	{
		
		__asm
			di	
			CALL STOP_PLAYER
			ei
		__endasm
		
	}

	void wyz_play(void)
	{
		
		__asm		
			call WYZ_PLAY
			;call _INICIO
		__endasm
		
	}

#endif