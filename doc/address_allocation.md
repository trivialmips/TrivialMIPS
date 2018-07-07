# Address Space Allocation  

This document describes the allocation and mapping of virtual address space of `TrivialMIPS`.

## Segments in MIPS Specification

This section describes the allocation of virtual addresses, which complies the MIPS32 specification.

| Segment | Virtual Address           | Physical Address           | Description     |
| ------- | ------------------------- | -------------------------- | --------------- |
| kuseg   | `0x00000000`-`0x7FFFFFFF` | From TLB                   | User Mapped     |
| kseg0   | `0x80000000`-`0x9FFFFFFF` | `0x00000000`-`0x1FFFFFFFF` | Kernel Unmapped |
| kseg1   | `0xA0000000`-`0xBFFFFFFF` | N/A                        | Unmapped MMIO   |
| kseg2   | `0xC0000000`-`0xFFFFFFFF` | From TLB                   | Kernel Mapped   |

## Physical Address Allocation

This section describes the allocation of physical addresses that used in instruction and data buses. For the convenience of decoding and dispatching IO requests, every device get 16 MB of address space, while they may use only part of them. The detailed behavior of peripherals are elaborated in related documentation.

| Name     | Start        | End          | Size  | Valid Data Size   |
| -------- | ------------ | ------------ | ----- | ----------------- |
| RAM      | `0x00000000` | `0x00FFFFFF` | 16 MB | First 8 MB        |
| Flash    | `0x01000000` | `0x01FFFFFF` | 16 MB | First 8 MB        |
| Bootrom  | `0x02000000` | `0x02FFFFFF` | 16 MB | First 4KB         |
| Graphics | `0x03000000` | `0x03FFFFFF` | 16 MB | First 240004 Byte |
| UART     | `0x04000000` | `0x04FFFFFF` | 16 MB | First 2 Addresses |
| Timer    | `0x05000000` | `0x05FFFFFF` | 16 MB | First 1 Addresses |
| Ethernet | `0x06000000` | `0x06FFFFFF` | 16 MB | First 2 Addresses |
| GPIO     | `0x07000000` | `0x07FFFFFF` | 16 MB | First 2 Addresses |

## MMIO Address Mapping

This section describes the allocation of virtual addresses in `kseg1` segment, which is NOT mapped and NOT cached. They are mapped directly and linearly to physical address from `0x03000000` to `0x07FFFFFF`.

| Name     | Start        | End          | Mapped Start | Mapped End   |
| -------- | ------------ | ------------ | ------------ | ------------ |
| Graphics | `0xA3000000` | `0xA3FFFFFF` | `0x03000000` | `0x03FFFFFF` |
| UART     | `0xA4000000` | `0xA4FFFFFF` | `0x04000000` | `0x04FFFFFF` |
| Timer    | `0xA5000000` | `0xA5FFFFFF` | `0x05000000` | `0x05FFFFFF` |
| Ethernet | `0xA6000000` | `0xA6FFFFFF` | `0x06000000` | `0x06FFFFFF` |
| GPIO     | `0xA7000000` | `0xA7FFFFFF` | `0x07000000` | `0x07FFFFFF` |

