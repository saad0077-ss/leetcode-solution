import 'dart:math';

class Solution {
  int largestOverlap(List<List<int>> img1, List<List<int>> img2) {
    int n = img1.length;
    List<List<int>> ones1 = [];
    List<List<int>> ones2 = [];

    for (int r = 0; r < n; r++) {
      for (int c = 0; c < n; c++) {
        if (img1[r][c] == 1) ones1.add([r, c]);
        if (img2[r][c] == 1) ones2.add([r, c]);
      }
    }

    Map<int, int> count = {};
    int maxOverlap = 0;

    for (var p1 in ones1) {
      for (var p2 in ones2) {
        int key = (p1[0] - p2[0] + 100) * 1000 + (p1[1] - p2[1] + 100);
        count[key] = (count[key] ?? 0) + 1;
        maxOverlap = max(maxOverlap, count[key]!);
      }
    }

    return maxOverlap;
  }
}