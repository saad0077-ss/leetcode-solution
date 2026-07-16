class Solution {
  int gcd(int a, int b) {
    while (b != 0) {
      int temp = a % b;
      a = b;
      b = temp;
    }
    return a;
  }

  int gcdSum(List<int> nums) {
    int n = nums.length;
    List<int> prefixGcd = List.filled(n, 0);

    int mx = 0;
    for (int i = 0; i < n; i++) {
      if (nums[i] > mx) {
        mx = nums[i];
      }
      prefixGcd[i] = gcd(nums[i], mx);
    }

    prefixGcd.sort();

    int ans = 0;
    for (int i = 0; i < n ~/ 2; i++) {
      ans += gcd(prefixGcd[i], prefixGcd[n - 1 - i]);
    }

    return ans;
  }
}