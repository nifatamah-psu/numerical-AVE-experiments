function [ql,T]=MFPI_Parameters(A)

// --- Calculate MFPI Parameters based on Equation (16) of Paper [1] ---

// 1. Calculate the spectral norm of the inverse matrix (nu)
// norm(M, 2) in Scilab computes the spectral norm [5].
//[A,b,x0] =generate_problem_EX4(n, rho);
nu = norm(inv(A), 2);

// 2. Compute the lower bound ql
// This is derived from the condition nu <= q / sqrt(1 + q^2) [3, 6].
if nu < 1 then
    ql = nu / sqrt(1 - nu^2);
else
    // If nu >= 1, the theoretical condition (16) is not met, 
    // though the paper notes it may still converge [7].
    disp("Warning: ||A^-1|| >= 1. Theoretical conditions may not apply.");
    ql = nu; // Fallback or handle error
end

// 3. Set q as specified in your query
q = ql + 100;

// 4. Compute the boundaries for tau (iteration parameter) 
// based on Equation (16) [3].
inner_term = sqrt(1 - (nu^2 / q^2));
tau_min = 1 - (inner_term / (1 - nu));
tau_max = (1 + inner_term) / (1 + nu);

// 5. Select a tau within the range (e.g., the midpoint or tau_max)
// Source 25/26 shows tau_opt is often near the upper bound.
T = (tau_min + tau_max) / 2;

// --- Display Results ---
//disp("Calculated Parameters for MFPI:");
//disp("nu (||A^-1||): " + string(nu));
//disp("ql:            " + string(ql));
//disp("q (ql + 100):  " + string(q));
//disp("Tau Range:     (" + string(tau_min) + " , " + string(tau_max) + ")");
//disp("Selected Tau:  " + string(tau));
endfunction
