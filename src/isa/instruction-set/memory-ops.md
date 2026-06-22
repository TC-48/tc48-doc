# Memory Operations

TC-48 memory instructions allow for moving data between registers and the system memory.
All memory operations use a base-plus-offset addressing mode.

## Addressing Mode

Effective addresses are calculated by adding a **Base Register** and an **Offset**:
\\[ \text{Effective Address} = \text{Base} + \text{SignExtend}(\text{Offset}) \\]

- **Base Register:** Always treated as a full 48-trit Word.
- **Offset:** Can be a register or an immediate value. In memory operations, the offset is **always treated as a full 48-trit Word** for the address calculation.
- **Address Space:** The effective address is calculated using 48-trit modular arithmetic.

## Instructions

### LOAD
Loads a value from memory into a register.

- **Opcode:** `0122`
- **Formats:** `RRR`, `RRA`
    - `RRR`: dst = r0, base = r1, offset = r2
    - `RRA`: dst = r0, base = r1, offset = addr
- **Operation:**
  \\[ \text{dst} = \text{Memory}[\text{base} + \text{offset}] \\]
- **Flags:**
    - **STAT (1):** Updates S (status) based on the loaded value.
    - **FULL (2):** Same as STAT.

### STORE
Stores a value from a register or an immediate into memory.

- **Opcode:** `0200`
- **Formats:** `RRR`, `RRA`, `IRR`
    - `RRR`: src = r0, base = r1, offset = r2
    - `RRA`: src = r0, base = r1, offset = addr
    - `IRR`: src = imm, base = r0, offset = r1
- **Operation:**
      \\[ \text{Memory}[\text{base} + \text{offset}] = \text{src} \\]
- **Flags:** Memory stores do not update status flags.

## Auto-Increment/Decrement Instructions

The decrement-load and increment-store instructions automatically
adjust their pointer register by the operand width size in trytes:
- **Width 6 trits:**  1 tryte
- **Width 12 trits:** 2 trytes
- **Width 24 trits:** 4 trytes
- **Width 48 trits:** 8 trytes

### DLOAD
Decrement and Load: Decrements the pointer register by the tryte width first, then loads a value from memory into the destination register.

- **Opcode:** `0210`
- **Formats:** `RR`
    ptr = r1, dst = r0
- **Operation:**
  \\[ \text{ptr} = \text{ptr} - \text{TryteWidth} \\]
  \\[ \text{dst} = \text{Memory}[\text{ptr}] \\]
- **Flags:**
    - **STAT (1):** Updates S (status) based on the loaded value.
    - **FULL (2):** Same as STAT.

### ISTORE
Increment and Store: Stores a value from a register or immediate to memory, then increments the pointer register by the tryte width.

- **Opcode:** `0211`
- **Formats:** `RR`, `IR`
    - `RR`: ptr = r1, src = r0
    - `IR`: ptr = r0, src = imm
- **Operation:**
  \\[ \text{Memory}[\text{ptr}] = \text{src} \\]
  \\[ \text{ptr} = \text{ptr} + \text{TryteWidth} \\]
- **Flags:** Increment stores do not update status flags.

