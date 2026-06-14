# Signed Integers

TC-48 represents signed integers using **Three's Complement**, an unbalanced ternary complement system.
This allows standard arithmetic operations to work identically for both signed and unsigned values, much like Two's Complement in binary systems.

## The Midpoint Rule

In a ternary word of \\(N\\) trits, there are \\(V = 3^N\\) possible states.
TC-48 splits these states into positive and negative ranges based on a **Midpoint Threshold**.
\\[ T = (V-1)/2 \\]

- **Zero**: Unsigned value `0`.
- **Positive Range**: Unsigned values from `1` to \\(T\\).
- **Negative Range**: Unsigned values from \\(T+1\\) to \\(V-1\\).

### Range & Midpoint Reference

| Word Size      | Trits | Total States (\\(V\\)) | Midpoint (\\(T\\)) | Signed Range        |
|:---------------|:-----:|:-----------------------|:-------------------|:--------------------|
| **doublet**    |   2   | 9                      | 4                  | -4 .. 4             |
| **triplet**    |   3   | 27                     | 13                 | -13 .. 13           |
| **quadruplet** |   4   | 81                     | 40                 | -40 .. 40           |
| **tryte**      |   6   | 729                    | 364                | -364 .. 364         |
| **quarter**    |   12  | 531,441                | 265,720            | -265,720 .. 265,720 |
| **half**       |   24  | 282,429,536,481        | 141,214,768,240    | -1.41e11 .. 1.41e11 |
| **word**       |   48  | 7.97e22                | 3.98e22            | -3.98e22 .. 3.98e22 |

## Sign Detection and the MST

The **MST (Most Significant Trit)** is the leftmost trit in a word.
Because the midpoint \\(T\\) is always represented by a sequence of all `1`s,
the MST provides a fast way to check the sign:

-   **If MST is 0**: The value is always **positive or zero**.
-   **If MST is 2**: The value is always **negative**.
-   **If MST is 1**: The value could be positive or negative. You must check the remaining trits.
    - If it's `111...111` or less, it's **positive**.
    - If it's `111...112` or more, it's **negative**.
