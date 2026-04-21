function [k, err, t] = NT(A,b,x0,es)

    err = norm(A*x0 - abs(x0) - b) / norm(b);
    k = 0;

    tic()
    while err > es

        // Step 1: Jacobian
        H = diag(sign(x0));
        dF = A - H;

        // Step 2: inverse Jacobian
        IdF = inv(dF);

        // Step 3: tk
        tk = IdF * b;

        // Step 4: modified matrices
        dhs  = dF;
        dhst = A - diag(sign((x0 + tk)/2));

        // Step 5: residual
        Fx = A*x0 - abs(x0) - b;

        // Step 6: update (สำคัญ!)
        s1 = x0 - 6 * inv(2*dhs + 4*dhst) * Fx;

        // update iterate
        x0 = s1;

        // error
        err = norm(A*s1 - abs(s1) - b) / norm(b);

        k = k + 1;
    end

    t = toc();
endfunction

