function [k, err, t] = TSI(A,b,x0,es)

    err = 100;
    k = 0;

    tic()
    while k<=200 & err>es
        Fx = A*x0-abs(x0)-b;
        H = diag(sign(x0));
        dF = A - H;
        IdF = inv(dF);

        y1 = x0 + IdF*Fx;
        Fy = A*y1-abs(y1)-b;

        x1 = x0 - IdF*(Fy-Fx);

        x0 = x1;
        err = norm(A*x1-abs(x1)-b)/norm(b);
        k = k + 1;
    end
    t = toc();
endfunction
