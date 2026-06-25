class Solution {
int firstMissingPositive(List<int> nums) {
  nums.sort();
  nums = nums.where((element) => element >= 0).toList();
  if (nums.isEmpty) return 1;
  int prev = nums.first;
  if (prev > 1) return 1;
  for (int v in nums) {
    if (prev + 1 == v || prev == v) {
      prev = v;
    } else {
      return prev + 1;
    }
  }
  return nums.last + 1;
}
}