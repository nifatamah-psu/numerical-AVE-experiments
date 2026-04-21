// problems/problem_ex3_hydrodynamic.sci
function [A,b,x0] = generate_problem_EX3()

    n = 3000;

    // Build B
    B = zeros(n,n);
    for i = 1:n
        B(i,i) = -25.5;
        if i < n then
            B(i,i+1) = -2.5;
            B(i+1,i) = -2.5;
        end
    end

    // Build c
    c = zeros(n,1);
    c(1) = -27;
    c(n) = -27;
    for i = 2:(n-1)
        c(i) = -29.5;
    end

    I = eye(n,n);

    // AVE form
    A = -(2*B + I);
    b = -2*c;

    // initial guess
    x0 = 0.9 * ones(n,1);//0.02 * ones(n,1);

endfunction
