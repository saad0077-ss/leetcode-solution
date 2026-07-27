class Solution {
  List<int> runningSum(List<int> nums) {
    int sum =0;
    List<int> ans=[];
    for(int i=0;i<nums.length;i++){
        sum = sum + nums[i];
        ans.add(sum);
    }
    return ans;
  }
}