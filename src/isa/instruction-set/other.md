# Other Instructions

This category includes control flow and miscellaneous instructions.

### NOP
Does nothing for one cycle.
- **Opcode:** `0000`
- **Formats:** `NONE`

### HALT
Suspends instruction execution until an external event occurs.
- **Opcode:** `0001`
- **Formats:** `NONE`
- **Operation:** The CPU stops fetching and executing new instructions and enters a standby state.
- **Resumption:** Execution remains suspended until the processor receives a hardware reset or an external interrupt. 
- **Note:** In the current emulator implementation, this is used as a debug trap that performs a register dump and exits, but the architectural intent is a controlled wait state.
