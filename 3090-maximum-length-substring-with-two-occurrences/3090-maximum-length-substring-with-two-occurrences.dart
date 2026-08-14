class Solution {
  int maximumLengthSubstring(String s) {
    Map<String, int> m = {};
    var l = 0;
    var maxi = 0;
    for (int r = 0; r < s.length; r++) {
      final char = s[r];
      m[char] = (m[char] ?? 0) + 1;
      
      while (m[s[r]]! > 2) {
        final charToRemove = s[l];
        m[charToRemove] = m[charToRemove]! - 1;
        if (m[charToRemove] == 0) {
          m.remove(charToRemove);
        }
        l++;
      }
      
      if (r - l + 1 > maxi) {
        maxi = r - l + 1;
      }
    }
    return maxi;
  }
}