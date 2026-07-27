class Solution {
  List<int> buildArray(List<int> nums) {
    List<int> ans = [];
    for(int i=0;i<nums.length;i++){
        ans.add(nums[nums[i]]);
    }
    return ans;
  }
}