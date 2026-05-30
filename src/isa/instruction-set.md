# Instruction Set

## Opcodes
| opcode | mnemonic                                     | short description        |
|--------|----------------------------------------------|--------------------------|
| 0000   | [NOP](instruction-set/other.md#nop)          | No operation.            |
| 0001   | [HALT](instruction-set/other.md#halt)        | Suspend execution.       |
| 0002   | [MIN](instruction-set/trit-wise.md#min)      | Trit-wise minimum.       |
| 0010   | [MAX](instruction-set/trit-wise.md#max)      | Trit-wise maximum.       |
| 0011   | [ROT](instruction-set/trit-wise.md#rot)      | Trit-wise rotation.      |
| 0012   | [SHL](instruction-set/trit-wise.md#shl)      | Shift left.              |
| 0020   | [SHR](instruction-set/trit-wise.md#shr)      | Shift right.             |
| 0021   | [NOT](instruction-set/trit-wise.md#not)      | Trit-wise inversion.     |
| 0022   | [ADD](instruction-set/arithmetic.md#add)     | Integer addition.        |
| 0100   | [SUB](instruction-set/arithmetic.md#sub)     | Integer subtraction.     |
| 0101   | [NEG](instruction-set/arithmetic.md#neg)     | Signed integer negation. |
| 0102   | [UMUL](instruction-set/arithmetic.md#umul)   | Unsigned multiplication. |
| 0110   | [UDIV](instruction-set/arithmetic.md#udiv)   | Unsigned division.       |
| 0111   | [SMUL](instruction-set/arithmetic.md#smul)   | Signed multiplication.   |
| 0112   | [SDIV](instruction-set/arithmetic.md#sdiv)   | Signed division.         |
| 0120   | [IN](instruction-set/input-output.md#in)     | Input from port.         |
| 0121   | [OUT](instruction-set/input-output.md#out)   | Output to port.          |
| 0122   | [LOAD](instruction-set/memory-ops.md#load)   | Load from memory.        |
| 0200   | [STORE](instruction-set/memory-ops.md#store) | Store to memory.         |

## Descriptions
- [Arithmetic Operations](instruction-set/arithmetic.md)
- [Trit-Wise Operations](instruction-set/trit-wise.md)
- [Memory Operations](instruction-set/memory-ops.md)
- [Input/Output Operations](instruction-set/input-output.md)
- [Other Operations](instruction-set/other.md)

