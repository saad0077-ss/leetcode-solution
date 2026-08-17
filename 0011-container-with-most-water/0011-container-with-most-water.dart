class Solution {
  int maxArea(List<int> height) {
    int leftIndex = 0;
    int rightIndex = height.length - 1;
    int maxStoredWater = 0;

    while (leftIndex < rightIndex) {
      final leftHeight = height[leftIndex];
      final rightHeight = height[rightIndex];
      final width = rightIndex - leftIndex;
      final smallerHeight = leftHeight < rightHeight ? leftHeight : rightHeight;
      final storedWater = width * smallerHeight;

      maxStoredWater = storedWater > maxStoredWater ? storedWater : maxStoredWater;
      smallerHeight == leftHeight ? leftIndex++ : rightIndex--;
    }

    return maxStoredWater;
  }
}