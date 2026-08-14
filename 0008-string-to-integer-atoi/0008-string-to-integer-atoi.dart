class Solution {
 int myAtoi(String s) {
  int i = 0;
  int n = s.length;
  int sign = 1;
  int result = 0;

  const int INT_MAX = 2147483647;
  const int INT_MIN = -2147483648;

  // Step 1: Skip leading whitespaces
  while (i < n && s[i] == ' ') {
    i++;
  }

  // Step 2: Check for sign
  if (i < n && (s[i] == '+' || s[i] == '-')) {
    sign = s[i] == '-' ? -1 : 1;
    i++;
  }

  // Step 3: Read digits
  while (i < n && s.codeUnitAt(i) >= '0'.codeUnitAt(0) && s.codeUnitAt(i) <= '9'.codeUnitAt(0)) {
    int digit = s.codeUnitAt(i) - '0'.codeUnitAt(0);

    // Step 4: Check for overflow
    if (result > (INT_MAX - digit) ~/ 10) {
      return sign == 1 ? INT_MAX : INT_MIN;
    }

    result = result * 10 + digit;
    i++;
  }

  return result * sign;
}
void main() {
  print(myAtoi("42"));              // 42
  print(myAtoi("   -042"));         // -42
  print(myAtoi("1337c0d3"));        // 1337
  print(myAtoi("0-1"));             // 0
  print(myAtoi("words and 987"));   // 0
  print(myAtoi("91283472332"));     // 2147483647
  print(myAtoi("-91283472332"));    // -2147483648
}

}