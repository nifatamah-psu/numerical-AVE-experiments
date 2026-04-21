//exec('../methods/NT.sci', -1);
//exec('../methods/MFPI.sci', -1);
//exec('../methods/TSI.sci', -1);
//exec('../methods/NTFPI.sci', -1);
//exec('../problems/problem_ex1.sci', -1);
m=40;
[A,b,x0] = generate_problem_EX1(m);

es = 1e-6;
// ****parameter for MPFI in EX1 *****
if m==40 then
    ql=0.4557; //m=40
    T = 0.72;//t
elseif m==60 then
    ql=0.4571;//m=60
    T = 0.21; //m=60
elseif m==80 then
    ql=0.4577;//m=80
    T = 0.09; //m=80
elseif m==100 then
    ql = 0.4579;//m=100
    T = 0.059; //m=100
end

//****** Run *******
//[k1,e1,t1] = NT(A,b,x0,es);
[k2,e2,t2] = MFPI(A,b,x0,es,ql,T);
//[k3,e3,t3] = TSI(A,b,x0,es);
//[k4,e4,t4] = NTFPI(A,b,x0,es);
//******* Print *******
disp("==== Example 1 ====");
disp("Method     Iter     Error        Time");
//disp("NT...   "+string(k1)+"   "+string(e1)+"   "+string(t1));
disp("MFPI    "+string(k2)+"   "+string(e2)+"   "+string(t2));
//disp("TSI     "+string(k3)+"   "+string(e3)+"   "+string(t3));
//disp("NTFPI   "+string(k4)+"   "+string(e4)+"   "+string(t4));


