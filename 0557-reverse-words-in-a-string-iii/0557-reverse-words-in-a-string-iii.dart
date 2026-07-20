class Solution {
  String reverseWords(String s) {
    List<String> words = s.split(" ");

    for (int i = 0; i < words.length; i++) {
      List<String> chars = words[i].split("");
      int left = 0;
      int right = chars.length - 1;

      while (left < right) {
        String temp = chars[left];
        chars[left] = chars[right];
        chars[right] = temp;

        ++left;
        --right;
      }
        
      left = 0;
      words[i] = chars.join("");
    }

    return words.join(" ");
  }
}