head(/)

@+F1(100) @+L2(10000) @+L3(10000) @+L4(100000)
0⇒r 3⇒a *n2s(a/F1) 6⇒k 4⇒e 128⇒n ⁻i
*fopen(F1,r/d) 0⇒b⇒Q1 1⇒l
§1 ∆i ↑(i=n)2 *getvector(d,F1,b,l/v) v@>L2 →1
§2 *fclose(d/)  *printmat(k,L2/)
OQ3 /'****************\n'>C
§3  *beginBig(L2,k,e/L3) /'****************\n'>C Op OL4 L3⇒L4 Q3⇒Q4 *printbigmat(32,e,L4/)/'****************\n'>C
§4 *rankBig(L4,k/r) OQ1 *n2s(r/F1) /'rank = '>C /F1>C /'\n'>C
§5 **



beginBig(L1,k,e/L2) *** k - число столбцов(=число строк в матрице после транспонирования),e - число строк, которое занимает число
***k⇒Q2 OL2 Q1⇒m ↑(m>32)1 *begin(L1,m/L2) →5 ***m - число строк(=число столбцов в матрице после транспонирования)
§1 ⁻i
§2 *transpositionBig(L1,k,e/L2) ⁻j
§3 ***∆i ↑(i=e)4 j@>L2 →3
§4 ***printbigmat(32,e,L2/)
§5 **

transpositionBig(L1,k,e/L2) ***e-число строк, которое занимает число, k-число столбцов
k*e⇒Q2
OL2 ⁻i
§1 ∆i ↑(i=Q1)3 L1i⇒m
§2 ↑X1mj j*e⇒j i:32+j⇒j Z⇒q L2j∨Iq⇒L2j →2  ***в Z - остаток от деления i 32
§3 **

rank(L2/r)
Ok @+L3(32) OL3 L2⇒L3 Q2⇒Q3
§1 *notnullcol(L3,k/i) ↑(i=32)4  *upperone(L3,k,i/j) ↑(k=j)2 ⇔(L3jk)
§2 *downxor(L3,i,k/L3)
§3  ∆k ↑(k=Q3)4 →1
§4 k⇒r **

rankBig(L2,n/r) ***n - количество строк(больших) в матрице
Ok @+L3(1000) OL3 L2⇒L3 Q2⇒Q3 ⁻a
§1 *notnullcolBig(L3,k,e/i) ↑(i=a)4 *upperoneBig(L3,k,i,e/j) ↑(k=j)2 *swap(L3,k,j,e/L3)
§2 *downxorbig(L3,i,k,e/L3)
§3  ∆k ↑(k=n)4 →1
§4 k⇒r *printbigmat(32,e,L3/) **

notnullcolBig(L2,k,e/h) ***k - номер строки, с которой начинаем поиск ненулевого столбца,
@+F1(100)                        ***e - количество строк, которое занимает число
  ⁻h Ol    Oi         ***OQ1 *n2s(Q2/F1) /'Q2 = '>C /F1>C /'\n'>C
§1 ↑(l=e)6  Ox k*e⇒j
§2 ↑(j≥Q2)4
        j+l⇒r         ***OQ1 *n2s(r/F1) /'r = '>C /F1>C /'\n'>C
                      ***OQ1 *n2s(j/F1) /'j = '>C /F1>C /'\n'>C
                      ***OQ1 *n2s(l/F1) /'l = '>C /F1>C /'\n'>C
        L2r∨x⇒x       ***OQ1 *output2(L2r,32/F1) /'L2r = '>C /F1>C /'\n'>C
                      ***x!⇒z OQ1 *n2(z,10/F1) /'x! = '>C /F1>C /'\n'>C
                      *** 0! = 31 & I31! = 31
                      ***OQ1 *n2s(n/F1) /'notnullcol in = '>C /F1>C /'\n'>C
                      ***OQ1 *n2s(i/F1) /'step '>C /F1>C /'\n'>C ∆i
§3      j+e⇒j  →2
§4      x↪5 x!⇒h 32*l⇒s+h⇒h →6 ***↑(h≥n)3 h⇒n
§5 ∆l →1
§6 **



upperoneBig(L2,k,i,e/y)
@+F1(1000) k*e⇒j
***i+31>5⇒m i&31⇒b
i/31⇒m i;31↪2 ∆m
§2 i;32⇒b Ib⇒x                  ***OQ1 *output2(x,32/F1) /'x = '>C /F1>C /'\n'>C OQ1 *n2(m,10/F1) /'m = '>C /F1>C /'\n'>C OQ1 *n2(b,10/F1) /'b = '>C /F1>C /'\n'>C
                                ***OQ1 *n2(j,10/F1) /'j = '>C /F1>C /'\n'>C ***OQ1 *n2(L2j,2/F1) /'L2j = '>C /F1>C /'\n'>C
§3 ↑(j≥Q2)6
§4      j+m-1⇒r                ***OQ1 *output2(L2r,32/F1) /'L2r = '>C /F1>C /'\n'>C OQ1 *n2(r,10/F1) /'r = '>C /F1>C /'\n'>C
        L2r&x  ↪5 r/e⇒y →6
                                  ***OQ1 *n2(y,10/F1) /'y = '>C /F1>C /'\n'>C
§5  j+e⇒j →3
§6  **

swap(L2,k,j,e/L2)
k*e⇒i+e⇒l j*e⇒s
§1 ↑(i=l)2 ⇔(L2is) ∆s ∆i →1
§2 **


downxorbig(L2,i,j,m/L2)
i>5⇒q i&31⇒r Ir⇒x j⇒k*m+q⇒t *** q,r - "координаты" i-го столбца в "секции" (№ строки и № бита)
§1 ∆k t+m⇒t ↑(t≥Q2)2 L2t&x ↪1 *big_xor(L2,j,k,m/L2) →1
§2 **

big_xor(L1,j,k,m/L1) *** прибавить к k-й секции j-ю, m - размер секции
   j*m⇒j+m⇒e k*m⇒k
§1 L1j⊕L1k⇒L1k ∆k ∆j⊕e↦1
**

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
