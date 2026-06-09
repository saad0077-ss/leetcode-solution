class Solution {
  int maxTotalValue(List<int> nums, int k) {
    if(nums.isEmpty){
        return 0;
    }

    int maxVal = nums[0];
    int minVal = nums[0];

    for(int num in nums){
        if(num > maxVal){
             maxVal = num;
        }
        if(num < minVal){
             minVal = num;
        }


    }

    return k *  (maxVal - minVal);
  }
}