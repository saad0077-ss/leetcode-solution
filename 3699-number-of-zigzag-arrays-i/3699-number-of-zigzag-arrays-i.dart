class Solution {
  static const int MOD = 1000000007;

  int zigZagArrays(int n, int l, int r) {
    int m = r - l + 1;

    List<int> up = List.filled(m, 0);
    List<int> down = List.filled(m, 0);

    // Length = 2 initialization
    for (int i = 0; i < m; i++) {
      up[i] = i;           // smaller values before it
      down[i] = m - 1 - i; // larger values before it
    }

    // Already built arrays of length 2
    for (int len = 3; len <= n; len++) {
      List<int> prefixUp = List.filled(m + 1, 0);
      List<int> prefixDown = List.filled(m + 1, 0);

      for (int i = 0; i < m; i++) {
        prefixUp[i + 1] = (prefixUp[i] + up[i]) % MOD;
        prefixDown[i + 1] = (prefixDown[i] + down[i]) % MOD;
      }

      List<int> newUp = List.filled(m, 0);
      List<int> newDown = List.filled(m, 0);

      for (int i = 0; i < m; i++) {
        // Need previous value < current
        newUp[i] = prefixDown[i];

        // Need previous value > current
        newDown[i] =
            (prefixUp[m] - prefixUp[i + 1] + MOD) % MOD;
      }

      up = newUp;
      down = newDown;
    }

    int ans = 0;

    for (int x in up) {
      ans = (ans + x) % MOD;
    }

    for (int x in down) {
      ans = (ans + x) % MOD;
    }

    return ans;
  }
}