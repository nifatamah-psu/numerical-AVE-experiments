# numerical-AVE-experiments
Numerical Experiments for AVE
This repository contains the Scilab implementation used to generate the numerical experiments reported in the paper:

\title{A new two step iterative method based on Newton and fixed point for solving absolute value equations}

The code provides reproducible experiments for solving generalized absolute value equations (GAVEs) using several iterative methods, including Newton-type and hybrid approaches.
## Examples
- Example 1: run Main_EX1.sci
- Example 2: run Main_EX2.sci
- Example 3: run Main_EX3.sci
- Example 4: run Main_EX4.sci
  
Each script will display:
- Number of iterations
- Final error
- Computational time
  
## Description
- Main_EXi.sci
  Entry point for Example i. Each script:
    - generates the corresponding test problem
    - applies all numerical methods
    - outputs results used in the paper
- generate_problem_EXi.sci
    Constructs the problem data for Example i.
- Numerical Methods
    - NT.sci — Newton-type method
    - MFPT.sci — Modified Fixed-Point Technique
    - TSI.sci — Two-Step Iteration
    - NTFPI.sci — Newton-Type Fixed-Point Iteration (hybrid method)

## How to Run the Experiments

All experiments are executed in Scilab.

To reproduce the results for each example:

Example 1
exec('Main_EX1.sci');
Example 2
exec('Main_EX2.sci');
Example 3
exec('Main_EX3.sci');
Example 4
exec('Main_EX4.sci');

Each script will:

1. Generate the corresponding problem instance
2. Run all implemented methods
3. Display numerical results

## Reproducibility
- Each example is fully self-contained via its corresponding Main_EXi.sci.
- All numerical results reported in the paper can be reproduced by executing the scripts above.
If randomness is involved, a fixed seed should be set within the scripts.

## Notes
Ensure that all .sci files are in the same working directory before execution.

## Requirements
Scilab (tested with version: [Scilab 2025.1.0])

No additional toolboxes are required unless explicitly stated in the scripts.

This project is licensed under the MIT License. See the LICENSE file for details.
