class Solution {
  int lengthOfLongestSubstring(String s) {
    int left = 0;
    int maxLength = 0;
    Set<String> seen = {};
    for (int i = 0; i < s.length; i++) {
      while (seen.contains(s[i])) {
        seen.remove(s[left]);
        left++;
      }
      seen.add(s[i]);
      int currentLength = i - left + 1;
      if (currentLength > maxLength) {
        maxLength = currentLength;
      }
    }
    return maxLength;
  }
}
