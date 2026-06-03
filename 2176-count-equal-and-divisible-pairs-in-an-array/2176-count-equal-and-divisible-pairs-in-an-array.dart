class Solution {
  int countPairs(List<int> nums, int k) {
    int count =0;
    for(int i=0;i<nums.length;i++){
        for(int j=i;j<nums.length;j++){
            if(i<j && nums[i] == nums[j]){
                if((i*j)%k ==0){
                    count++;
                }
            }
        }
    }
    return count;
  }
}