*** перевод строки в число***
*** s2n(F1,q/a)***
***	⁻i Oa ***
*** §1	∆i⊕Q1↪2 *c2n(F1i/b) a*q+b⇒a →1 ***
*** §2	** ***

*** перевод цифры в число
c2n(a/b)
	a-'0'⇒b ↑(b<10)1 a-'A'+10⇒b ↑(a≤'Z')1  a-'a'+10⇒b
§1 	**

*** перевод числа в цифру
n2c(a/b)
	a+'0'⇒b ↑(a<10)1 a-10+'A'⇒b
§1	**

*** перевод числа в строку ***
n2(a,q/F1)
OQ1
§1	a/q⇒a Z⇒b *n2c(b/c) c@>F1 a↦1
Oi Q1-1⇒j
§3	↑(i≥j)4 ⇔(F1ij) ∆i ∇j →3
§4	**

*** перевод знакового числа в строку
nsign2s(a/F1)
	10⇒d OQ1 Oi a&I31↪1 '-'@>F1 ∆i a¬+1⇒a
§1	a/d⇒a Z⇒b *n2c(b/c) c@>F1 a↦1
	Q1-1⇒j
§3	↑(i≥j)4 ⇔(F1ij) ∆i ∇j →3
§4	**

*** вывод массива
outmass(L1/)
   @+F2(11) ⁻i
§1 ∆i⊕Q1↪2 *nsign2s(L1i/F2) /F2>C /' '>C →1
§2 /'\n'>C **

*** вывод числа
out(a/)
	@+F1(10) *n2s(a,10/F1) /F1>C /'\n'>C **

*** вывод длинного вектора в 16-м виде
out16(L1/)
   @+F2(10) Q1⇒i
§1 ∇i *n16s(L1i/F2) /F2>C i↦1
   /'\n'>C **

n16s(a/F1)
	8⇒Q1⇒j
§1	a/16⇒a Z⇒b *n2c(b/c) ∇j c⇒F1j j↦1
	**

*** перевод строки в булев вектор
input2(F1/a)
   Oa ⁻i
§1 ∆i⊕Q1↪3 F1i⊕'0'↪1 Ii∨a⇒a →1
§3 **

*** перевод булева вектора в строку
output2(a,n/F1)
  Oi
§1 '0'⇒F1i a&Ii↪2 ∆F1i
§2 ∆i ↑(i<n)1 n⇒Q1 **

*** перевод строки в длинный булев вектор
in2(F1/L2)
   ⁻i Oj Q1+31>5⇒Q2
§1 Oa Ok
§4 ∆i⊕Q1↪3 F1i⊕'0'↪2 Ik∨a⇒a
§2 ∆k⊕32↦4 a⇒L2j ∆j →1
§3 k↪5 a⇒L2j
§5 **

*** перевод длинного булева вектора в строку
out2(L2,n/F1)
  Oi Oj Ok
§1 '0'⇒F1k L2j&Ii↪2 ∆F1k
§2 ∆k⊕n↪3 ∆i↑(i<32)1 ∆j Oi →1
§3 n⇒Q1 **

*** генерация булевой матрицы
genboolmat(n,m,r/L1)
    ⁻i 32-m⇒j r↪1
§3  X ∇r↦3
§1 ∆i⊕n↪2 X>j⇒L1i →1
§2 n⇒Q1 **

*** вывод булевой матрицы
printmat(m,L1/)
	Oi @+F2(32)
§1 ↑(i=Q1)2
        *output2(L1i,m/F2) /F2>C
***   /' вес = '>C b%=a *n2s(a,10/F2) /F2>C
      /'\n'>C ∆i →1
§2 **

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

********************************************************************
*** работа с файлами
********************************************************************
*** Открытие файла
*** F1 - имя файла (в текущем каталоге)
*** r - режим открытия: 0 - чтение, 1 - запись, 2 - чтение/запись
*** n  - дескриптор файла (<0 при отказе)
********************************************************************
fopen(F1,r/n)
   0@>F1
   {mov eax,5}
   {mov ebx,[ebp+220]}
   {mov ecx,[ebp+72]}
   {int 80h}
   {mov [ebp+56],eax}
   **
********************************************************************
*** Закрытие файла
*** n  - дескриптор файла
********************************************************************
fclose(n/)
   {mov eax,6}
   {mov ebx,[ebp+56]}
   {int 80h}
   **
