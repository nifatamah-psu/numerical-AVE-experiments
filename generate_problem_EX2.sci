// problems/problem_ex2_LCP.sci
function [A,b,x0] = generate_problem_EX2()

    n = 3000;
    M = zeros(n,n);

    for i = 1:n
        M(i,i) = 0.6;
        if i > 1 then
            M(i,i-1) = -0.01;
        end
        if i < n then
            M(i,i+1) = -0.01;
        end
    end

    e = ones(n,1);
    q = -e;

    I = eye(n,n);

    A = inv(I - M) * (I + M);
    b = -inv(I - M) * q;

    x0 = 0.001* ones(n,1);//0.9 * ones(n,1); //

endfunction
