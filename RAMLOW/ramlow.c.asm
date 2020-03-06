;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20170112
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Tue Feb 11 06:10:25 2020



	MODULE	ramlow


	INCLUDE "z80_crt0.hdr"


	SECTION	code_compiler


._ramlow
	ret



._main
	ret




; --- Start of Static Variables ---

	SECTION	bss_compiler

	SECTION	code_compiler



; --- Start of Scope Defns ---

	EXTERN	zx_aaddr2cx
	EXTERN	zx_aaddr2cy
	EXTERN	zx_px2bitmask
	EXTERN	zx_aaddr2px
	EXTERN	zx_aaddr2py
	EXTERN	in_key_scancode
	EXTERN	_strtoi_
	EXTERN	strcoll
	EXTERN	stricmp
	EXTERN	zx_py2saddr
	EXTERN	strlcat
	EXTERN	_strtou_
	EXTERN	_divu_
	EXTERN	strcspn
	EXTERN	strncat
	EXTERN	stpncpy
	EXTERN	strnchr
	EXTERN	zx_saddrcleft
	EXTERN	strlcpy
	EXTERN	strncmp
	EXTERN	zx_saddrcdown
	EXTERN	_ldiv_
	EXTERN	in_mouse_amx_reset
	EXTERN	strncpy
	EXTERN	strpbrk
	EXTERN	strnlen
	EXTERN	strndup
	EXTERN	strrchr
	EXTERN	calloc
	EXTERN	zx_pattern_fill
	EXTERN	in_inkey
	EXTERN	in_mouse_amx_wheel
	EXTERN	strnset
	EXTERN	zx_cy2aaddr
	EXTERN	in_mouse_amx_setpos_callee
	EXTERN	in_mouse_kempston_setpos_callee
	EXTERN	aligned_alloc_callee
	EXTERN	calloc_callee
	EXTERN	realloc_callee
	EXTERN	zx_aaddrcup
	EXTERN	in_pause
	EXTERN	strxfrm
	EXTERN	strrspn
	EXTERN	strtoul
	EXTERN	zx_saddr2cx
	EXTERN	zx_saddr2cy
	EXTERN	zx_saddr2px
	EXTERN	zx_saddr2py
	EXTERN	dzx7_standard_back
	EXTERN	zx_scroll_wc_up
	EXTERN	aligned_alloc_unlocked
	EXTERN	calloc_unlocked
	EXTERN	malloc_unlocked
	EXTERN	realloc_unlocked
	EXTERN	zx_cyx2aaddr_callee
	EXTERN	zx_cyx2saddr_callee
	EXTERN	zx_pxy2aaddr_callee
	EXTERN	zx_pxy2saddr_callee
	EXTERN	strtod_callee
	EXTERN	zx_saddrpleft
	EXTERN	strtoul_callee
	EXTERN	aligned_alloc_unlocked_callee
	EXTERN	calloc_unlocked_callee
	EXTERN	zx_saddrpdown
	EXTERN	realloc_unlocked_callee
	EXTERN	index_callee
	EXTERN	rindex_callee
	EXTERN	memset_callee
	EXTERN	strcat_callee
	EXTERN	strcspn_callee
	EXTERN	strlcat_callee
	EXTERN	strncat_callee
	EXTERN	strrcspn_callee
	EXTERN	atexit
	EXTERN	strerror
	EXTERN	strnicmp
	EXTERN	zx_scroll_up
	EXTERN	at_quick_exit
	EXTERN	_ldivu_
	EXTERN	dtoe_callee
	EXTERN	ftoe_callee
	EXTERN	memmem_callee
	EXTERN	dzx7_turbo_callee
	EXTERN	zx_saddrcup
	EXTERN	dzx7_mega
	EXTERN	malloc
	EXTERN	zx_cy2saddr
	EXTERN	_memstrcpy_
	EXTERN	_random_uniform_xor_8_
	EXTERN	strrcspn
	EXTERN	in_mouse_amx_setpos
	EXTERN	memchr
	EXTERN	zx_aaddrcright
	EXTERN	zx_saddrcright
	EXTERN	zx_saddrpup
	EXTERN	memcmp
	EXTERN	memcpy
	EXTERN	in_mouse_amx
	EXTERN	memmem
	EXTERN	strtok_r
	EXTERN	zx_pxy2aaddr
	EXTERN	memset
	EXTERN	rawmemchr
	EXTERN	zx_saddrpleft_callee
	EXTERN	in_mouse_kempston_callee
	EXTERN	strtof_callee
	EXTERN	strtok_r_callee
	EXTERN	dzx7_agile_rcs
	EXTERN	strstrip
	EXTERN	zx_saddr2aaddr
	EXTERN	_shellsort_
	EXTERN	abs
	PUBLIC	_ramlow
	EXTERN	dzx7_smart_rcs_back
	EXTERN	ffs
	EXTERN	zx_cls_wc_callee
	EXTERN	_strtou__callee
	EXTERN	dtog_callee
	EXTERN	ftog_callee
	EXTERN	memmove_callee
	EXTERN	stpcpy_callee
	EXTERN	stpncpy_callee
	EXTERN	strcpy_callee
	EXTERN	strlcpy_callee
	EXTERN	strncpy_callee
	EXTERN	dzx7_standard_back_callee
	EXTERN	dzx7_turbo_back_callee
	EXTERN	dzx7_mega_back_callee
	EXTERN	dzx7_smart_rcs_back_callee
	EXTERN	dzx7_agile_rcs_back_callee
	EXTERN	strchrnul
	EXTERN	rindex
	EXTERN	in_stick_kempston
	EXTERN	dzx7_mega_back
	EXTERN	bsearch
	EXTERN	in_stick_keyboard
	EXTERN	_quicksort_
	EXTERN	zx_scroll_up_callee
	EXTERN	in_mouse_amx_init_callee
	EXTERN	dtoh_callee
	EXTERN	ftoh_callee
	EXTERN	bcmp_callee
	EXTERN	rawmemchr_callee
	EXTERN	memchr_callee
	EXTERN	memswap_callee
	EXTERN	strcmp_callee
	EXTERN	strncmp_callee
	EXTERN	strsep_callee
	EXTERN	strstr_callee
	EXTERN	zx_pxy2saddr
	EXTERN	aligned_alloc
	EXTERN	zx_aaddr2saddr
	EXTERN	zx_saddrpright
	EXTERN	_insertion_sort__callee
	EXTERN	_quicksort__callee
	EXTERN	_shellsort__callee
	EXTERN	itoa_callee
	EXTERN	utoa_callee
	EXTERN	bzero_callee
	EXTERN	strcat
	EXTERN	in_mouse_amx_init
	EXTERN	strpbrk_callee
	EXTERN	strchr
	EXTERN	_div_
	EXTERN	stpcpy
	EXTERN	strcmp
	EXTERN	_random_uniform_xor_32_
	EXTERN	strcpy
	EXTERN	dzx7_turbo_back
	EXTERN	strlen
	EXTERN	strdup
	EXTERN	abort
	EXTERN	strsep
	EXTERN	strrev
	EXTERN	strset
	EXTERN	strlwr
	EXTERN	strtod
	EXTERN	strtof
	EXTERN	strtok
	EXTERN	strtol
	EXTERN	strspn
	EXTERN	bcopy
	EXTERN	strstr
	EXTERN	strupr
	EXTERN	dzx7_standard
	EXTERN	zx_saddrpright_callee
	EXTERN	zx_pattern_fill_callee
	EXTERN	strcoll_callee
	EXTERN	strnlen_callee
	EXTERN	zx_cls
	EXTERN	system
	EXTERN	in_stick_cursor
	EXTERN	in_stick_fuller
	EXTERN	zx_aaddrcleft
	EXTERN	zx_aaddrcdown
	EXTERN	memccpy
	EXTERN	_memlwr_
	EXTERN	index
	EXTERN	dzx7_agile_rcs_back
	EXTERN	bzero
	EXTERN	_memupr_
	EXTERN	_divu__callee
	EXTERN	_ldivu__callee
	EXTERN	_memstrcpy__callee
	EXTERN	strtok_callee
	EXTERN	strxfrm_callee
	EXTERN	dzx7_smart_rcs_callee
	EXTERN	dzx7_agile_rcs_callee
	EXTERN	in_wait_key
	EXTERN	memrchr
	EXTERN	strcasecmp
	EXTERN	in_mouse_kempston_setpos
	EXTERN	memmove
	EXTERN	memswap
	EXTERN	free_unlocked
	EXTERN	strtol_callee
	EXTERN	strset_callee
	EXTERN	strnset_callee
	EXTERN	strndup_callee
	EXTERN	strrspn_callee
	EXTERN	strspn_callee
	EXTERN	realloc
	EXTERN	dzx7_turbo
	EXTERN	srand
	EXTERN	_insertion_sort_
	EXTERN	strrstrip
	EXTERN	zx_cyx2aaddr
	EXTERN	in_key_pressed
	EXTERN	in_wait_nokey
	EXTERN	qsort
	EXTERN	ultoa
	EXTERN	in_test_key
	EXTERN	quick_exit
	EXTERN	in_stick_sinclair1
	EXTERN	in_stick_sinclair2
	EXTERN	bcmp
	EXTERN	_memupr__callee
	EXTERN	dzx7_mega_callee
	EXTERN	ffsl
	EXTERN	labs
	EXTERN	atof
	EXTERN	atoi
	EXTERN	atol
	EXTERN	free
	PUBLIC	_main
	EXTERN	dtoa
	EXTERN	in_mouse_kempston_reset
	EXTERN	dtoe
	EXTERN	dtog
	EXTERN	dtoh
	EXTERN	ftoa
	EXTERN	ftoe
	EXTERN	ftog
	EXTERN	ftoh
	EXTERN	exit
	EXTERN	rand
	EXTERN	itoa
	EXTERN	in_mouse_kempston_wheel
	EXTERN	ltoa
	EXTERN	qsort_callee
	EXTERN	dzx7_standard_callee
	EXTERN	in_mouse_kempston_init
	EXTERN	utoa
	EXTERN	in_mouse_amx_wheel_delta
	EXTERN	zx_cyx2saddr
	EXTERN	in_mouse_kempston_wheel_delta
	EXTERN	_strtoi__callee
	EXTERN	bcopy_callee
	EXTERN	memccpy_callee
	EXTERN	memcpy_callee
	EXTERN	zx_bitmask2px
	EXTERN	strncasecmp
	EXTERN	in_mouse_kempston
	EXTERN	dzx7_smart_rcs
	EXTERN	zx_cls_wc
	EXTERN	zx_border
	EXTERN	zx_py2aaddr
	EXTERN	zx_scroll_wc_up_callee
	EXTERN	in_mouse_amx_callee
	EXTERN	bsearch_callee
	EXTERN	memcmp_callee
	EXTERN	memrchr_callee
	EXTERN	strcasecmp_callee
	EXTERN	strchr_callee
	EXTERN	strchrnul_callee
	EXTERN	stricmp_callee
	EXTERN	strncasecmp_callee
	EXTERN	strnchr_callee
	EXTERN	strnicmp_callee
	EXTERN	strrchr_callee
	EXTERN	_strrstrip_
	EXTERN	_random_uniform_cmwc_8_
	EXTERN	_div__callee
	EXTERN	_ldiv__callee
	EXTERN	dtoa_callee
	EXTERN	ftoa_callee
	EXTERN	ltoa_callee
	EXTERN	ultoa_callee
	EXTERN	_memlwr__callee


; --- End of Scope Defns ---


; --- End of Compilation ---