********************************************************************
*** Чтение из файла в символьный комплекс
*** n  - дескриптор файла
*** F1 - файл
*** b - адрес в F1 первого считанного байта
*** l - число запрашиваемых байт
*** k - число считанных байтов (код ошибки для <0)
********************************************************************
freadf(n,F1,b,l/k)
   {mov eax,3}
   {mov ebx,[ebp+56]}
   {mov ecx,[ebp+220]}
   {add ecx,[ebp+8]}
   {mov edx,[ebp+48]}
   {int 80h}
   {mov [ebp+44],eax}
   **
********************************************************************
*** Запись из символьного комплекса в файл
*** n  - дескриптор файла
*** F1 - файл
*** b - адрес в F1 первого записываемого байта
*** l - число записывемых байт
*** k - число записанных байтов (код ошибки для <0)
********************************************************************
fwritef(n,F1,b,l/k)
   {mov eax,4}
   {mov ebx,[ebp+56]}
   {mov ecx,[ebp+220]}
   {add ecx,[ebp+8]}
   {mov edx,[ebp+48]}
   {int 80h}
   {mov [ebp+44],eax}
   **

**************************базисная алг.иммунность*******************************
basicAI(L1,n,m/a) ***n - число строк, m - выходов***
@+L2(100000000) @+F3(100)
§1 ⁻a ↑(m>n)5 ⁻y ⁻i Im⇒g
§2 ∆y ↑(y=g)6 OQ2
§3 *preimage(y,L1/L2) ↑(Q2≠0)4 →5
§4 *setAI(L2,Q2,n/b) ↑(b≥a)2 b⇒a →2
§5 Oa
§6 **

preimage(y,L1/L2)
⁻i
§1 ∆i ↑(i=Q1)2 ↑(L1i≠y)1 i@>L2 →1
§2  **


**************************алг.иммунность множества******************************
setAI(L1,l,m/a) ***l - число строк, m - число столбоцов***
@+L2(1000)
§1 *begin(L1,m/L2) 1⇒i ***транспонирование матрицы и добавление строки, состоящей из 1, m - число строк в матрице ***
§2  ↑(Q2>l)5 *rank(L2/r) ***ранг матрицы***
§3  ↑(r<Q2)5 ∆i Ii-1⇒e m-i⇒k e<k⇒s ***е - последнее сочетание, s - начальное***
§4 *monom(s,L2/L2) ↑(s=e)2 *sochz(s/s) →4
§5 i⇒a  **

begin(L1,m/L2) ***big done
m⇒Q2 OL2 ⁻i
§1 ∆i ↑(i=Q1)3 L1i⇒x
§2 ↑X1xj L2j∨Ii⇒L2j →2
§3 Ii-1@>L2 **  ***максимальный вектор записываем в конец***

rank(L2/r)
Ok @+L3(32) OL3 L2⇒L3 Q2⇒Q3
§1 *notnullcol(L3,k/i) ↑(i=32)4  *upperone(L3,k,i/j) ↑(k=j)2 ⇔(L3jk)
§2 *downxor(L3,i,k/L3)
§3  ∆k ↑(k=Q3)4 →1
§4 k⇒r **

notnullcol(L2,k/i) ***big done
k-1⇒j Ox 32⇒i
§1 ∆j ↑(j=Q2)2 L2j∨x⇒x →1
§2 x ↪3  x!⇒i
§3 **

upperone(L2,k,i/j) ***big done
Ii⇒x k-1⇒l
§1 ∆l ↑(l=Q2)3 L2l&x ↪1
§2 l⇒j
§3 **

downxor(L2,i,j/L2) ***big done
j⇒k Ii⇒x
§1 ∆k ↑(k=Q2)2 L2k&x ↪1 L2j⊕L2k⇒L2k →1
§2 **

sochz(s/s)
***/'sochz '>C
§1 s+1&s⇒b-1⊕s%-2⇒c
   s+1⊕s<1+1<c⊕b⇒s
§2 **

monom(s,L2/L2)
s⇒k ⁻x
§1 ↑X2kj L2j&x⇒x →1  *** в j - номер младшей единицы ***
§2 x@>L2 **

********************************************************************************
s2n(F1/a)
 Oa ⁻i
§1 ∆i ↑(i=Q1)2 a*10+F1i-'0'⇒a →1
§2 **

n2s(z/F1)
OQ1
§1 z;10+'0'@>F1
   z/10⇒z ↦1
   Q1-1⇒b
§2 ↑(z≥b)3 ⇔(F1zb) ∆z ∇b →2
§3 **

getvector(d,F1,b,l/v)
@+F2(100) @'\n'>F2 Op
§1 *freadf(d,F1,b,l/k)↑(F1p=F2.0)2 ∆b ∆Q1⇒p →1
§2 *input2(F1/v) **
