from random import *
f = open('3', 'w')
k = 9
n = 2**9
for i in range(0,n):
    g = getrandbits(k)
    f.write(format(g, '09b')+'\n')
f.close()
