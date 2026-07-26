class Solution {
  int maximumProduct(List<int> nums) {
    nums.sort((a, b) => a.compareTo(b));

    int max = nums.last;
    int max2 = nums[nums.length-2];
    int max3 = nums[nums.length-3];

    if(max < 0){
        return max * max2 * max3;
    }

    if(nums.length > 3){
    
        int first = nums.first;
        int second = nums[1];

        if(first * second > max2 * max3){
            return max * first * second;
        }
    }

    return max * max2 * max3;
  }
}