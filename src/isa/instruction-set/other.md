# Other Instructions

This category includes control flow and miscellaneous instructions.

### NOP (No Operation)
Does nothing for one cycle.
- **Formats:** `NONE`

### HALT (Halt)
Suspends instruction execution until an external event occurs.
- **Formats:** `NONE`
- **Operation:** The CPU stops fetching and executing new instructions and enters a standby state.
- **Resumption:** Execution remains suspended until the processor receives a hardware reset or an external interrupt. 
- **Note:** In the current emulator implementation, this is used as a debug trap that performs a register dump and exits, but the architectural intent is a controlled wait state.
