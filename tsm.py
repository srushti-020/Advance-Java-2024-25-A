from sys import maxsize
from itertools import permutations
v=4

def travelling(graph,s):
    vertex=[]
    for i in range(v):
        if i!=s:
            vertex.append(i)
            print(i)
    minpath = maxsize
    np = permutations(vertex)
    for i in np:
        print('Permutation ',i)
        currentpathw=0
        k=s
        for j in i:
            currentpathw+=graph[k][j]
            k=j
        currentpathw+=graph[k][s]
        print(currentpathw)
        minpath=min(minpath, currentpathw)
    return minpath


if __name__ == "__main__":
    graph=[[0,10,15,20],[10,0,35,25],[15,35,0,30],[20,25,30,0]]
    s=0
    print("Srushti Sanghani - 53003220007\n")
    print("The minimum path cost is:",travelling(graph,s))
