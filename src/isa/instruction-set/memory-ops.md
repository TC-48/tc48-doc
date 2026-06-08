# Memory Operations

TC-48 memory instructions allow for moving data between registers and the system memory.
All memory operations use a base-plus-offset addressing mode.

## Addressing Mode

Effective addresses are calculated by adding a **Base Register** and an **Offset**:
`Effective Address = Base + SignExtend(Offset)`

- **Base Register:** Always treated as a full 48-trit Word.
- **Offset:** Can be a register or an immediate value. In memory operations, the offset is **always treated as a full 48-trit Word** for the address calculation.
- **Address Space:** The effective address is calculated using 48-trit modular arithmetic.

## Instructions

### LOAD
Loads a value from memory into a register.
- **Opcode:** `0122`
- **Formats:** `RRR`, `RRA`
- **Operation:** `dst = Memory[base + offset]`
- **Flags:**
    - **STAT (1):** Updates S (status) based on the loaded value.
    - **FULL (2):** Same as STAT.

### STORE
Stores a value from a register into memory.
- **Opcode:** `0200`
- **Formats:** `RRR`, `RRA`
- **Operation:** `Memory[base + offset] = src`
- **Flags:** Memory stores do not update status flags.

