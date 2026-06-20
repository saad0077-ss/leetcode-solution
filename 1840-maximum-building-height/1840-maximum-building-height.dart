class Solution {
  int maxBuilding(int n, List<List<int>> restrictions) {
    // Building 1 always has height 0
    restrictions.add([1, 0]);

    // Last building can have at most n - 1 height
    restrictions.add([n, n - 1]);

    // Sort by building index
    restrictions.sort((a, b) => a[0].compareTo(b[0]));

    // Forward pass
    for (int i = 1; i < restrictions.length; i++) {
      int dist = restrictions[i][0] - restrictions[i - 1][0];

      restrictions[i][1] = restrictions[i][1] <
              restrictions[i - 1][1] + dist
          ? restrictions[i][1]
          : restrictions[i - 1][1] + dist;
    }

    // Backward pass
    for (int i = restrictions.length - 2; i >= 0; i--) {
      int dist = restrictions[i + 1][0] - restrictions[i][0];

      restrictions[i][1] = restrictions[i][1] <
              restrictions[i + 1][1] + dist
          ? restrictions[i][1]
          : restrictions[i + 1][1] + dist;
    }

    int ans = 0;

    // Find maximum peak between adjacent restrictions
    for (int i = 1; i < restrictions.length; i++) {
      int leftPos = restrictions[i - 1][0];
      int leftHeight = restrictions[i - 1][1];

      int rightPos = restrictions[i][0];
      int rightHeight = restrictions[i][1];

      int dist = rightPos - leftPos;

      int peak = (leftHeight + rightHeight + dist) ~/ 2;

      if (peak > ans) ans = peak;
    }

    return ans;
  }
}