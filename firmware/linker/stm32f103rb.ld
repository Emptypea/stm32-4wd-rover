/* STM32F103RB - Linker Script*/
MEMORY
{
    /* Flash Start: 0x08000000 (Source : RM0008 Section 3.3.3, Embedded Flash memory) */
    /* Flash Size: 128K (Source : DS5319 Table 2) */
    FLASH   (rx)    : ORIGIN = 0x08000000, LENGTH = 128K

    /* RAM Start: 0x20000000 (Source : RM0008 Section 3.3.1, RAM) */
    /* RAM Size: 20K (Source : DS5319 Table 2) */
    RAM     (rwx)   : ORIGIN = 0x20000000, LENGTH = 20K   
}

SECTIONS
{
    .isr_vector :
    {
        KEEP(*(.isr_vector))    /* KEEP = never throw away, even if no code seems to use it */
    } > FLASH
    
    .text :          /* the name this group gets in the final .elf */
    {
        *(.text*)   /* From every .o file (*), take every section whose name starts with .text (.text*) */
    } > FLASH       /* Put the group in the FLASH region. */
}
