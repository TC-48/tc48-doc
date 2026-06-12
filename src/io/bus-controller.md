# Bus Controller

The Bus Controller is a mandatory system device that provides a mechanism for hardware discovery. Every TC-48 system **must** have a Bus Controller mapped to **Base Port 0**.

The Bus Controller allows software to enumerate all devices currently connected to the system bus.

## Port Mapping

The Bus Controller occupies 5 ports.

### Input Ports (IN)

| Offset | Name             | Description                                                   |
|--------|------------------|---------------------------------------------------------------|
| 0      | `device-count`   | Total number of devices connected to the bus.                 |
| 1      | `selected-index` | The index of the currently selected device for interrogation. |
| 2      | `selected-type`  | The unique `Type ID` of the selected device.                  |
| 3      | `selected-base`  | The `Base Port` address of the selected device.               |
| 4      | `selected-ports` | The number of ports occupied by the selected device.          |

### Output Ports (OUT)

| Offset | Name     | Description                                                            |
|--------|----------|------------------------------------------------------------------------|
| 0      | `select` | Sets the index of the device to interrogate (0 to `device-count - 1`). |

### Notes

> [!NOTE]
> The Bus Controller itself is included in the device list.

> [!WARNING]
> If an invalid index ($\ge$ `device-count`) is written to `select`,
> reading `selected-type`, `selected-base`, and `selected-ports` will return `0`.

> [!NOTE]
> On system reset, `selected-index` is automatically initialized to `0`.

## Discovery Procedure

To discover devices on the bus, a typical program would:

1. Read `device-count` from port 0.
2. For each index from 0 to \\(\text{device-count} - 1\\):
    - Write the index to port 0 (`select`).
    - Read `selected-type` (port 2), `selected-base` (port 3), and `selected-ports` (port 4).
    - Identify the device by its `Type ID` and record its address range.
