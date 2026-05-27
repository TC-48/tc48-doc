# Trit-wise Instructions

Trit-wise instructions perform operations on individual trits of the operands.

## Logical Operations

### MIN (Minimum)
Performs a trit-wise minimum operation (equivalent to AND in binary logic).
- **Formats:** `RRR`, `RRI`
- **Operation:** For each trit `i`, `dst[i] = min(src1[i], src2[i])`

### MAX (Maximum)
Performs a trit-wise maximum operation (equivalent to OR in binary logic).
- **Formats:** `RRR`, `RRI`
- **Operation:** For each trit `i`, `dst[i] = max(src1[i], src2[i])`

### NOT (Inversion)
Performs a trit-wise inversion.
- **Formats:** `RR`, `RI`
- **Operation:** For each trit `i`, `dst[i] = 2 - src[i]`

### ROT (Rotate/Add)
Performs trit-wise addition modulo 3 (also known as a trit-wise rotation).
- **Formats:** `RRR`, `RRI`
- **Operation:** For each trit `i`, `dst[i] = (src1[i] + src2[i]) mod 3`

## Shift Operations

### SHL (Shift Left)
Shifts the first operand left by the number of trits specified by the second operand.
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 << src2`

### SHR (Shift Right)
Shifts the first operand right by the number of trits specified by the second operand.
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 >> src2`
