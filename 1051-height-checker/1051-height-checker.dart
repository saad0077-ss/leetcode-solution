class Solution {
  int heightChecker(List<int> heights) {
    List<int> sorted = List.from(heights);

    for(int i =0;i<sorted.length-1;i++){
        for(int j=0;j<sorted.length-1-i;j++){
            if(sorted[j] > sorted[j+1]){
                int temp = sorted[j];
                sorted[j] = sorted[j+1];
                sorted[j+1] = temp;
            }
        }
    }

    int count =0;

    for(int i =0;i<heights.length;i++){
        if(heights[i] != sorted[i]){
            count++;

        }
    }
    return count;
  }


}