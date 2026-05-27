# Instruction Encoding

TC-48 instructions use a variable-length encoding scheme.
Every instruction starts with a quarter-word header that defines the format, operand width, execution conditions, and the opcode.

## Instruction Header

The header is a 12-trit quarter-word, structured as follows:

| Trits | Width      | Field  | Description                         |
|-------|------------|--------|-------------------------------------|
| 0–1   | doublet    | Format | Instruction format (R, I, RR, etc.) |
| 2–3   | doublet    | Width  | Width of immediate operands         |
| 4     | trit       | WCFR   | Write CF Register switch            |
| 5–7   | triplet    | Pred   | Execution Predicate                 |
| 8–11  | quadruplet | Opcode | Instruction Opcode                  |

### Format (2 trits)

The format field determines how many registers and immediates follow the header.

| Value | Name | Operands    | Description                      |
|-------|------|-------------|----------------------------------|
| 00    | NONE | None        | No additional operands.          |
| 01    | R    | r1          | Single register operand.         |
| 02    | I    | imm         | Single immediate operand.        |
| 10    | RR   | r1, r2      | Two register operands.           |
| 11    | RRR  | r1, r2, r3  | Three register operands.         |
| 12    | RI   | r1, imm     | One register and one immediate.  |
| 20    | RRI  | r1, r2, imm | Two registers and one immediate. |

### Width (2 trits)

The width field specifies the size of registers and immediate operands in the instruction.

| Value | Width | Type    |
|-------|-------|---------|
| 00    | 6     | Tryte   |
| 01    | 12    | Quarter |
| 02    | 24    | Half    |
| 10    | 48    | Word    |

### WCFR (1 trit)

The Write Current Flags Register (WCFR) trit controls whether the instruction updates the status flags.

| Value | Name  | Description                   |
|-------|-------|-------------------------------|
| 0     | NONE  | No flags are updated          |
| 1     | STAT  | Update S (status) flag        |
| 2     | FULL  | Update all flags (S, C, V)    |

### Predicate (3 trits)

The predicate field allows for conditional execution of every instruction.

| Value | Name | Condition                           |
|-------|------|-------------------------------------|
| 000   | AW   | Always                              |
| 001   | EQ   | Equal (S == 0)                      |
| 002   | NE   | Not Equal (S != 0)                  |
| 010   | LT   | Less Than (S == 2)                  |
| 011   | GT   | Greater Than (S == 1)               |
| 012   | LE   | Less or Equal (S == 0 or S == 2)    |
| 020   | GE   | Greater or Equal (S == 0 or S == 1) |
| 021   | ZR   | Zero (S == 0)                       |
| 022   | NZ   | Non-Zero (S != 0)                   |
| 100   | CS   | Carry Set (C == 1)                  |
| 101   | CC   | Carry Clear (C != 1)                |
| 102   | BS   | Borrow Set (C == 2)                 |
| 110   | BC   | Borrow Clear (C != 2)               |
| 111   | VS   | Overflow Set (V != 0)               |
| 112   | VP   | Overflow Positive (V == 1)          |
| 120   | VN   | Overflow Negative (V == 2)          |
| 121   | VC   | Overflow Clear (V == 0)             |

## Register Encoding

Registers are encoded using one tryte (6 trits):

| Trits | Width      | Field | Description         |
|-------|------------|-------|---------------------|
| 0–3   | quadruplet | Base  | Register base ID    |
| 4–5   | doublet    | Lane  | Register lane (0–8) |

## Immediate Encoding

Immediate values follow the header (and any registers) and their size is determined by the [Width](#width-2-trits) field in the instruction header.
They are encoded as standard Big-Endian ternary values.
