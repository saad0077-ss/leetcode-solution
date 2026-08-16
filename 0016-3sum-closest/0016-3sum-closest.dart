// Time Complexity: $O(N^2)$ where N is the length of the array.
// Space Complexity: $O(1)$ auxiliary space.

class Solution {
  int threeSumClosest(List<int> nums, int target) {
    nums.sort();
    int closestSum = nums[0] + nums[1] + nums[2];
    for (int i = 0; i < nums.length - 2; i++) {
      
      if (i > 0 && nums[i] == nums[i - 1]) {
        continue;
      }

      int left = i + 1;
      int right = nums.length - 1;

      while (left < right) {
        int currentSum = nums[i] + nums[left] + nums[right];

        if (currentSum == target) {
          return currentSum;
        }

        if ((target - currentSum).abs() < (target - closestSum).abs()) {
          closestSum = currentSum;
        }

        if (currentSum < target) {
          left++; 
        } else {
          right--; 
        }
      }
    }

    return closestSum;
  }
}