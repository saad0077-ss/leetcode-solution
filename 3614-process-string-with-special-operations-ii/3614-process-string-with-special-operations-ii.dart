class Solution {
  String processStr(String s, int k) {
    int len = 0;

    // Calculate final length
    for (int i = 0; i < s.length; i++) {
      String c = s[i];

      if (c == '*') {
        len = len > 0 ? len - 1 : 0;
      } else if (c == '#') {
        len *= 2;
      } else if (c == '%') {
        // length unchanged
      } else {
        len++;
      }
    }

    if (k >= len) return '.';

    int pos = k;

    // Reverse process
    for (int i = s.length - 1; i >= 0; i--) {
      String c = s[i];

      if (c == '*') {
        len++;
      } else if (c == '#') {
        len ~/= 2;

        if (pos >= len) {
          pos -= len;
        }
      } else if (c == '%') {
        pos = len - 1 - pos;
      } else {
        len--;

        if (pos == len) {
          return c;
        }
      }
    }

    return '.';
  }
}