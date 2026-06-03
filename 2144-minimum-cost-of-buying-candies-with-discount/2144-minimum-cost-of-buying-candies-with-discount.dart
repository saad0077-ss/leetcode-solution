class Solution {
  int minimumCost(List<int> cost) {
    cost.sort((a, b) => b.compareTo(a));

    int total = 0;

    for (int i = 0; i < cost.length; i++) {
      if ((i + 1) % 3 != 0) {
        total += cost[i];
      }
    }

    return total;
  }
}