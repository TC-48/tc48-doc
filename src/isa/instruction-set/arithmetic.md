# Arithmetic Instructions (Integer)

TC-48 currently supports integer arithmetic operations across multiple widths. These operations can update status flags (S, V, C) depending on the `WCFR` field in the instruction header. Floating-point operations are not currently supported.

## Addition and Subtraction

### ADD (Addition)
Performs integer addition of two operands.
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 + src2`
- **Flags:** Updates S (status), C (carry), and V (overflow).

### SUB (Subtraction)
Performs integer subtraction of two operands.
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 - src2`
- **Flags:** Updates S (status), C (borrow), and V (overflow).

## Multiplication and Division

### UMUL (Unsigned Multiplication)
Performs unsigned integer multiplication.
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 * src2`
- **Flags:** Updates S (status) and C (carry).

### UDIV (Unsigned Division)
Performs unsigned integer division.
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 / src2`
- **Division by Zero:** If the divisor is zero, the result is zero.
- **Flags:** Updates S (status).

### SMUL (Signed Multiplication)
Performs signed (balanced ternary) integer multiplication.
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 * src2`
- **Flags:** Updates S (status) and V (overflow).

### SDIV (Signed Division)
Performs signed (balanced ternary) integer division.
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 / src2`
- **Division by Zero:** If the divisor is zero, the result is zero.
- **Flags:** Updates S (status).
