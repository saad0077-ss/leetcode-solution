import 'package:collection/collection.dart';

class Solution {
  double findMaxAverage(List<int> nums, int k) {
    int k_sum = nums.sublist(0, k).sum;
    int m = k_sum;
    
    for(int i = k; i < nums.length; i++){
        k_sum += nums[i];
        k_sum -= nums[i - k];
        m = k_sum > m ? k_sum : m;
    }
    return m / k;

  }
}