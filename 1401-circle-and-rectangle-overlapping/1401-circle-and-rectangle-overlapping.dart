class Solution {
  bool checkOverlap(int radius, int xCenter, int yCenter, int x1, int y1, int x2, int y2) {
      final miniX = max(x1, min(x2, xCenter));
      final miniY = max(y1, min(y2, yCenter));
      final distance = sqrt(pow(miniX - xCenter, 2) + pow(miniY - yCenter, 2)).toInt();
      return distance <= radius;
  }
}