class Solution {
  static const int MOD = 1000000007;

  List<int> sumAndMultiply(String s, List<List<int>> queries) {
    int n = s.length;

    List<int> digits = [];
    List<int> positions = [];

    // Store non-zero digits and their positions
    for (int i = 0; i < n; i++) {
      int d = s.codeUnitAt(i) - 48;
      if (d != 0) {
        digits.add(d);
        positions.add(i);
      }
    }

    int m = digits.length;

    // Powers of 10
    List<int> pow10 = List.filled(m + 1, 1);
    for (int i = 1; i <= m; i++) {
      pow10[i] = (pow10[i - 1] * 10) % MOD;
    }

    // Prefix concatenated numbers
    List<int> prefNum = List.filled(m + 1, 0);

    // Prefix sums of digits
    List<int> prefSum = List.filled(m + 1, 0);

    for (int i = 0; i < m; i++) {
      prefNum[i + 1] = (prefNum[i] * 10 + digits[i]) % MOD;
      prefSum[i + 1] = prefSum[i] + digits[i];
    }

    // leftMap[i] = first non-zero digit index >= i
    List<int> leftMap = List.filled(n, -1);
    int idx = 0;
    for (int i = 0; i < n; i++) {
      while (idx < m && positions[idx] < i) {
        idx++;
      }
      if (idx < m) leftMap[i] = idx;
    }

    // rightMap[i] = last non-zero digit index <= i
    List<int> rightMap = List.filled(n, -1);
    idx = m - 1;
    for (int i = n - 1; i >= 0; i--) {
      while (idx >= 0 && positions[idx] > i) {
        idx--;
      }
      if (idx >= 0) rightMap[i] = idx;
    }

    List<int> answer = [];

    for (var q in queries) {
      int l = q[0];
      int r = q[1];

      int L = leftMap[l];
      int R = rightMap[r];

      if (L == -1 || R == -1 || L > R) {
        answer.add(0);
        continue;
      }

      int len = R - L + 1;

      int number =
          (prefNum[R + 1] - (prefNum[L] * pow10[len]) % MOD + MOD) % MOD;

      int sum = prefSum[R + 1] - prefSum[L];

      answer.add((number * sum) % MOD);
    }

    return answer;
  }
}