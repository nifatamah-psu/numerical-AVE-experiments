// problem_EX1.sci
function [A,b,x0] = generate_problem_EX1(m)
    S=zeros(m,m);
    for i=1:m
        for j=1:m
            if i==j then 
                S(i,j)=4;
            elseif j==i-1 then 
                S(i,j)=-1;
            elseif j==i+1 then 
                S(i,j)=-1;
            else 
                S(i,j)=0;
            end
        end
    end
    I=eye(m,m); //identity matrix size m*m
    Ahat = eye(m,m).*.S + diag(ones(m-1,1),1).*.(-I) + diag(ones(m-1,1),-1).*.(-I);
    n = m*m;
    IA = eye(n,n);
    miu = 2.4;
    A = Ahat + miu*IA;

    b = ones(n,1);
    x0 = zeros(n,1);
endfunction

          
