/*
 * (C) Copyright 2003
 * Wolfgang Denk Engineering, <wd@denx.de>
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

/*
OUTPUT_FORMAT("elf32-bigmips", "elf32-bigmips", "elf32-bigmips")
*/
OUTPUT_FORMAT("elf32-ntradbigmips", "elf32-ntradbigmips", "elf32-ntradbigmips")
OUTPUT_ARCH(mips)
SECTIONS
{
	.text       :
	{
	  *(.text*)
	}

	. = ALIGN(8);
	.rodata  : { *(SORT_BY_ALIGNMENT(SORT_BY_NAME(.rodata*))) }

	. = ALIGN(8);
	.data  : { *(.data*) }

	. = .;
	_gp = ALIGN(16) + 0x7ff0;

	.got : {
	  __got_start = .;
	  *(.got)
	  __got_end = .;
	}

	.sdata  : { *(.sdata*) }

	. = ALIGN(8);
	__bss_start = .;
	.sbss (NOLOAD) : { *(.sbss*) }
	.bss (NOLOAD)  : { *(.bss*) . = ALIGN(8); }

	_end = .;
}
