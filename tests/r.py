from random import *
f = open('3', 'w')
k = 5
n = 2**8
for i in range(0,n):
    g = getrandbits(k)
    f.write(format(g, '05b')+'\n')
f.close()
