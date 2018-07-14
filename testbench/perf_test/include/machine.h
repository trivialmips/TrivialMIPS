#ifndef __MACHINE_H_
#define __MACHINE_H_
#define COM1_BASE_ADDR  0xbfe40000
#define CONS_BAUD 115200

#define LED_ADDR                0xA6000008
#define LED_RG0_ADDR            0xA600000C // empty address
#define LED_RG1_ADDR            0xA6000010 // empty address
#define NUM_ADDR                0xA6000004 // write to 7-segment display, but not decoded

#endif
