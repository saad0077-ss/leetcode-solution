class Solution {
  int reverseDegree(String s) {
    int sum =0;

    for(int i=0;i<s.length;i++){
        int normalPos = s[i].codeUnitAt(0) - 'a'.codeUnitAt(0) + 1;

        int reverseDegree = 27 - normalPos;

        sum += (i+1)*reverseDegree;
    }

    return sum;
  }
}