class Solution {
  List<int> sortArray(List<int> nums) {
    return mergeSort(nums);
  }

  List<int> mergeSort(List<int> arr){
    if(arr.length <= 1){
        return arr;
    }

    int mid = arr.length ~/2;

    List<int> left = arr.sublist(0,mid);
    List<int> right = arr.sublist(mid);

    left = mergeSort(left);
    right = mergeSort(right);

    return merge(left,right);
  }

  List<int> merge(List<int> left,List<int> right){
    List<int> result = [];

    int i =0;
    int j =0;

    while(i < left.length && j < right.length){
        if(left[i] <= right[j]){
            result.add(left[i]);
            i++;
        }else{
            result.add(right[j]);
            j++;
        }
    }

    while(i < left.length){
        result.add(left[i]);
        i++;
    }

    while(j < right.length){
        result.add(right[j]);
        j++;
    }

    return result;
  }
}