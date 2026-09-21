class Solution {
  List<int> resultArray(List<int> nums, int k) {
    List<int> result = List.filled(k, 0);
    List<int> dp = List.filled(k, 0);

    for (int num in nums) {
      int v = num % k;
      List<int> nextDp = List.filled(k, 0);
      nextDp[v]++;
      for (int r = 0; r < k; r++) {
        if (dp[r] > 0) {
          nextDp[(r * v) % k] += dp[r];
        }
      }
      dp = nextDp;
      for (int r = 0; r < k; r++) {
        result[r] += dp[r];
      }
    }
    return result;
  }
}