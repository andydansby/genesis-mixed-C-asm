cd asm
	copy "menu.asm" "..\"
	copy "move.asm" "..\"
	copy "behav.asm" "..\"
	copy "maindefs.asm" "..\"
cd ..

cd graphics
	copy "title_hiscores.scr" "..\"
	copy "credits_bkg.scr" "..\"
	copy "genesis_title.scr" "..\"
cd ..

apack c genesis_title.scr genesis_title.bin
apack c title_hiscores.scr title_hiscores.bin
apack c credits_bkg.scr credits_bkg.bin

pasmo menu.asm menu.bin menu.sym
pasmo move.asm move.bin move.sym
pasmo behav.asm behav.bin behav.sym

copy /b menu.bin+move.bin+behav.bin  ram6.bin


del genesis_title.bin
del title_hiscores.bin
del credits_bkg.bin
del menu.bin
del move.bin
del behav.bin

del "menu.asm"
del "move.asm"
del "behav.asm"
del "maindefs.asm"

del "title_hiscores.scr"
del "credits_bkg.scr"
del "genesis_title.scr"

move "menu.sym" "symbol\"
move "move.sym" "symbol\"
move "behav.sym" "symbol\"

move "ram6.bin" "..\"