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
- **Formats:** `RRR`, `RRA`
    - `RRR`: dst = r0, base = r1, offset = r2
    - `RRA`: dst = r0, base = r1, offset = addr
- **Operation:**
  \\[ \text{dst} = \text{Port}[\text{base} + \text{offset}] \\]
- **Flags:**
    - **STAT (1):** Updates S (status) based on the read value.
    - **FULL (2):** Same as STAT.

### OUT
Writes a value from a register or an immediate to an I/O port.

- **Opcode:** `0121`
- **Formats:** `RRR`, `RRA`, `IRR`
    - `RRR`: src = r0, base = r1, offset = r2
    - `RRA`: src = r0, base = r1, offset = addr
    - `IRR`: src = imm, base = r0, offset = r1
- **Operation:**
    - For `RRR`, `RRI`:
      \\[ \text{Port}[\text{base} + \text{offset}] = \text{src} \\]
    - For `IRR`:
      \\[ \text{Port}[\text{r1} + \text{r2}] = \text{imm} \\]
- **Flags:** I/O writes do not update status flags.

## Auto-Increment/Decrement Instructions

The decrement-input and increment-output instructions automatically adjust their pointer register by the operand width size in trytes:
- **Width 6 trits:** 1 tryte
- **Width 12 trits:** 2 trytes
- **Width 24 trits:** 4 trytes
- **Width 48 trits:** 8 trytes

### DIN
Decrement and Input: Decrements the port pointer register by the tryte width first, then reads a value from the port into the destination register.

- **Opcode:** `0201`
- **Formats:** `RR`
    ptr = r1, dst = r0
- **Operation:**
  \\[ \text{ptr} = \text{ptr} - \text{TryteWidth} \\]
  \\[ \text{dst} = \text{Port}[\text{ptr}] \\]
- **Flags:**
    - **STAT (1):** Updates S (status) based on the read value.
    - **FULL (2):** Same as STAT.

### IOUT
Increment and Output: Writes a value from a register or immediate to the port, then increments the port pointer register by the tryte width.

- **Opcode:** `0202`
- **Formats:** `RR`, `IR`
    - `RR`: ptr = r1, src = r0
    - `IR`: ptr = r0, src = imm
- **Operation:**
  \\[ \text{Port}[\text{ptr}] = \text{src} \\]
  \\[ \text{ptr} = \text{ptr} + \text{TryteWidth} \\]
- **Flags:** Increment outputs do not update status flags.
