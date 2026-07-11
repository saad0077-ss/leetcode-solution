class Solution {
  int countCompleteComponents(int n, List<List<int>> edges) {
    Map<int, List<int>> graph = {};
    Set<int> visited = {};

    for (int i = 0; i < n; i++) {
      graph[i] = [];
    }
    for (var edge in edges) {
      graph[edge[0]]!.add(edge[1]);
      graph[edge[1]]!.add(edge[0]);
    }

    int completeCount = 0;

    void dfs(int node, Set<int> componentNodes) {
      if (visited.contains(node)) return;
      visited.add(node);
      componentNodes.add(node);
      for (var neighbor in graph[node]!) {
        dfs(neighbor, componentNodes);
      }
    }

    for (int i = 0; i < n; i++) {
      if (!visited.contains(i)) {
        Set<int> componentNodes = {};
        dfs(i, componentNodes);
        
        int componentSize = componentNodes.length;
        int expectedEdges = (componentSize * (componentSize - 1)) ~/ 2;
        int actualEdges = 0;

        for (var node in componentNodes) {
          actualEdges += graph[node]!.length;
        }
        actualEdges ~/= 2; 

        if (actualEdges == expectedEdges) {
          completeCount++;
        }
      }
    }

    return completeCount;
  }
}