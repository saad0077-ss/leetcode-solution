class Solution {
  bool canAliceWin(List<int> nums) {
    int diff = 0;
    for(int i = 0 ; i < nums.length ; i ++){
        diff+=nums[i]<10?nums[i]:-nums[i];
    }
    return diff!=0;
  }
}