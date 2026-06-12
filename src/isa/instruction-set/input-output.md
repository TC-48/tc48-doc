# Input/Output Instructions

TC-48 I/O instructions allow for communication with hardware devices via the [Port-Mapped I/O (PMIO)](../../io/pmio.md) system.
All I/O operations use a base-plus-offset addressing mode.

## Addressing Mode

Effective port addresses are calculated by adding a **Base Register** and an **Offset**:
\\[ \text{Effective Port} = \text{Base} + \text{SignExtend}(\text{Offset}) \\]

- **Base Register:** Always treated as a full 48-trit Word.
- **Offset:** Can be a register or an immediate value. In I/O operations, the
              offset is **always treated as a full 48-trit Word** for the port calculation.
- **Port Space:** The effective port is calculated using 48-trit modular arithmetic.

## Instructions

### IN
Reads a value from an I/O port into a register.
- **Opcode:** `0120`
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = Port[base + offset]`
- **Flags:**
    - **STAT (1):** Updates S (status) based on the read value.
    - **FULL (2):** Same as STAT.

### OUT
Writes a value from a register to an I/O port.
- **Opcode:** `0121`
- **Formats:** `RRR`, `RRI`
- **Operation:** `Port[base + offset] = src`
- **Flags:** I/O writes do not update status flags.
