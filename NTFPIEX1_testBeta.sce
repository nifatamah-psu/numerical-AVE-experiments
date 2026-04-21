function NTFPIEX1_testBeta
    m=40;
    S=zeros(m,m);
    for i=1:m
        for j=1:m
            if i==j then 
                S(i,j)=4;
            elseif j==i-1 then //for lower matric
                S(i,j)=-1;
            elseif j==i+1 then //for upper matric
                S(i,j)=-1;
            else 
                S(i,j)=0;
            end
        end
     end
          I=eye(m,m); //identity matrix size m*m
          Ahat = eye(m,m).*.S + diag(ones(m-1,1),1).*.(-I) + diag(ones(m-1,1),-1).*.(-I);
            n=m^2;
            IA=eye(n,n);
            miu=2.4;
            A=Ahat+miu*IA;
            AI=inv(A);
           b=ones(n,1);
            
        es=10^(-6);
        
        //disp(err)
        for i=1:1:20
        k=0;
        x0=zeros(n,1);
        err=(norm(A*x0-abs(x0)-b))/norm(b);
        
        tic()
        while err>es
            betan=1/(1+k)^i;//0.3+0.01*i;//0.1*i;//1/(1+k); //err
            //disp(betan);
            Fx=A*x0-abs(x0)-b;
            H=diag(sign(x0));
            dF=A-H;
            IdF=inv(dF);
            y1=x0-IdF*Fx;
            x1=(1-betan)*y1+betan*(AI*abs(y1)+(AI*b));
            x0=x1;
            err=(norm(A*x1-abs(x1)-b))/norm(b);
            k=k+1;
            //err1(k)=err;
        end
        t=toc();
        disp('**** New Beta******');
            disp(betan);
            disp(k);
            disp(err);
            disp(t);
        end
 //save('NTFPIEX1_results.sce', 'err1', 'k')
endfunction
