# Trit-wise Instructions

Trit-wise instructions perform operations on individual trits of the operands.

## Logical Operations

### MIN
Performs a trit-wise minimum operation (equivalent to AND in binary logic).
- **Opcode:** `0002`
- **Formats:** `RRR`, `RRI`
- **Operation:** For each trit `i`, `dst[i] = min(src1[i], src2[i])`

### MAX
Performs a trit-wise maximum operation (equivalent to OR in binary logic).
- **Opcode:** `0010`
- **Formats:** `RRR`, `RRI`
- **Operation:** For each trit `i`, `dst[i] = max(src1[i], src2[i])`

### ROT
Performs trit-wise addition modulo 3 (also known as a trit-wise rotation).
- **Opcode:** `0011`
- **Formats:** `RRR`, `RRI`
- **Operation:** For each trit `i`, `dst[i] = (src1[i] + src2[i]) mod 3`

### NOT
Performs a trit-wise inversion.
- **Opcode:** `0021`
- **Formats:** `RR`, `RI`
- **Operation:** For each trit `i`, `dst[i] = 2 - src[i]`

## Shift Operations

### SHL
Shifts the first operand left by the number of trits specified by the second operand.
- **Opcode:** `0012`
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 << src2`

### SHR
Shifts the first operand right by the number of trits specified by the second operand.
- **Opcode:** `0020`
- **Formats:** `RRR`, `RRI`
- **Operation:** `dst = src1 >> src2`
