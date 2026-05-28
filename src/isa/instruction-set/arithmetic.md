# Arithmetic Instructions

TC-48 currently supports integer arithmetic operations across multiple widths.
These operations can update status flags (S, V, C) depending on the `WCFR` field in the instruction header. Floating-point operations are not currently supported.

## Addition and Subtraction

### ADD
Performs integer addition of two operands.
- **Opcode:** `0022`
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 + src2`
- **Flags:** Updates S (status), C (carry), and V (overflow).

### SUB
Performs integer subtraction of two operands.
- **Opcode:** `0100`
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 - src2`
- **Flags:** Updates S (status), C (borrow), and V (overflow).

## Multiplication and Division

### UMUL
Performs unsigned integer multiplication.
- **Opcode:** `0101`
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 * src2`
- **Flags:** Updates S (status) and C (carry).

### UDIV
Performs unsigned integer division.
- **Opcode:** `0102`
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 / src2`
- **Division by Zero:** If the divisor is zero, the result is zero.
- **Flags:** Updates S (status).

### SMUL
Performs signed integer multiplication.
- **Opcode:** `0110`
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 * src2`
- **Flags:** Updates S (status) and V (overflow).

### SDIV
Performs signed integer division.
- **Opcode:** `0111`
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 / src2`
- **Division by Zero:** If the divisor is zero, the result is zero.
- **Flags:** Updates S (status).
