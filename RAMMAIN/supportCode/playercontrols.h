#ifndef PLAYERCONTROLS_H
#define PLAYERCONTROLS_H

	int __FASTCALL__ read_joystick(int joytype)
	{
	__asm
		ld a, l
		ld ix, _keys
		call get_joystick
		ld h,0
		ld l,a
	__endasm
	}


#endif