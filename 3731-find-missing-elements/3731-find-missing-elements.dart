class Solution {
  List<int> findMissingElements(List<int> nums) {
    nums.sort();
    List<int> a=[];
    for(int i=0;i<nums.length-1;i++){
        if(nums[i]+1!=nums[i+1]){
            for(int j=nums[i]+1;j<nums[i+1];j++){
                a.add(j);
            }
        }
    }
    return a;
  }
}