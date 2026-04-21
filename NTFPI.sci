function [k, err, t] = NTFPI(A,b,x0,es)

    AI = inv(A);
    err = norm(A*x0-abs(x0)-b)/norm(b);
    k = 0;

    tic()
    while err > es
        betan =1/(1+k)^11;//0.1;//0.33;//0.9;//1/(1+k);//0.32;// 1/(1+k)^11;//

        Fx = A*x0 - abs(x0) - b;
        H = diag(sign(x0));
        dF = A - H;
        IdF = inv(dF);

        y1 = x0 - IdF*Fx;
        x1 = (1-betan)*y1 + betan*(AI*abs(y1) + AI*b);

        x0 = x1;
        err = norm(A*x1-abs(x1)-b)/norm(b);
        k = k + 1;
    end
    t = toc();
   // disp('x1 is');
   // disp(x1);
endfunction
