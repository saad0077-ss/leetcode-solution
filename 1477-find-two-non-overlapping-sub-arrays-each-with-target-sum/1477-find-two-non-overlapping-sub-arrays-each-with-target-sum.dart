class Solution {
  int minSumOfLengths(List<int> arr, int target) {
  final n = arr.length;
  const max = 1000000000; 

  final left = List<int>.filled(n, max);
  int l = 0, sum = 0;
  for (int r = 0; r < n; r++) {
    sum += arr[r];
    while (sum > target && l <= r) {
      sum -= arr[l++];
    }
    if (sum == target) {
      left[r] = r - l + 1;
    }
  }
  for (int i = 1; i < n; i++) {
    if (left[i - 1] < left[i]) left[i] = left[i - 1];
  }

  final right = List<int>.filled(n, max);
  int r = n - 1;
  sum = 0;
  for (int i = n - 1; i >= 0; i--) {
    sum += arr[i];
    while (sum > target && r >= i) {
      sum -= arr[r--];
    }
    if (sum == target) {
      right[i] = r - i + 1;
    }
  }
  for (int i = n - 2; i >= 0; i--) {
    if (right[i + 1] < right[i]) right[i] = right[i + 1];
  }

  int ans = max;
  for (int i = 0; i < n - 1; i++) {
    if (left[i] < max && right[i + 1] < max) {
      final curLen = left[i] + right[i + 1];
      if (curLen < ans) ans = curLen;
    }
  }
  return ans == max ? -1 : ans;

  }
}