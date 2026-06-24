class Solution {
  static const int MOD = 1000000007;

  List<List<int>> multiply(List<List<int>> a, List<List<int>> b) {
    int n = a.length;
    int m = b[0].length;
    int k = b.length;

    List<List<int>> res =
        List.generate(n, (_) => List.filled(m, 0));

    for (int i = 0; i < n; i++) {
      for (int t = 0; t < k; t++) {
        if (a[i][t] == 0) continue;

        for (int j = 0; j < m; j++) {
          if (b[t][j] == 0) continue;

          res[i][j] =
              (res[i][j] + a[i][t] * b[t][j]) % MOD;
        }
      }
    }

    return res;
  }

  List<List<int>> power(List<List<int>> mat, int exp) {
    int n = mat.length;

    List<List<int>> res = List.generate(
      n,
      (i) => List.generate(n, (j) => i == j ? 1 : 0),
    );

    while (exp > 0) {
      if ((exp & 1) == 1) {
        res = multiply(res, mat);
      }

      mat = multiply(mat, mat);
      exp >>= 1;
    }

    return res;
  }

  int zigZagArrays(int n, int l, int r) {
    int m = r - l + 1;
    int size = 2 * m;

    List<List<int>> trans =
        List.generate(size, (_) => List.filled(size, 0));

    // up(x) -> down(y) for y > x
    for (int x = 0; x < m; x++) {
      for (int y = x + 1; y < m; y++) {
        trans[x][m + y] = 1;
      }
    }

    // down(x) -> up(y) for y < x
    for (int x = 0; x < m; x++) {
      for (int y = 0; y < x; y++) {
        trans[m + x][y] = 1;
      }
    }

    List<int> start = List.filled(size, 1);

    List<List<int>> vec =
        List.generate(size, (i) => [start[i]]);

    List<List<int>> p = power(trans, n - 1);
    List<List<int>> ansVec = multiply(p, vec);

    int ans = 0;
    for (int i = 0; i < size; i++) {
      ans = (ans + ansVec[i][0]) % MOD;
    }

    return ans;
  }
}