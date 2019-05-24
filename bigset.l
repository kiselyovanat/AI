head(/)

@+F1(100) @+L2(1000000) @+L3(1000000) @+L4(1000000)
0⇒r 3⇒a *n2s(a/F1) 7⇒k 4⇒e 128⇒n ⁻i
*fopen(F1,r/d) 0⇒b⇒Q1 1⇒l
§1 ∆i ↑(i=n)2
          *getvector(d,F1,b,l/v) v@>L2 →1
§2 *fclose(d/)
    OQ3
§3  *beginBig(L2,k,e/L3) 1⇒i *** c-число больших строк в матрице
§4  Q3/e⇒c OQ1 ***
 *n2s(c/F1) /'c = '>C /F1>C /'\n'>C
     ↑(c>n)7
      *rankBig(L3,e/r)
§5    ↑(r<c)7
          ↑(i=k)7 ∆i Ii-1⇒u k-i⇒q u<q⇒s  *** u - последнее сочетание, s - начальное
        ***
        OQ1 *n2s(k/F1) /'k = '>C /F1>C /'\n'>C
        ***
          OQ1 *n2s(i/F1) /'i = '>C /F1>C /'\n'>C
        ***
          OQ1 *n2s(q/F1) /'q = '>C /F1>C /'\n'>C
        ***
          OQ1 *output2(s,k/F1) /'s = '>C /F1>C /'\n'>C
        ***
          OQ1 *output2(u,k/F1) /'u = '>C /F1>C /'\n'>C
§6        *monomBig(s,e,L3/L3)  ↑(s=u)4 *sochz(s/s) OQ1 *output2(s,k/F1) /'s = '>C /F1>C /'\n'>C →6
§7 i⇒a OQ1 *n2s(a/F1) /'AI = '>C /F1>C /'\n'>C **



beginBig(L1,k,e/L2) 				*** k - число столбцов(=число строк в матрице после транспонирования), e - число строк, которое занимает число
						***m - число строк(=число столбцов в матрице после транспонирования)
§1 ⁻i
§2 *transpositionBig(L1,k,e/L2) ⁻j
§3 ∆i ↑(i=e)4 j@>L2 →3
§4 ***printbigmat(32,e,L2/)
§5 **

transpositionBig(L1,k,e/L2) ***e-число строк, которое занимает число, k-число столбцов
k*e⇒Q2
OL2 ⁻i
§1 ∆i ↑(i=Q1)3 L1i⇒m
§2 ↑X1mj j*e⇒j i:32+j⇒j Z⇒q L2j∨Iq⇒L2j →2  ***в Z - остаток от деления i 32
§3 **

rankBig(L2,e/r) ***e-число строк, которое занимает число
@+F1(100) Ok @+L3(1000000) OL3 L2⇒L3 Q2⇒Q3/e⇒n ⁻a OQ1 *n2s(n/F1) /'n= '>C /F1>C /'\n'>C  ***n-число больших строк в матрице
§1 *notnullcolBig(L3,k,e/i) ↑(i=a)4 *upperoneBig(L3,k,i,e/j) ↑(k=j)2 *swap(L3,k,j,e/L3)
§2 *downxorbig(L3,i,k,e/L3)
§3 ∆k ↑(k=n)4 →1
§4 k⇒r *printbigmat(32,e,L3/)  OQ1 *n2s(r/F1) /'rank = '>C /F1>C /'\n'>C **

notnullcolBig(L2,k,e/h) 	 ***k - номер строки, с которой начинаем поиск ненулевого столбца,
@+F1(100)                        ***e - количество строк, которое занимает число
⁻h Ol Oi         ***OQ1 *n2s(Q2/F1) /'Q2 = '>C /F1>C /'\n'>C
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

sochz(s/s)
§1 s+1&s⇒b-1⊕s%-2⇒c
   s+1⊕s<1+1<c⊕b⇒s
§2 **

monomBig(s,e,L2/L2)		***s-сочетание, e - число строк, которое занимает число
s⇒k @+L3(e) e⇒Q3 Oi Oq
§1 ↑(i=Q3)2 ⁻L3i ∆i→1
§2 ↑X4kj j*e⇒j Ol
§3 ↑(l=e)2 j+l⇒p L2p&L3l⇒L3l ∆l →3
§4 ↑(q=Q3)5 L3q@>L2 ∆q →4
§5 **

upperoneBig(L2,k,i,e/y)		*** k - номер строки, с которой начинаем поиск, i-номер ненулевого столбца
@+F1(1000) k*e⇒j
i>5⇒m i&31⇒b
***i/31⇒m i;31↪2 ∆m
§2 ***i;32⇒b
   Ib⇒x                  ***OQ1 *output2(x,32/F1) /'x = '>C /F1>C /'\n'>C OQ1 *n2(m,10/F1) /'m = '>C /F1>C /'\n'>C OQ1 *n2(b,10/F1) /'b = '>C /F1>C /'\n'>C
                                ***OQ1 *n2(j,10/F1) /'j = '>C /F1>C /'\n'>C ***OQ1 *n2(L2j,2/F1) /'L2j = '>C /F1>C /'\n'>C
§3 ↑(j≥Q2)6
§4      j+m⇒r                ***OQ1 *output2(L2r,32/F1) /'L2r = '>C /F1>C /'\n'>C OQ1 *n2(r,10/F1) /'r = '>C /F1>C /'\n'>C
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
