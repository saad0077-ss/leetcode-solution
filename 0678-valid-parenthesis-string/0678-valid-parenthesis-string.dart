class Solution {
  bool checkValidString(String s) {
    var cMin = 0, cMax = 0;
    for (var i = 0; i < s.length; i++) {
      switch (s[i]) {
        case '(':
          cMax++;
          cMin++;
        case ')':
          cMax--;
          cMin--;
        case '*':
          cMax++;
          cMin--;
      }
      if (cMax < 0) return false;
      cMin = max(cMin, 0);
    }
    return cMin == 0;
  }
}