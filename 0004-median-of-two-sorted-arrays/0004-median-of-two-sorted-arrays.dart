class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    List<int> sumArray = nums1 + nums2;
    sumArray.sort();
    int medium = sumArray.length ~/ 2;
    if (sumArray.length.isOdd) {
      return sumArray[medium].toDouble();
    } else {
      return (sumArray[medium] + sumArray[medium - 1]) / 2.0;
    }
  }
}