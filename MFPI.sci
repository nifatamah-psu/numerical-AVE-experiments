function [k, err, t] = MFPI(A,b,x0,es,ql,T)

    AI = inv(A);
    n = size(A,1);
    IA = eye(n,n);

    y0 = x0;
    q = ql + 100;    
    Q = (1/q)*IA;
    IQ = inv(Q);
    err = 100;
    k = 0;

    tic()
    while err > es & k < 1000
        x1 = AI*((Q*y0)+b);
        y1 = (1-T)*y0 + T*IQ*abs(x1);

        err = norm(A*x1-abs(x1)-b)/norm(b);
        y0 = y1;
        k = k + 1;
    end
    t = toc();
endfunction


    

    
