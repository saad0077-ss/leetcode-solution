class Solution {
  int maxPalindromes(String s, int k) {
    final palindromes = <(int, int)>[];

    for (int i = 0;i<s.length;i++){
        int l = i;
        int r = l + k - 1;
        while (l < s.length && r < s.length) {
            if (s[l] == s[r]) {
                if (isPalindrome(s.substring(l, r+1))) {
                    palindromes.add((l,r));
                    break;
                }
            }
            r++;
        }
    }

    int res = 0;

    palindromes.sort((a, b){
        if (a.$2 == b.$2){
            return a.$1.compareTo(b.$1);
        }
        return a.$2.compareTo(b.$2);
    });

    (int, int)? prev;

    for (final palindrome in palindromes) {
        if (prev == null) {
            res++;
            prev = palindrome;
        }

        if (prev.$2 < palindrome.$1) {
            res++;
            prev = palindrome;
        }
    }

    return res;
  }

  bool isPalindrome(String s) {
    int l=0;
    int r= s.length -1;

    while (l < r) {
        if(s[l++] != s[r--]){
            return false;
        }
    }

    return true;
  }
}