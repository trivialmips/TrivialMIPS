# Address Space Allocation  

This document describes the allocation and mapping of virtual address space of `TrivialMIPS`.

## Virtual Address Allocation in MIPS Specification

This section describes the allocation of virtual addresses, which complies the MIPS32 specification.

| Segment | Virtual Address           | Physical Address           | Description                |
| ------- | ------------------------- | -------------------------- | -------------------------- |
| kuseg   | `0x00000000`-`0x7FFFFFFF` | From TLB                   | User Mapped                |
| kseg0   | `0x80000000`-`0x9FFFFFFF` | `0x00000000`-`0x1FFFFFFFF` | Kernel Unmapped (Cached)   |
| kseg1   | `0xA0000000`-`0xBFFFFFFF` | N/A                        | Kernel Unmapped (Uncached) |
| kseg2   | `0xC0000000`-`0xFFFFFFFF` | From TLB                   | Kernel Mapped              |

## Physical Address Allocation

This section describes the allocation of physical addresses that used in instruction and data buses. For the convenience of decoding and dispatching IO requests, each device get 16 MB of address space, while they may use only part of them. The detailed behavior of peripherals are elaborated in related documentation.

| Name     | Start        | End          | Valid Data Size   | Type     |
| -------- | ------------ | ------------ | ----------------- | -------- |
| RAM      | `0x00000000` | `0x001FFFFF` | 8 MB              | Stroage  |
| Flash    | `0x01000000` | `0x013FFFFF` | 8 MB              | Stroage  |
| Graphics | `0x02000000` | `0x0203A980` | 240004 Bytes      | Hybrid*  |
| UART     | `0x03000000` | `0x03000004` | 2 Addresses       | Register |
| Timer    | `0x04000000` | `0x04000000` | 1 Address         | Register |
| Ethernet | `0x05000000` | `0x05000004` | 2 Addresses       | Register |
| GPIO     | `0x06000000` | `0x0600000C` | 3 Addresses       | Register |
| USB      | `0x07000000` | `0x07000004` | 2 Addresses       | Register |
| Bootrom  | `0x1FC00000` | `0x1FC003FF` | 4 KB              | Storage  |

All addresses are aligned in 4, a.k.a their last two bits must be zero, otherwise an 'Address Error' exception will be triggered. Any attempt to access addresses outside 'Valid Data Size' or write to an read-only address will cause an __UNPREDITABLE__ result. Please avoiding doing so.

### Storage

SRAM, flash and bootrom are storage devices, with only SRAM writable. SRAM and bootrom guarantees to give the result of a request for instruction on the next rising edge. The device controller will pull up the 'stall' signal on the bus until the operation it is processing can be done on the next rising edge.

Each address of SRAM stores a word, so the last valid address of RAM is `0x001FFFFF`. Each address of Flash stores a half-word (the higher 16 bits are invalid when writing and marked zero when reading), so its last valid address is `0x013FFFFF`. Bootrom ends at `0x1FC003FF`, with one word at one address.

The address and size of bootrom is special due to the hardcorded value `0xBFC00000` of register `PC` after reset, which will be mapped to `0x1FC00000`.

### Graphics

Graphics device is of type 'hybrid', because it consists of 480000 byte graphics memory (or 'framebuffer') from `0x02000000` to `0x0203A97F` (each address stores a word) and a configuration register at `0x0203A980`. Every pixel takes 4 bits in the memory, and will converted to the format of `{RED[2:0], GREEN[2:0], BLUE[1:0]}` when displayed, with the mapping hardcoded.

The configuration register, which can be both read and written, is used to indicate the offset of first pixel in the framebuffer, designed to be used in screen scrolling in the operating system.

### UART

The first register(`0x03000000`) is read-only, whose __last__ bit represents CTS (clear to send) signal, and second last one represents DR (data ready) signal.

The second register(`0x03000004`) can be read and written. When `CTS` is asserted, a writing operating sends one byte out of the UART port. When `DR` is asserted, a reading operation gets one byte that is received from the UART port. Only the lowest byte of one word is valid while writing, whether using `SW`, `SH` or `SB`.

The UART device will assert an external interruption when there is data coming.

### GPIO

The first register(`0x06000000`) of GPIO contains the status of switches and is read-only. The second(`0x06000004`) and the third(`0x06000008`) can be written, respectively changing the status of 7-segment displays and leds, whose higher 16-bits are always ignored, except the highest bit of `0x06000004` incicating whether to decode the lowest 8 bits of itself.

### Timer

The only register(`0x04000000`) of Timer contains an integer that automatically increases every 1ms. It can be used to meter the accurate executing time of some instructions, without being affected by the actual frequency of CPU. The register can be written and will be set to zero on hard-reset.

## Ethernet

T.B.D.

## USB

T.B.D.

## `kseg1` Address Mapping

This section describes the allocation of virtual addresses in `kseg1` segment, which is NOT mapped and NOT cached. They are mapped linearly to physical address from `0x00000000` to `0x1FFFFFFF`, by setting the highest 3 bits to 0. Some used mappings are listed below in the table. Please note that __NOT__ all addresses mapped are valid.

| Name     | Start        | End          | Mapped Start | Mapped End   |
| -------- | ------------ | ------------ | ------------ | ------------ |
| RAM      | `0xA0000000` | `0xA0FFFFFF` | `0x00000000` | `0x00FFFFFF` |
| Flash    | `0xA1000000` | `0xA1FFFFFF` | `0x01000000` | `0x01FFFFFF` |
| Graphics | `0xA2000000` | `0xA2FFFFFF` | `0x02000000` | `0x02FFFFFF` |
| UART     | `0xA3000000` | `0xA3FFFFFF` | `0x03000000` | `0x03FFFFFF` |
| Timer    | `0xA4000000` | `0xA4FFFFFF` | `0x04000000` | `0x04FFFFFF` |
| Ethernet | `0xA5000000` | `0xA5FFFFFF` | `0x05000000` | `0x05FFFFFF` |
| GPIO     | `0xA6000000` | `0xA6FFFFFF` | `0x06000000` | `0x06FFFFFF` |
| USB      | `0xA7000000` | `0xA7FFFFFF` | `0x07000000` | `0x07FFFFFF` |
| Bootrom  | `0xBFC00000` | `0xBFFFFFFF` | `0x1FC00000` | `0x1FFFFFFF` |
