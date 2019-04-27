head(/)

@+F1(100) @+L2(10000) @+L3(10000) @+L4(100000)
0⇒r 2⇒a *n2s(a/F1) 6⇒k 4⇒e 128⇒n ⁻i
*fopen(F1,r/d) 0⇒b⇒Q1 1⇒l
§1 ∆i ↑(i=n)2 *getvector(d,F1,b,l/v) v@>L2 →1
§2 *fclose(d/)  *printmat(k,L2/)
OQ3 /'****************\n'>C
§3  *beginBig(L2,k,e/L3) /'****************\n'>C Op OL4 L3⇒L4 Q3⇒Q4 *printmat(32,L4/)
§4 ↑(p≥Q4)5
*notnullcolBig(L4,p,e/z) OQ1 *n2s(z/F1) /'notnullcol = '>C /F1>C /'\n'>C  ***/'****************\n'>C
⁻c ↑(z=c)5
 *upperoneBig(L4,p,z,e/y) OQ1 *n2s(y/F1) /'upperone = '>C /F1>C /'\n'>C  /'****************\n'>C
p+e⇒p →4
§5 **


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

notnullcolBig(L2,k,e/n) ***k - номер строки, с которой начинаем поиск ненулевого столбца,
@+F1(100)                        ***e - количество строк, которое занимает число
k⇒j Ox ⁻n               *** как отловить нулевую матрицу(кусок матрицы?)
§1 ↑(j≥Q2)5 Ox Ol
§2 ↑(l=e)4
        j+l⇒r         ***OQ1 *n2s(r/F1) /'r = '>C /F1>C /'\n'>C
                      ***OQ1 *n2s(j/F1) /'j = '>C /F1>C /'\n'>C
                      ***OQ1 *n2s(l/F1) /'l = '>C /F1>C /'\n'>C
        L2r∨x⇒x       ***L2r⇒z OQ1 *n2(z,2/F1) /'L2r = '>C /F1>C /'\n'>C
                      ***x!⇒z OQ1 *n2(z,10/F1) /'x! = '>C /F1>C /'\n'>C
        x↪3 x!⇒h 32*l⇒s h+s⇒h ↑(h≥n)3 h⇒n            *** 0! = 31 & I31! = 31
                      ***OQ1 *n2s(n/F1) /'notnullcol in = '>C /F1>C /'\n'>C
§3       ∆l →2
§4 j+e⇒j →1
§5 **


upperoneBig(L2,k,i,e/y)
@+F1(1000) k⇒j
i/31⇒m i;31↪2 ∆m
§2 i;32⇒b Ib⇒x                  ***OQ1 *n2(x,2/F1) /'x = '>C /F1>C /'\n'>C OQ1 *n2(m,10/F1) /'m = '>C /F1>C /'\n'>C OQ1 *n2(b,10/F1) /'b = '>C /F1>C /'\n'>C
                                ***OQ1 *n2(j,10/F1) /'j = '>C /F1>C /'\n'>C OQ1 *n2(L2j,2/F1) /'L2j = '>C /F1>C /'\n'>C
§3 ↑(j≥Q2)6
§4      j+m-1⇒r                  ***OQ1 *n2(r,10/F1) /'r = '>C /F1>C /'\n'>C
        L2r&x ↪5 r/e⇒y →6     ***нужно ли деление?
                                  ***OQ1 *n2(y,10/F1) /'y = '>C /F1>C /'\n'>C
§5  j+e⇒j →3
§6  **


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
