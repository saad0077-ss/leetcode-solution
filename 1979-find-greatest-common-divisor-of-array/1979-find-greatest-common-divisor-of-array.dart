class Solution {
  int findGCD(List<int> nums) {
    int result = 0;
    nums.sort();
    for(int i = 1;i<=nums.last;i++){
        if(nums.first%i==0 && nums.last%i==0){
            result = i;
        }
    }
    return result;
  }
}