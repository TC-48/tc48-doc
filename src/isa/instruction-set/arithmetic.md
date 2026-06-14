# Arithmetic Instructions

TC-48 currently supports integer arithmetic operations across multiple widths.
These operations can update status flags (S, V, C) depending on the `WCFR` field in the instruction header. Floating-point operations are not currently supported.

## Addition and Subtraction

### ADD
Performs integer addition of two operands.

- **Opcode:** `0022`
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 + src2`
- **Flags:**
    - **STAT (1):** Updates S (status).
    - **FULL (2):** Updates S, C (carry), and V (overflow).

### SUB
Performs integer subtraction of two operands.

- **Opcode:** `0100`
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 - src2`
- **Flags:**
    - **STAT (1):** Updates S (status).
    - **FULL (2):** Updates S, C (borrow), and V (overflow).

### NEG
Performs signed integer negation.

- **Opcode**: `0101`
- **Formats:** `RR`, `RI`
- **Operation:** `dst = -src`
- **Flags:** Updates S (status) if WCFR is **STAT** or **FULL**.

## Multiplication and Division

### UMUL
Performs unsigned integer multiplication.

- **Opcode:** `0102`
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 * src2`
- **Flags:**
    - **STAT (1):** Updates S (status).
    - **FULL (2):** Updates S and C (carry).

### UDIV
Performs unsigned integer division.

- **Opcode:** `0110`
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 / src2`
- **Division by Zero:** If the divisor is zero, the result is zero.
- **Flags:** Updates S (status) if WCFR is **STAT** or **FULL**.

### SMUL
Performs signed integer multiplication.

- **Opcode:** `0111`
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 * src2`
- **Flags:**
    - **STAT (1):** Updates S (status).
    - **FULL (2):** Updates S and V (overflow).

### SDIV
Performs signed integer division.

- **Opcode:** `0112`
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 / src2`
- **Division by Zero:** If the divisor is zero, the result is zero.
- **Flags:** Updates S (status) if WCFR is **STAT** or **FULL**.
