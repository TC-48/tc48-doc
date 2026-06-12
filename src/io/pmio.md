# Port-Mapped I/O (PMIO)

TC-48 uses a Port-Mapped I/O (PMIO) model for communication with hardware devices. This is distinct from the memory address space, although it uses similar instructions and addressing modes.

## I/O Address Space

The PMIO address space consists of \\( 3^{48} \\) ports, addressed by a 48-trit Word. Each port can be accessed with different widths (\\(6, 12, 24, \text{ or } 48 \text{ trits}\\)).

Unlike memory, where every address corresponds to a storage location, I/O ports are mapped to hardware devices. Reading or writing to a port triggers a callback in the associated device.

## Addressing Mode

I/O operations use the same base-plus-offset addressing mode as memory operations:
\\[ \text{Effective Port} = \text{Base} + \text{SignExtend}(\text{Offset}) \\]

- **Base Register:** Always treated as a full 48-trit Word.
- **Offset:** Can be a register or an immediate value. The offset is **always treated as a full 48-trit Word** for the port calculation.
- **Port Space:** The effective port is calculated using 48-trit modular arithmetic.

## Device Mapping

A hardware device in a TC-48 system is assigned:
- A **Base Port**: The starting address in the I/O space.
- A **Port Count**: The number of contiguous ports the device occupies.

When an `IN` or `OUT` instruction is executed, the system bus searches for a device whose range \\( [\text{Base}, \text{Base} + \text{Count}) \\) includes the effective port. If found, the operation is forwarded to the device with a relative offset:
\\[ \text{Relative Offset} = \text{Effective Port} - \text{Device Base Port} \\]

If no device is mapped to the requested port, reads return 0 and writes are ignored.

## Widths

Devices can handle different widths of data. The instruction width (\\(6, 12, 24, \text{ or } 48 \text{ trits}\\)) is passed to the device, allowing it to behave differently based on the access size if necessary.
