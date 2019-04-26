head(/)

@+F1(100) @+L2(10000) @+L3(10000) @+L4(10000)
0⇒r 1⇒a *n2s(a/F1) 7⇒k 4⇒e Ik⇒n ⁻i
*fopen(F1,r/d) 0⇒b⇒Q1 1⇒l
§1 ∆i ↑(i=n)2 *getvector(d,F1,b,l/v) v@>L2 →1
§2 *fclose(d/)  *printmat(7,L2/)
OQ3 /'****************\n'>C
§3  *beginBig(L2,k/L3) /'****************\n'>C Op OL4 L3⇒L4 Q3⇒Q4 *printmat(32,L4/)
§4  ↑(p≥Q4)5 *notnullcolBig(L4,p,e/z) OQ1 *n2s(z/F1) /'notnullcol = '>C /F1>C /'\n'>C  /'****************\n'>C
 p+e⇒p →4
§5 **


beginBig(L1,k/L2) *** k - число столбцов(=число строк в матрице после транспонирования)
k⇒Q2 OL2 Q1⇒m ↑(m>32)1 *begin(L1,m/L2) →5 ***m - число строк(=число столбцов в матрице после транспонирования)
§1 ⁻i  m/32⇒e m;32⇒b↪2 ∆e ***e - число строк, которое занимает число, b - номер столбца, где конец числа
§2 *transpositionBig(L1,k,e/L2) ⁻j
§3 ∆i ↑(i=e)4 j@>L2 →3
§4 *printbigmat(32,e,L2/)
§5 **

transpositionBig(L1,k,e/L2) ***e-число строк, которое занимает число, k-число столбцов
k*e⇒Q2
OL2 ⁻i
§1 ∆i ↑(i=Q1)3 L1i⇒m
§2 ↑X1mj j*e⇒j i:32+j⇒j Z⇒q L2j∨Iq⇒L2j →2  ***в Z - остаток от деления i 32
§3 **

notnullcolBig(L2,k,e/n) ***k - номер строки, с которой начинаем поиск ненулевого столбца,
@+F1(100)                        ***e - количество строк, которое занимает число
k⇒j Ox ⁻n               *** как отловить нулевую матрицу(кусок матрицы?)
§1 ↑(j≥Q2)4 Ox Ol
§2 ↑(l=e)3
        j+l⇒r         OQ1 *n2s(r/F1) /'r = '>C /F1>C /'\n'>C
                      ***OQ1 *n2s(j/F1) /'j = '>C /F1>C /'\n'>C
                      ***OQ1 *n2s(l/F1) /'l = '>C /F1>C /'\n'>C
        L2r∨x⇒x       L2r⇒z OQ1 *n2(z,2/F1) /'L2r = '>C /F1>C /'\n'>C
                      ***x⇒z OQ1 *n2(x,2/F1) /'x = '>C /F1>C /'\n'>C
        x↪2 x!+32*l⇒h ↑(h≥n)3 h⇒n            *** 0! = 31 & I31! = 31
                      ***OQ1 *n2s(n/F1) /'notnullcol in = '>C /F1>C /'\n'>C
        ∆l →2
§3 j+e⇒j →1
§4 **


getvector(d,F1,b,l/v)
@+F2(100) @'\n'>F2 Op
§1 *freadf(d,F1,b,l/k)↑(F1p=F2.0)2 ∆b ∆Q1⇒p →1
§2 *input2(F1/v) **

*** перевод числа в строку ***
n2(a,q/F1) ***
OQ1 ***
§1	a/q⇒a Z⇒b *n2c(b/c) c@>F1 a↦1
Oi Q1-1⇒j
§3	↑(i≥j)4 ⇔(F1ij) ∆i ∇j →3
§4	**
