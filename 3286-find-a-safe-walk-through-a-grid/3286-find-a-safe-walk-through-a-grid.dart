import 'dart:collection';

class Solution {
  bool findSafeWalk(List<List<int>> grid, int health) {
    int maxR = grid.length;
    int maxC = grid[0].length;

    // a queue to add nodes we need to visit 
    ListQueue<List<int>> toVisit = ListQueue();

    // prefill visited grid
    List<List<int>> visited = List.generate(maxR, (_) => List.filled(maxC, -1));

    // Start Traverse at this location
    int startingHealth = health - grid[0][0];
    toVisit.add([0,0, startingHealth]);
    visited[0][0] = startingHealth;

    List<int> dRow = [-1, 1, 0, 0];
    List<int> dCol = [0, 0, -1, 1];

    while (toVisit.isNotEmpty) {
        List<int> currCell = toVisit.removeFirst();
        int r = currCell[0];
        int c = currCell[1];
        int currHealth = currCell[2];

        if (r == maxR - 1 && c == maxC - 1) {
            return true;
        }

        for(int i = 0; i < 4; i++) {
            int nextR = r + dRow[i];
            int nextC = c + dCol[i];

            // gotta make sure shit doesnt go out of bounds
            if (nextR >= 0 && nextR < maxR && nextC >= 0 && nextC < maxC) {
                int nextHealth = currHealth - grid[nextR][nextC];
                if (nextHealth > 0 && nextHealth > visited[nextR][nextC]) {
                    // mark current node visited as true
                    visited[nextR][nextC] = nextHealth;

                    // add new node to the queue which are valid only
                    toVisit.add([nextR, nextC, nextHealth]);
                }
            }
        }
    }

    return false;
  }
}