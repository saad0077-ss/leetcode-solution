class Solution {
List<int> findSubstring(String s, List<String> words) {
  List<int> indices = [];
  int wordLength = words[0].length;
  int wordCount = words.length;
  int totalLength = wordLength * wordCount;

  if (s.length < totalLength) return indices;

  // إنشاء HashMap لتخزين تكرارات الكلمات في words
  Map<String, int> wordFreq = {};
  for (String word in words) {
    wordFreq[word] = (wordFreq[word] ?? 0) + 1;
  }

  // تمرير النافذة على `s`
  for (int i = 0; i < wordLength; i++) {
    int left = i;
    int right = i;
    Map<String, int> windowFreq = {};
    int matchedWords = 0;

    while (right + wordLength <= s.length) {
      String word = s.substring(right, right + wordLength);
      right += wordLength;

      if (wordFreq.containsKey(word)) {
        windowFreq[word] = (windowFreq[word] ?? 0) + 1;

        if (windowFreq[word] == wordFreq[word]) {
          matchedWords++;
        }

        // إذا زاد عدد الكلمات عن المطلوب، نحرك `left` للأمام
        while (windowFreq[word]! > wordFreq[word]!) {
          String leftWord = s.substring(left, left + wordLength);
          left += wordLength;

          if (windowFreq[leftWord] == wordFreq[leftWord]) {
            matchedWords--;
          }

          windowFreq[leftWord] = windowFreq[leftWord]! - 1;
        }

        if (matchedWords == wordFreq.length) {
          indices.add(left);
        }
      } else {
        windowFreq.clear();
        matchedWords = 0;
        left = right;
      }
    }
  }
  return indices;
}

}