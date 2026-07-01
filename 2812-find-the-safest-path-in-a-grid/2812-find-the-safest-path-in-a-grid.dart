class Solution {
  int maximumSafenessFactor(List<List<int>> grid) {
    int n = grid.length;

    List<List<int>> dist =
        List.generate(n, (_) => List.filled(n, -1));

    // Multi-source BFS
    List<List<int>> queue = [];
    int front = 0;

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          dist[i][j] = 0;
          queue.add([i, j]);
        }
      }
    }

    List<List<int>> dir = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ];

    while (front < queue.length) {
      List<int> cur = queue[front++];
      int x = cur[0];
      int y = cur[1];

      for (var d in dir) {
        int nx = x + d[0];
        int ny = y + d[1];

        if (nx >= 0 &&
            ny >= 0 &&
            nx < n &&
            ny < n &&
            dist[nx][ny] == -1) {
          dist[nx][ny] = dist[x][y] + 1;
          queue.add([nx, ny]);
        }
      }
    }

    MaxHeap heap = MaxHeap();

    List<List<bool>> visited =
        List.generate(n, (_) => List.filled(n, false));

    heap.insert([dist[0][0], 0, 0]);

    while (!heap.isEmpty()) {
      List<int> cur = heap.removeMax();

      int safe = cur[0];
      int x = cur[1];
      int y = cur[2];

      if (visited[x][y]) continue;
      visited[x][y] = true;

      if (x == n - 1 && y == n - 1) {
        return safe;
      }

      for (var d in dir) {
        int nx = x + d[0];
        int ny = y + d[1];

        if (nx >= 0 &&
            ny >= 0 &&
            nx < n &&
            ny < n &&
            !visited[nx][ny]) {
          int newSafe = safe < dist[nx][ny] ? safe : dist[nx][ny];
          heap.insert([newSafe, nx, ny]);
        }
      }
    }

    return 0;
  }
}

class MaxHeap {
  List<List<int>> heap = [];

  bool isEmpty() => heap.isEmpty;

  void insert(List<int> value) {
    heap.add(value);
    int i = heap.length - 1;

    while (i > 0) {
      int parent = (i - 1) ~/ 2;

      if (heap[parent][0] < heap[i][0]) {
        List<int> temp = heap[parent];
        heap[parent] = heap[i];
        heap[i] = temp;
        i = parent;
      } else {
        break;
      }
    }
  }

  List<int> removeMax() {
    List<int> max = heap[0];
    heap[0] = heap.last;
    heap.removeLast();

    int i = 0;

    while (true) {
      int left = 2 * i + 1;
      int right = 2 * i + 2;
      int largest = i;

      if (left < heap.length &&
          heap[left][0] > heap[largest][0]) {
        largest = left;
      }

      if (right < heap.length &&
          heap[right][0] > heap[largest][0]) {
        largest = right;
      }

      if (largest == i) break;

      List<int> temp = heap[i];
      heap[i] = heap[largest];
      heap[largest] = temp;

      i = largest;
    }

    return max;
  }
}