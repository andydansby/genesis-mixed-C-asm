#ifndef MAINMENU_H
#define MAINMENU_H

#include <stdlib.h>//standard library
//extern unsigned char _s_title [];//steamed_title
//extern unsigned char s_credits [];//credits_bkg
//extern unsigned char s_hiscore [];//title_hiscores
//title_hiscores

/*
__asm
	._s_title
	BINARY "steamed_title.bin"
	
__endasm

/*
__asm
	._s_marco
	BINARY "credits_bkg.bin"
__endasm

__asm
	.s_hiscore
		BINARY "title_hiscores.bin"
__endasm*/



#define KEY_1 '1'
#define KEY_2 '2'
#define KEY_3 '3'
#define KEY_4 '4'
#define KEY_5 '5'
#define K_EXIT  'G'
#define K_CLEAR 'H'

//use RAM 6 for Menu storage

	void mainMenuSelection(void)
	{
		unsigned char i;	
		i = 1;
		
		//borderColor(0);
		//M_OUTP(0xfe, 5);
		//M_OUTP(0xfe, 0);
		
		while (i == 1)//main menu
		{
			
			//title_hiscores INCBIN "title_hiscores.bin"
			//credits_bkg INCBIN "credits_bkg.bin"
			//genesis_title INCBIN "genesis_title.bin"
			/*
			__asm
			//; load title screen			
			ld hl, _s_title
			ld de, 16384
			call depack			
			__endasm
			*/
			
			
			switch( getk() )
			{
				case KEY_1:
					borderColor(1); 
					break;
				
				case KEY_2:
					borderColor(2);
					break;
					
				case KEY_3:
					borderColor(3); 
					break;

				case KEY_4:
					borderColor(4); 
					break;

				case KEY_5:
					borderColor(5);
					i = 0;
					break;
				
			}
			//i= inp(0xf7fe) & 0x1f;
		}
	}
	
void mainMenu(void)
{
	//mainMenuSelection();
/*	for(;;)
	{
		//wyz_load_music(MUSIC_MAINMENU);
		
		// clear screen
		__asm
			call cleanattr			
		__endasm		
		
		// change to RAM bank 6
		__asm
			di
			ld b, 6
			call setrambank		; go to ram bank 6 for the menu
			ei
		__endasm
		
		__asm
			;call MAINMENU
		__endasm
		
		
	}*/
}


/*	extern void __FASTCALL__ RAMBANK(unsigned char bank)
	{
		//data is pushed using the L register, but is pushed using HL pair
		__asm
				; B: new RAM page to put in $C000 - $FFFF
				; We assume interruptions are disabled
			setrambank:	ld a, (23388)
				; System variable with the previous value
			and $f8
				; keep high bits
			or b
				; we put page B above
			ld bc, $7ffd
				; Port in which to write
			ld	(23388),a
				;Update system variable
			out	(c),a
				;Address
			ret		
		__endasm		
	}*/
	
	
/*	extern void __FASTCALL__ SCREENSWAP(unsigned char bank)
	{
		//data is pushed using the L register, but is pushed using HL pair
		// Change the visible screen, without doing anything else
		__asm
	
		push af
		push bc
	
		ld a, L

		switchscreen:
			ld	a,(23388)
				;System variable with the previous value
     		xor	8
				;Change screen
     		ld	bc,32765
				;Port in which to write
				;di
				;Interruptions, no thanks
     		ld	(23388),a
				;Update system variable
     		out	(c),a
				;Address
			;ei
				;Enable interrupts
				
			pop bc
			pop af
				
				

			ret
				;return
		__endasm
	}
*/	



//sccz80:"mainmenu.h" L:180 Warning:#4:Function returns different type to prototype
//sccz80:"mainmenu.h" L:180 Warning:#5:Prototype is signed int fn
//sccz80:"mainmenu.h" L:180 Warning:#6:Function is void fn

	extern void __FASTCALL__ borderColor(unsigned char color)
	{
		//data is pushed using the L register, but is pushed using HL pair
		__asm
		
			ld a,L	;L
			out ($fe), a
		__endasm	
	}




// Change the visible screen, without doing anything else

__asm
	PUBLIC _switchscreen1
_switchscreen1:
	ld	a,(23388)	;System variable with the previous value
	xor	8		;Change screen
	ld	bc,32765	;Port in which to write
	;	di			;Interruptions, no thanks
	ld	(23388),a	;Update system variable
	out	(c),a		;Address
	;	ei			;Enable interrupts
ret			;Return
__endasm

#endif