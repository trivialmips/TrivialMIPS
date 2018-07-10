# Address Space Allocation  

This document describes the allocation and mapping of virtual address space of `TrivialMIPS`.

## Segments in MIPS Specification

This section describes the allocation of virtual addresses, which complies the MIPS32 specification.

| Segment | Virtual Address           | Physical Address           | Description                |
| ------- | ------------------------- | -------------------------- | -------------------------- |
| kuseg   | `0x00000000`-`0x7FFFFFFF` | From TLB                   | User Mapped                |
| kseg0   | `0x80000000`-`0x9FFFFFFF` | `0x00000000`-`0x1FFFFFFFF` | Kernel Unmapped (Cached)   |
| kseg1   | `0xA0000000`-`0xBFFFFFFF` | N/A                        | Kernel Unmapped (Uncached) |
| kseg2   | `0xC0000000`-`0xFFFFFFFF` | From TLB                   | Kernel Mapped              |

## Physical Address Allocation

This section describes the allocation of physical addresses that used in instruction and data buses. For the convenience of decoding and dispatching IO requests, each device get 16 MB of address space, while they may use only part of them. The detailed behavior of peripherals are elaborated in related documentation.

| Name     | Start        | End          | Size  | Valid Data Size   | Type     |
| -------- | ------------ | ------------ | ----- | ----------------- | -------- |
| RAM      | `0x00000000` | `0x00FFFFFF` | 16 MB | First 8 MB        | Stroage  |
| Flash    | `0x01000000` | `0x01FFFFFF` | 16 MB | First 8 MB        | Stroage  |
| Graphics | `0x02000000` | `0x02FFFFFF` | 16 MB | First 240004 Byte | Hybrid*  |
| UART     | `0x03000000` | `0x03FFFFFF` | 16 MB | First 2 Addresses | Register |
| Timer    | `0x04000000` | `0x04FFFFFF` | 16 MB | First 1 Address   | Register |
| Ethernet | `0x05000000` | `0x05FFFFFF` | 16 MB | First 2 Addresses | Register |
| GPIO     | `0x06000000` | `0x06FFFFFF` | 16 MB | First 2 Addresses | Register |
| USB      | `0x07000000` | `0x07FFFFFF` | 16 MB | First 2 Addresses | Register |
| Bootrom  | `0x1FC00000` | `0x1FCFFFFF` |  4 MB | First 4KB         | Storage  |

The address and size of bootrom is special due to the hardcorded value `0xBFC00000` of register `PC` after reset, which will be mapped to `0x1FC00000`.

Graphics device is of type 'hybrid', because it consists of 240000 Byte Storage from `0x02000000` to `0x0203A97F` and a configuration register at `0x0203A980`.

## MMIO Address Mapping

This section describes the allocation of virtual addresses in `kseg1` segment, which is NOT mapped and NOT cached. They are mapped linearly to physical address from `0x02000000` to `0x07FFFFFF`, by setting the highest 3 bits to 0.

| Name     | Start        | End          | Mapped Start | Mapped End   |
| -------- | ------------ | ------------ | ------------ | ------------ |
| Graphics | `0xA2000000` | `0xA2FFFFFF` | `0x02000000` | `0x02FFFFFF` |
| UART     | `0xA3000000` | `0xA3FFFFFF` | `0x03000000` | `0x03FFFFFF` |
| Timer    | `0xA4000000` | `0xA4FFFFFF` | `0x04000000` | `0x04FFFFFF` |
| Ethernet | `0xA5000000` | `0xA5FFFFFF` | `0x05000000` | `0x05FFFFFF` |
| GPIO     | `0xA6000000` | `0xA6FFFFFF` | `0x06000000` | `0x06FFFFFF` |
| USB      | `0xA7000000` | `0xA7FFFFFF` | `0x07000000` | `0x07FFFFFF` |
| Bootrom  | `0xBFC00000` | `0xBFFFFFFF` | `0x1FC00000` | `0x1FCFFFFF` |
