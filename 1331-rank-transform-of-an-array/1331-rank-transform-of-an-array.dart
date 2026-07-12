class Solution {
  List<int> arrayRankTransform(List<int> arr) {
    final list = arr.toList()..sort();
    final map =
        list.toSet().toList().asMap().map((key, value) => MapEntry(value, key));
    return arr.map((e) => map[e]! + 1).toList();
  }
}