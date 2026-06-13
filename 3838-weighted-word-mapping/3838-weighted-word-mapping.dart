class Solution {
  String mapWordWeights(List<String> words, List<int> weights) {
    int base = 'a'.codeUnitAt(0);
    int zCode = 'z'.codeUnitAt(0);
    
    return words.map((word) {
      int sum = 0;
      for (int i = 0; i < word.length; i++) {
        sum += weights[word.codeUnitAt(i) - base];
      }
      return String.fromCharCode(zCode - (sum % 26));
    }).join('');
  }
}
 
