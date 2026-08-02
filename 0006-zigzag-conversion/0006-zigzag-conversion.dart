class Solution {
  String convert(String s, int numRows) {
    List<List<String>> rows = List.generate(numRows, (_) => []);
    try {
      for (int i = 0; i < s.length; i++) {
        int rowIndex = i % (2 * numRows - 2);
        if (rowIndex >= numRows) {
          rowIndex = 2 * numRows - 2 - rowIndex;
        }
        rows[rowIndex].add(s[i]);
      }


      String result = rows.expand((row) => row).join();
      return result;
    } catch (e) {
      return s;
    }
  }
}