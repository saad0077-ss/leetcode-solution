import 'dart:math';

class Solution {
  List<int> gcdValues(List<int> nums, List<int> queries) {
    int maxVal = nums.reduce(max);

    List<int> freq = List.filled(maxVal + 1, 0);

    for (int x in nums) {
      freq[x]++;
    }

    List<int> exact = List.filled(maxVal + 1, 0);

    for (int d = maxVal; d >= 1; d--) {
      int cnt = 0;

      for (int m = d; m <= maxVal; m += d) {
        cnt += freq[m];
      }

      int pairs = cnt * (cnt - 1) ~/ 2;

      for (int m = d * 2; m <= maxVal; m += d) {
        pairs -= exact[m];
      }

      exact[d] = pairs;
    }

    List<int> prefix = List.filled(maxVal + 1, 0);

    for (int i = 1; i <= maxVal; i++) {
      prefix[i] = prefix[i - 1] + exact[i];
    }

    List<int> ans = [];

    for (int q in queries) {
      int l = 1;
      int r = maxVal;

      while (l < r) {
        int mid = (l + r) ~/ 2;

        if (prefix[mid] > q) {
          r = mid;
        } else {
          l = mid + 1;
        }
      }

      ans.add(l);
    }

    return ans;
  }
}