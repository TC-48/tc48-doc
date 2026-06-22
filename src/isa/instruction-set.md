# Instruction Set

## Opcodes
| opcode         | mnemonic                                       | short description             |
|----------------|------------------------------------------------|------------------------------:|
| \\(0000_{3}\\) | [NOP](instruction-set/other.md#nop)            | No operation.                 |
| \\(0001_{3}\\) | [HALT](instruction-set/other.md#halt)          | Suspend execution.            |
| \\(0002_{3}\\) | [MIN](instruction-set/trit-wise.md#min)        | Trit-wise minimum.            |
| \\(0010_{3}\\) | [MAX](instruction-set/trit-wise.md#max)        | Trit-wise maximum.            |
| \\(0011_{3}\\) | [ROT](instruction-set/trit-wise.md#rot)        | Trit-wise rotation.           |
| \\(0012_{3}\\) | [SHL](instruction-set/trit-wise.md#shl)        | Shift left.                   |
| \\(0020_{3}\\) | [SHR](instruction-set/trit-wise.md#shr)        | Shift right.                  |
| \\(0021_{3}\\) | [NOT](instruction-set/trit-wise.md#not)        | Trit-wise inversion.          |
| \\(0022_{3}\\) | [ADD](instruction-set/arithmetic.md#add)       | Integer addition.             |
| \\(0100_{3}\\) | [SUB](instruction-set/arithmetic.md#sub)       | Integer subtraction.          |
| \\(0101_{3}\\) | [NEG](instruction-set/arithmetic.md#neg)       | Signed integer negation.      |
| \\(0102_{3}\\) | [UMUL](instruction-set/arithmetic.md#umul)     | Unsigned multiplication.      |
| \\(0110_{3}\\) | [UDIV](instruction-set/arithmetic.md#udiv)     | Unsigned division.            |
| \\(0111_{3}\\) | [SMUL](instruction-set/arithmetic.md#smul)     | Signed multiplication.        |
| \\(0112_{3}\\) | [SDIV](instruction-set/arithmetic.md#sdiv)     | Signed division.              |
| \\(0120_{3}\\) | [IN](instruction-set/input-output.md#in)       | Input from port.              |
| \\(0121_{3}\\) | [OUT](instruction-set/input-output.md#out)     | Output to port.               |
| \\(0122_{3}\\) | [LOAD](instruction-set/memory-ops.md#load)     | Load from memory.             |
| \\(0200_{3}\\) | [STORE](instruction-set/memory-ops.md#store)   | Store to memory.              |
| \\(0201_{3}\\) | [DIN](instruction-set/input-output.md#din)     | Decrement & input from port.  |
| \\(0202_{3}\\) | [IOUT](instruction-set/input-output.md#iout)   | Increment & Output to port.   |
| \\(0210_{3}\\) | [DLOAD](instruction-set/memory-ops.md#dload)   | Decrement & load from memory. |
| \\(0211_{3}\\) | [ISTORE](instruction-set/memory-ops.md#istore) | Increment & store to memory.  |

## Descriptions
- [Arithmetic Operations](instruction-set/arithmetic.md)
- [Trit-Wise Operations](instruction-set/trit-wise.md)
- [Memory Operations](instruction-set/memory-ops.md)
- [Input/Output Operations](instruction-set/input-output.md)
- [Other Operations](instruction-set/other.md)

