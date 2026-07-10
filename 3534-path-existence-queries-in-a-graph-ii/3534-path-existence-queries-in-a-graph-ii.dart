class Solution {
  List<int> pathExistenceQueries(
      int n,
      List<int> nums,
      int maxDiff,
      List<List<int>> queries) {
    List<List<int>> pairs = [];

    for (int i = 0; i < n; i++) {
      pairs.add([nums[i], i]);
    }

    pairs.sort((a, b) => a[0].compareTo(b[0]));

    const int LOG = 20;
    List<List<int>> jump =
        List.generate(n, (_) => List.filled(LOG, 0));

    int r = n - 1;

    for (int l = n - 1; l >= 0; l--) {
      while (pairs[r][0] - pairs[l][0] > maxDiff) {
        r--;
      }

      int from = pairs[l][1];
      int to = pairs[r][1];

      jump[from][0] = to;

      for (int k = 1; k < LOG; k++) {
        jump[from][k] = jump[jump[from][k - 1]][k - 1];
      }
    }

    List<int> ans = [];

    for (var q in queries) {
      int u = q[0];
      int v = q[1];

      if (nums[u] > nums[v]) {
        int temp = u;
        u = v;
        v = temp;
      }

      if (u == v) {
        ans.add(0);
        continue;
      }

      if (nums[u] == nums[v]) {
        ans.add(1);
        continue;
      }

      int dist = 0;

      for (int k = LOG - 1; k >= 0; k--) {
        if (nums[jump[u][k]] < nums[v]) {
          dist |= (1 << k);
          u = jump[u][k];
        }
      }

      if (nums[jump[u][0]] < nums[v]) {
        ans.add(-1);
      } else {
        ans.add(dist + 1);
      }
    }

    return ans;
  }
}