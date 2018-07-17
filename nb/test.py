
import json as a
from sys import argv
w=[]
n,o=argv[1:3]
n=open(n,'r')

k,v=a.load(n)
k,v=sorted(k),sorted(v)
c=dict([ (i,i) for i in k if i in set(v)])
print(len(c))
m=dict(zip(k,v))
for i in range(0,len(w),3):
    if w[i+2]!=1:
        for j in range(w[i+2]):
            m[k[w[i+1]+j]]=v[w[i]+j]
    else:
        for j in range(len(w[i+1])):
            m[k[w[i+1][j]]]=v[w[i]+j]
o=open(o,'w')
o.write(a.dumps(m))
o.close()
    