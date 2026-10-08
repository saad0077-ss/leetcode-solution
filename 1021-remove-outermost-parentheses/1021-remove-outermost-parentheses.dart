class Solution {
  String removeOuterParentheses(String s) {
    String result = "";
    int val = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == "(") {
        if (val > 0) {
          result = result + "(";
        }

        val++;
      } else {
        val--;

        if (val != 0) {
          result = result + ")";
        }
      }
    }

    return result;
  }
}