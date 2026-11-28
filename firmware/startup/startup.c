#include <stdint.h>
#include <stdbool.h>

void Reset_Handler(void);

//  Entry 0: initial SP value = 0x20005000 (one past the last byte of SRAM).
//  Value is derived from
//      1. SRAM Size = 20 KB (reference: DS5319 - Table 2)
//      2. SRAM starting address: 0x20000000 (reference: RM0008 - Section 3.3.1)
//      3. N_sp = 0x20000000 + 0x5000 = 0x20005000 - Initial SP Value
//      4. Last Byte = 0x20004FFF.
//  Entry 1: reset vector = address of Reset_Handler (filled in by the toolchain).

const uint32_t vector_table[] __attribute__((section(".isr_vector"))) = {0x20005000, (uint32_t)Reset_Handler};

void Reset_Handler(void){
    while(true);
}
