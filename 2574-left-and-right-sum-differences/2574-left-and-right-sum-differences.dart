class Solution {
  List<int> leftRightDifference(List<int> nums) {
    int n = nums.length;
    List<int> result = List.filled(n, 0);

    int totalSum = 0;
    for (int num in nums) {
      totalSum += num;
    }

    int leftSum = 0;

    for (int i = 0; i < n; i++) {
      totalSum -= nums[i]; 

      int diff = leftSum - totalSum;
      result[i] = diff < 0 ? -diff : diff;

      leftSum += nums[i];
    }

    return result;
  }
}