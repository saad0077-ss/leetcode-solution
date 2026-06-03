class Solution {
  List<int> targetIndices(List<int> nums, int target) {
    List<int> result = [];
    nums.sort();
    for(var i=0; i<nums.length;i++){
        if(nums[i]==target){
        result.add(i);
    }
    }
    return result;
  }
}