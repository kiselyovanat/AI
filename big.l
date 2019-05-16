***тут все функции, которые уже переписаны для больших чисел

beginBig(L1,k,e/L2) *** k - число столбцов(=число строк в матрице после транспонирования)
k⇒Q2 OL2 Q1⇒m ↑(m>32)1 *begin(L1,m/L2) →5 ***m - число строк(=число столбцов в матрице после транспонирования)
§1 ⁻i ***e - число строк, которое занимает число
§2 *transpositionBig(L1,k,e/L2) ⁻j
§3 ∆i ↑(i>e)4 j@>L2 →3
§4 *printbigmat(32,e,L2/)
§5 **

rankBig(L2,n/r) ***n - количество строк(больших) в матрице
Ok @+L3(1000) OL3 L2⇒L3 Q2⇒Q3 ⁻a
§1 *notnullcolBig(L3,k,e/i) ↑(i=a)4 *upperoneBig(L3,k,i,e/j) ↑(k=j)2 *swap(L3,k,j,e/L3)
§2 *downxorbig(L3,i,k,e/L3)
§3  ∆k ↑(k=n)4 →1
§4 k⇒r *printbigmat(32,e,L3/) **

transpositionBig(L1,k,e/L2) ***e-число строк, которое занимает число, k-число столбцов
k*e-1⇒Q2
OL2 ⁻i
§1 ∆i ↑(i=Q1)3 L1i⇒m
§2 ↑X1mj j*e⇒j i:32+j⇒j Z⇒q L2j∨Iq⇒L2j →2  ***в Z - остаток от деления i 32
§3 **

printbigmat(m,e,L1/)
	Oi @+F2(32)
§1 ↑(i≥Q1)4 Oj
§2 ↑(j=e)3
			j+i⇒k
			*output2(L1k,m/F2) /F2>C
			OQ2
			∆j →2
§3 /'\n'>C i+e⇒i →1
§4 **

downxorbig(L2,i,j,m/L2)
i>5⇒q i&31⇒r Ir⇒x j⇒k*m+q⇒t *** q,r - "координаты" i-го столбца в "секции" (№ строки и № бита)
§1 ∆k t+m⇒t ↑(t≥Q2)2 L2t&x ↪1 *big_xor(L2,j,k,m/L2) →1
§2 **

big_xor(L1,j,k,m/L1) *** прибавить к k-й секции j-ю, m - размер секции
   j*m⇒j+m⇒e k*m⇒k
§1 L1j⊕L1k⇒L1k ∆k ∆j⊕e↦1
**

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
