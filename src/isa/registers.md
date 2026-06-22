# Registers
The TC-48 CPU utilizes a register-based architecture with 48-trit wide registers.
The register file provides high-speed storage for operands and state, organized into
Special Purpose Registers (SPR), Reserved Registers (RR), and General Purpose Registers (GPR).

## Register Addressing
Registers are identified by a **Register ID**, which consists of a **Base** index and a **Lane** offset.

### Base (4 trits)
Selects the specific register in the file.
A 4-trit index allows for up to 81 possible registers \\([0, 80]\\),
with 59 currently defined in the TC-48 architecture.

### Lane (2 trits)
Selects a sub-division within the 48-trit register. TC-48 uses **Big-Endian** lane ordering,
meaning **Lane 0** corresponds to the most significant part of the register.

The valid lane range depends on the data width of the instruction:

| Width   | Lanes | Range | Description                     |
|:--------|:------|:------|:--------------------------------|
| Tryte   | 8     | 0 - 7 | Trits \\(6L\\) to \\(6L+5\\)    |
| Quarter | 4     | 0 - 3 | Trits \\(12L\\) to \\(12L+11\\) |
| Half    | 2     | 0 - 1 | Trits \\(24L\\) to \\(24L+23\\) |
| Word    | 1     | 0     | Full 48-trit register           |

#### Out-of-Range Lane Access
If an instruction specifies a lane that is out of range for the current data width (e.g., accessing Lane 7 for a Half width)
, the behavior is **undefined**. The CPU may wrap the lane index using a modulo operation (e.g., `L % 2` for halves), but software should not rely on this behavior.

## Register Map
The register file contains 59 active registers.

| Index (Dec) | Mnemonic   | Name                      | Description                                    |
|:------------|:-----------|:--------------------------|:-----------------------------------------------|
| 0           | `az`       | Always Zero               | Constant zero. Writes are ignored.             |
| 1           | `cf`       | Current Flags             | CPU status and arithmetic flags.               |
| 2           | `ip`       | Instruction Pointer       | Address of the next instruction to execute.    |
| 3           | `sp`       | Stack Pointer             | Address of the current top of the stack.       |
| 4 - 26      | -          | Reserved                  | Reserved for future architectural expansion.   |
| 27 - 58     | `r0`-`r31` | General Purpose Registers | 32 registers for computation and data storage. |

### Special Purpose Registers (SPR)

| Register | Name                | Index          | Primary Function                                     |
|:---------|:--------------------|:---------------|:-----------------------------------------------------|
| **`az`** | Always Zero         | \\(0000_{3}\\) | Hardwired to zero; discards writes.                  |
| **`cf`** | Current Flags       | \\(0001_{3}\\) | Stores processor status flags for conditional logic. |
| **`ip`** | Instruction Pointer | \\(0002_{3}\\) | Holds the memory address of the next instruction.    |
| **`sp`** | Stack Pointer       | \\(0010_{3}\\) | Holds the memory address of the top of the stack.    |

#### `az` (Always Zero)
* **Index:** \\(0000_{3} = 0_{10}\\)
* **Behavior:** Hardwired to zero. Reads always return all trits `0`; writes are silently discarded.
* **Usage:** Used to provide a zero operand for arithmetic or to discard instruction results by setting it as the destination.

#### `cf` (Current Flags)
* **Index:** \\(0001_{3} = 1_{10}\\)
* **Behavior:** Stores the processor's status flags, which are updated by arithmetic, logic, and comparison instructions.
* **Usage:** Used by conditional predicates to control program flow. See [Status Flags](flags.md) for the internal layout.

#### `ip` (Instruction Pointer)
* **Index:** \\(0002_{3} = 2_{10}\\)
* **Behavior:** Holds the memory address of the next instruction to be fetched and executed. Automatically increments during processing.
* **Control Flow:** Since TC-48 lacks dedicated `JMP` or `CALL` instructions, jumps are achieved by directly modifying `ip`.

> **Example:** To jump to the address \\(2FQ183_{27}\\), you modify the register directly:
> ```asm
> add.48 rip, raz, 0s2FQ183
> ```

#### `sp` (Stack Pointer)
* **Index:** \\(0010_{3} = 3_{10}\\)
* **Behavior:** Holds the memory address of the current top of the stack.
* **Usage:** Used for temporary data storage, saving return addresses during function calls, and allocating local variables.

---

### General Purpose Registers (GPR)

The architecture provides **32 general-purpose registers** reserved for general computation.

* **Index Range:** \\([1000_{3} = 27_{10}, 2011_{3} = 58_{10}]\\) (GPR Base is 27)
* **Assembly Notation:** `r0` through `r31`

| Assembly Alias | Hardware Index           |
|:---------------|:-------------------------|
| `r0`           | \\(1000_{3} = 27_{10}\\) |
| `r1`           | \\(1001_{3} = 28_{10}\\) |
| `...`          | `...`                    |
| `r31`          | \\(2011_{3} = 58_{10}\\) |
