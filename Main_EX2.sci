// main/run_ex2.sce

//exec('../methods/NT.sci', -1);
//exec('../methods/MFPI.sci', -1);
//exec('../methods/TSI.sci', -1);
//exec('../methods/NTFPI.sci', -1);
//
//exec('../problems/problem_ex2_LCP.sci', -1);

// generate problem
[A,b,x0] = generate_problem_EX2();
// ****parameter for MPFI in EX2 *****
es = 1e-6;
ql = 0.02757435;
T = 0.09; //tau
//****** Run *******
[k1,e1,t1] = NT(A,b,x0,es);
[k2,e2,t2] = MFPI(A,b,x0,es,ql,T);
[k3,e3,t3] = TSI(A,b,x0,es);
[k4,e4,t4] = NTFPI(A,b,x0,es);

//******* Print *******
disp("==== Example 2 (LCP → AVE) ====");
disp("Method     Iter     Error        Time");

disp("NT      "+string(k1)+"   "+string(e1)+"   "+string(t1));
disp("MFPI    "+string(k2)+"   "+string(e2)+"   "+string(t2));
disp("TSI     "+string(k3)+"   "+string(e3)+"   "+string(t3));
disp("NTFPI   "+string(k4)+"   "+string(e4)+"   "+string(t4));
