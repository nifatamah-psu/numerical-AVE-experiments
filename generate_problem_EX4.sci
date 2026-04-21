// Function to generate a random square matrix of size n and rank rho
// based on Algorithm 5.1 (GenRand) from the sources [1] Marko2015.
function [A,b,x0] =generate_problem_EX4(n, rho)
    // build_GenRand_matrix(n, rho)
    // 1. Generate C as a (rho x n) matrix where each element is a 
    // realization of a normal distributed random variable N(0, 1) [1, 2].
    C = rand(rho, n, "normal");
    
    // 2. Generate B as an (n-rho x rho) matrix where each entry is 
    // selected from a uniformly distributed random variable on [-1, 1] [1, 3].
    B = (rand(n - rho, rho, "uniform") * 2) - 1;
    
    // 3. Normalize each row of B so that its L2 norm is equal to 1 [1].
    for i = 1:(n - rho)
        row_vec = B(i, :);
        B(i, :) = row_vec / norm(row_vec, 2);
    end
    
    // 4. Construct the square (n x n) matrix A by vertically 
    // concatenating blocks C and (B * C) [1].
    A_base = [C; B * C];
    // After generating A_base:
    nu_base = norm(inv(A_base), 2);
    // Scale A such that the new norm is roughly 0.5 (safe convergence range)
    target_nu = 0.5;
    lambda = nu_base / target_nu;
    A = lambda * A_base;
   // x_true =rand(n, 1, "normal"); 
   x_true =rand(n, 1, "uniform") * 2) - 1;
    // disp(' x true is');
    // disp(x_true);
    b = A * x_true - abs(x_true);
    x0 = zeros(n, 1); //
endfunction

// --- Example Usage ---
//n = 500;             // Dimension of the matrix
//rho =n// floor(4*n/5);  // Setting rank to 80% of n, as done in source tests [4, 5]
//By choosing rho<n, you can test how your AVE solver handles singular or ill-conditioned matrices. If you require a full-rank "fully random" matrix as the reviewer suggested, you can simply set rho = n, in which case the algorithm effectively returns a standard N(0,1) random matrix A=C
//A = build_GenRand_matrix(n, rho);

// To test the Absolute Value Equation Ax - |x| = b:
// It is standard practice to pick a random solution x_true first
//x_true = rand(n, 1, "normal"); 
// Then compute the corresponding vector b [not in sources, but standard for AVE]
//b = A * x_true - abs(x_true);
//x0 = rand(n, 1, "normal");
// Generate the shared test data ONCE
//A = build_GenRand_matrix(n, rho); 
//x_true = (rand(n, 1, "uniform") * 2) - 1; 
//b = A * x_true - abs(x_true); 
//x0 = zeros(n, 1); // Shared initial guess [3, 4]
