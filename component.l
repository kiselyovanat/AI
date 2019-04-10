head(/)
@+F1(100) @+L2(1000) @+L3(1000)
***/'Введите название файла \n'>C /F1<C 
0⇒r 1⇒a *n2s(a/F1)
*fopen(F1,r/d) 0⇒b⇒Q1 1⇒l 
***getnumber(d,F1,b,l/k) OQ1 *getnumber(d,F1,b,l/m) 
5⇒k⇒m OQ1 Ik⇒n ***число строк в матрице
 ⁻i 
§1 ∆i ↑(i=n)2 *getvector(d,F1,b,l/v) v@>L2 →1
§2  *fclose(d/) ⁻i *printmat(m,L2/) OQ3
§3 ∆i ↑(i=n)4 L2i&1⇒L3i ∆Q3 →3 ***первая компонентная функция равна первой(нулевой) компоненте
§4 ***/'comp \n'>C *printmat(1,L3/) 
*aif(L3,k/a) a⇒s Im⇒y 1⇒j 
OQ1 /'aif '>C *n2s(a/F1) /F1>C /'\n'>C ***j -номер комп. ф-ии
§5 ∆j ↑(j>y)6 ***/'comp \n'>C 
*getcomp(L3,j,L2/L3) ***printmat(1,L3/) 
*aif(L3,k/a) 
OQ1 /'aif '>C *n2s(a/F1) /F1>C /'\n'>C 
↑(a≥s)5 a⇒s →5 *** s - минимальное значение АИ
§6 /'Компонентная АИ = '>C OQ1 *n2s(s/F1) /F1>C /'\n'>C **

***L1-предыдущая компонентная,i-номер комп.фии L2-бул. ф-ия, 
***m-номер различающейся компоненты/L1 - очередная комп. ф-ия
getcomp(L1,i,L2/L1)
@+F4(100) OQ4
§1 i-1⇒x x>1⇒y x⊕y⇒b i>1⇒y i⊕y⇒c b⊕c⇒m ***n2s(m/F4) /'m= '>C /F4>C /'\n'>C
§2 *comp(L1,L2,m/L1) **


comp(L1,L2,m/L1) ***L1-предыдущая компонентная,L2-бул. ф-ия, m-номер различающейся компоненты/L1 - очередная комп
⁻j @+F3(100)
§1 ∆j ↑(j=Q2)3
§2 L2j&m⇒x  ↑(x=0)1 ***/'x = '>C *n2s(x/F3) /F3>C /'\n'>C 
1⊕L1j⇒L1j  →1
§3 **

aif(L1,n/a)
1⇒m *basicAI(L1,n,m/a)  
**

aif(L1,n/a)
1⇒m *basicAI(L1,n,m/a) **

getnumber(d,F1,b,l/a)
@+F2(100) @'\n'>F2 Op
§1 *freadf(d,F1,b,l/k) ↑(F1p=F2.0)2 ∆b ∆Q1⇒p →1
§2 *s2n(F1/a)  **

getvector(d,F1,b,l/v)
@+F2(100) @'\n'>F2 Op
§1 *freadf(d,F1,b,l/k)↑(F1p=F2.0)2 ∆b ∆Q1⇒p →1
§2 *input2(F1/v) **
