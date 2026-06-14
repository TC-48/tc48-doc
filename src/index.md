# Introduction

## Overview
TC-48 is an experimental unbalanced ternary, 48-trit, big-endian CPU architecture
created to explore ternary computing, a relatively uncommon area of
computer architecture research now.

There is no (and there most likely never will be) any physical TC-48 chip,
but we have a fully functional emulator: [tc48-emu](https://github.com/TC-48/tc48-emu).

## Architecture Philosophy
Unlike most common architectures, the TC-48 is ternary rather than binary. This means it represents data using trits instead of bits.
A single trit represents a value in the range of 0 to 2.

The TC-48 instruction set is intentionally minimal yet fully functional.

## Terminology and Conventions

- **trit**: A single ternary (base-3) digit - \\(\left\\{0, 1, 2\right\\}\\).
- **doublet**: Two trits; not addressable, but used in instruction representation, since they are trit-packed.
- **triplet**: Three trits; not addressable, but used in instruction representation.
- **quadruplet**: Four trits; not addressable, but used in instruction representation.

- **tryte**: The minimum addressable unit - **6 trits**.
- **quarter**: One-quarter of a word (two trytes) - **12 trits**.
- **half**: Half of a word (four trytes) - **24 trits**.
- **word**: The full machine word - **48 trits**.

- **MST**: Most significant trit.
- **LST**: Least significant trit.

## Document Scope
This document defines
- [Register file](isa/registers.md)
- [Memory model](memory/model.md)
- [Instruction set](isa/instruction-set.md)
- [Instruction encoding](isa/instruction-encoding.md)
<!-- TODO -->

## Reading Guide
<!-- TODO -->
