class Solution {
  List<int> pivotArray(List<int> nums, int pivot) {
    List<int> smaller = [];
    List<int> equal = [];
    List<int> greater = [];

    for(int num in nums){
        if(num < pivot){
            smaller.add(num);
        }else if(num == pivot){
            equal.add(num);
        }else {
            greater.add(num);
        }
    }

    return [...smaller,...equal,...greater];
  }
}