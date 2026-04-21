//Main_EX4.sci
// main/run_ex4.sce

//exec('../methods/NT.sci', -1);
//exec('../methods/MFPI.sci', -1);
//exec('../methods/TSI.sci', -1);
//exec('../methods/NTFPI.sci', -1);
//
//exec('../problems/problem_ex2_LCP.sci', -1);
n = 600;             // Dimension of the matrix
rho =n;
// generate problem
[A,b,x0] = generate_problem_EX4(n, rho);

es = 1e-6;
// ****parameter for MPFI in EX3 *****
//ql = 0.0250078;
//T = 1.11;
[ql,T]=MFPI_Parameters(A);
//****** Run *******
[k1,e1,t1] = NT(A,b,x0,es);
[k2,e2,t2] = MFPI(A,b,x0,es,ql,T);
[k3,e3,t3] = TSI(A,b,x0,es);
[k4,e4,t4] = NTFPI(A,b,x0,es);

//******* Print *******
disp("==== Example 4 (Build_GenRand_matrix(n, rho)) ====");
disp("Method     Iter     Error        Time");

disp("NT      "+string(k1)+"   "+string(e1)+"   "+string(t1));
disp("MFPI    "+string(k2)+"   "+string(e2)+"   "+string(t2));
disp("TSI     "+string(k3)+"   "+string(e3)+"   "+string(t3));
disp("NTFPI   "+string(k4)+"   "+string(e4)+"   "+string(t4));
