# Status Flags

The TC-48 CPU uses status flags to track the results of arithmetic, logic, and comparison operations. These flags are stored in the **Most Significant Trits (MST)** of the `cf` (Current Flags) register.

## Flag Layout

Consistent with the architecture's Big-Endian indexing, **Trit 0** is the Most Significant Trit. Each flag occupies exactly one trit.

| Trit Index | Flag | Name     | Value Interpretations                                     |
|:-----------|:----:|:---------|:----------------------------------------------------------|
| 0          | `S`  | Sign     | `0`: Zero, `1`: Positive, `2`: Negative                   |
| 1          | `V`  | Overflow | `0`: None, `1`: Positive Overflow, `2`: Negative Overflow |
| 2          | `C`  | Carry    | `0`: None, `1`: Carry, `2`: Borrow                        |

### Sign Flag (`S`)
Indicates the signed result of the last operation relative to zero.

- **`0` (Zero)**: The result was exactly zero.
- **`1` (Positive)**: The result was greater than zero.
- **`2` (Negative)**: The result was less than zero.

### Overflow Flag (`V`)
Indicates if an operation resulted in an arithmetic overflow.

- **`0` (None)**: No overflow occurred.
- **`1` (Positive Overflow)**: The result exceeded the maximum positive value for the destination width.
- **`2` (Negative Overflow)**: The result was less than the minimum negative value for the destination width.

### Carry Flag (`C`)
Indicates if an operation resulted in a carry-out or a borrow.

- **`0` (None)**: No carry or borrow occurred.
- **`1` (Carry)**: An addition resulted in a carry.
- **`2` (Borrow)**: A subtraction required a borrow.

## Usage in Predicates
Flags are primarily used by the CPU to evaluate **Predicates**, allowing every instruction to be executed conditionally based on the current machine state. For more details on how these flags map to conditional execution, see [Instruction Encoding](instruction-encoding.md#predicate-3-trits).
