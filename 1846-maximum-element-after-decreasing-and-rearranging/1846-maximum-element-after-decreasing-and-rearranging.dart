class Solution {
  int maximumElementAfterDecrementingAndRearranging(List<int> arr) {
    arr.sort();
    int res = 0;
    for (int v in arr)
      res = min(res + 1, v);
    return res;
  }
}