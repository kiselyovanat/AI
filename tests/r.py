from random import *
f = open('3', 'w')
k = 10
n = 2356
for i in range(0,n):
    g = str(bin(randrange(2**(k-1), (2**k-1))))
    f.write(g[2:]+'\n')
f.close()
