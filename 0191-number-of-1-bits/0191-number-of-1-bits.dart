class Solution {
  int hammingWeight(int n) => n.toRadixString(2).split("").where((e) => e == "1").toList().length;
}