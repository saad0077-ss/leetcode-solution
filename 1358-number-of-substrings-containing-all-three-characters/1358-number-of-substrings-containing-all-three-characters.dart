class Solution {
 int numberOfSubstrings(String s) {
    int left = 0;
    int count = 0;

  // Map to track character frequency
  Map<String, int> map = {'a': 0, 'b': 0, 'c': 0};

  for (var right = 0; right < s.length; right++) {
    map[s[right]] = (map[s[right]] ?? 0) + 1;
     print(map);

    while (map['a']! > 0 && map['b']! > 0 && map['c']! > 0) {
      count += s.length - right; 
      map[s[left]] = map[s[left]]! - 1; 
      left++; 
    }
  }

  return count;
  }
}