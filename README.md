# Global Sequence Alignment (Needleman-Wunsch)
# Global Sequence Alignment (Needleman-Wunsch)

R program that aligns two protein sequences using the Needleman-Wunsch algorithm and the BLOSUM50 substitution matrix.

## What it does

1. Builds a score lookup matrix from BLOSUM50 values and a gap penalty.
2. Fills the cumulative score matrix and the direction matrix.
3. Runs the traceback from the last cell and prints the alignment and its score.

## Requirements

- R (tested with R 4.3.3)
- The `blosum50.txt` file, in the same folder as the script

## Usage

From the repository folder:

```bash
Rscript alineamiento.R SEQUENCE1 SEQUENCE2 GAP blosum50.txt
```

Example:

```bash
Rscript alineamiento.R BEAVTY BEAST 0 blosum50.txt
```

Expected output:

```
BEA-VTY
BEAS-T-
```

Total score: 22

## Files

- `alineamiento.R`: main script
- `blosum50.txt`: BLOSUM50 substitution matrix (source: NCBI)

## Reference

Needleman, S. B. & Wunsch, C. D. (1970). A general method applicable to the search for similarities in the amino acid sequence of two proteins. *Journal of Molecular Biology*, 48(3), 443-453.
