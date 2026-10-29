# Global Sequence Alignment (Needleman-Wunsch)

R program that aligns two protein sequences using the Needleman-Wunsch algorithm and the BLOSUM50 substitution matrix.

## What it does

1. Builds a score lookup matrix from BLOSUM50 values and a gap penalty.
2. Fills the cumulative score matrix and the direction matrix.
3. Runs the traceback from the last cell and prints the alignment and its score.

## Requirements

- R (tested with R 4.3.3)
- RStudio (recommended)
- The `blosum50.txt` file

## Usage

1. Open `script.R` in RStudio.
2. Edit the variables at the top of the script: the two sequences (`s1`, `s2`) and the gap penalty (`gap`).
3. Make sure the path in `read.table()` points to your copy of `blosum50.txt`.
4. Run the whole script (`Source`).

Example with `s1 = "BEAVTY"`, `s2 = "BEAST"` and `gap = 0`:

```
BEA-VTY
BEAS-T-
```

Total score: 22

## Files

- `script.R`: main script
- `blosum50.txt`: BLOSUM50 substitution matrix (source: NCBI)

## Reference

Needleman, S. B. & Wunsch, C. D. (1970). A general method applicable to the search for similarities in the amino acid sequence of two proteins. *Journal of Molecular Biology*, 48(3), 443-453.
