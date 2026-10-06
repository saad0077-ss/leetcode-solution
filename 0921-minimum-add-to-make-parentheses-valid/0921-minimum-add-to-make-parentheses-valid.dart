class Solution {
  int minAddToMakeValid(String s) {
    int sum = 0;
    int inserts = 0;
    for (int i=0;i<s.length;i++){
        if (s[i] == '('){
            sum++;
        } else {
            sum--;
        }
        if(sum < 0) {
            inserts++;
            sum++;
        }
    }
    if (sum > 0) {
        inserts+=sum;
    }
    return inserts;
  }
}