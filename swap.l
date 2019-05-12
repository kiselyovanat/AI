head(/)

@+F1(100) @+L2(10000) @+L3(10000) @+L4(100000)
0⇒r 3⇒a *n2s(a/F1) 6⇒k 4⇒e 128⇒n ⁻i
*fopen(F1,r/d) 0⇒b⇒Q1 1⇒l
§1 ∆i ↑(i=n)2 *getvector(d,F1,b,l/v) v@>L2 →1
§2 *fclose(d/)  *printmat(k,L2/)
OQ3 /'****************\n'>C
§3  *beginBig(L2,k,e/L3) /'****************\n'>C Op OL4 L3⇒L4 Q3⇒Q4 ***printmat(32,L4/)
§4 *swap(L4,3,5,e/L4) *printbigmat(32,e,L4/)
**

beginBig(L1,k,e/L2) *** k - число столбцов(=число строк в матрице после транспонирования),e - число строк, которое занимает число
***k⇒Q2 OL2 Q1⇒m ↑(m>32)1 *begin(L1,m/L2) →5 ***m - число строк(=число столбцов в матрице после транспонирования)
§1 ⁻i
§2 *transpositionBig(L1,k,e/L2) ⁻j
§3 ***∆i ↑(i=e)4 j@>L2 →3
§4 *printbigmat(32,e,L2/)
§5 **

transpositionBig(L1,k,e/L2) ***e-число строк, которое занимает число, k-число столбцов
k*e⇒Q2
OL2 ⁻i
§1 ∆i ↑(i=Q1)3 L1i⇒m
§2 ↑X1mj j*e⇒j i:32+j⇒j Z⇒q L2j∨Iq⇒L2j →2  ***в Z - остаток от деления i 32
§3 **

swap(L2,k,j,e/L2)
k*e⇒i+e⇒l j*e⇒s
§1 ↑(i=l)2 ⇔(L2is) ∆s ∆i →1
§2 **
