class Binary_lifting:
    def __init__(self,n,edges,root=1):
        self.log=n.bit_length()
        self.up=[[-1] *self.log for _ in range(n+1)]
        self.depth=[0]*(n+1)
        self.build(root,edges)

    def build(self,node,edges):

        def dfs(node,parent):
            self.up[node][0]=parent
            for j in range(1,self.log):
                if self.up[node][j-1]!=-1:
                    self.up[node][j]=self.up[self.up[node][j-1]][j-1]
            
            for nei in edges[node]:
                if nei ==parent:
                    continue
                self.depth[nei]=self.depth[node]+1
                dfs(nei,node)

        dfs(node,-1)

    def kth_ancestor(self,node,k):
        for j in range(self.log):
            if k & (1<<j):
                node=self.up[node][j]
                if node==-1:
                    return -1
        return node

    def LCA(self,u,v):
        if self.depth[u]<self.depth[v]:
            u,v=v,u

        diff=self.depth[u]-self.depth[v]
        u=self.kth_ancestor(u,diff)
        if u==v:
            return v
        
        for j in range(self.log-1,-1,-1):
            if self.up[u][j]!=self.up[v][j]:
                u=self.up[u][j]
                v=self.up[v][j]

        return self.up[u][0]

class Solution(object):
    def assignEdgeWeights(self, edges, queries):
        """
        :type edges: List[List[int]]
        :type queries: List[List[int]]
        :rtype: List[int]
        """
        graph=defaultdict(list)
        n=len(edges)+1

        for u,v in edges:
            graph[v].append(u)
            graph[u].append(v)

        obj=Binary_lifting(n,graph)

        res=[]
        mod=10**9+7
        for u,v in queries:
            if v==u:
                res.append(0)
                continue
            lca=obj.LCA(u,v)
            total=(obj.depth[u]-obj.depth[lca])+(obj.depth[v]-obj.depth[lca])
            
            ans=pow(2,total-1,mod)
            res.append(ans)

        return res