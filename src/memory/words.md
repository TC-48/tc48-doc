# Word Sizes

The TC-48 architecture defines several standard data widths based on the **tryte** (6 trits).

### Data Capacities
| Name        | Trits | Trytes | States (Total)                 |
|:------------|:-----:|:------:|:-------------------------------|
| **tryte**   |   6   |    1   | 729                            |
| **quarter** |   12  |    2   | 531,441                        |
| **half**    |   24  |    4   | 282,429,536,481                |
| **word**    |   48  |    8   | 79,766,443,076,872,509,863,361 |

### Integer Ranges
| Name        | Unsigned Range | Signed Range         |
|:------------|:---------------|:---------------------|
| **tryte**   | 0 .. 728       | -364 .. 364          |
| **quarter** | 0 .. 531,440   | -265,720 .. 265,720  |
| **half**    | 0 .. 2.82e11   | -1.41e11 .. 1.41e11  |
| **word**    | 0 .. 7.97e22   | -3.98e22 .. -3.98e22 |
