class Solution {
  void solveSudoku(List<List<String>> board) {
    final rUsed = List.generate(9, (_) => Set());
    final cUsed = List.generate(9, (_) => Set());
    final sUsed = List.generate(9, (_) => Set());

    bool solve(int i) {
      if (i == 81) return true;

      final r = i ~/ 9;
      final c = i % 9;
      if (board[r][c] != '.') return solve(i + 1);

      final s = r ~/ 3 * 3 + c ~/ 3;
      for (var d = 1; d <= 9; ++d) {
        if (rUsed[r].contains(d)) continue;
        if (cUsed[c].contains(d)) continue;
        if (sUsed[s].contains(d)) continue;

        board[r][c] = d.toString();
        rUsed[r].add(d);
        cUsed[c].add(d);
        sUsed[s].add(d);
    
        if (solve(i + 1)) return true;

        board[r][c] = '.';
        rUsed[r].remove(d);
        cUsed[c].remove(d);
        sUsed[s].remove(d);
      }
      return false;
    }

    for (var r = 0; r < 9; ++r) {
      for (var c = 0; c < 9; ++c) {
        final d = board[r][c].codeUnitAt(0) - 48;
        if (d < 0) continue;
        rUsed[r].add(d);
        cUsed[c].add(d);
        sUsed[r ~/ 3 * 3 + c ~/ 3].add(d);
      }
    }

    solve(0);
  }
}

/// A set that can store numbers from `0` to `63` on native and
/// from `0` to `31` on web.
///
/// NOTE: Comment out this class to use the builtin `Set` class.
class Set {
  int v = 0;

  bool add(int e) {
    final old = v;
    v |= 1 << e;
    return old != v;
  }

  bool contains(int e) => (v & (1 << e)) != 0;

  bool remove(int e) {
    final old = v;
    v &= ~(1 << e);
    return old != v;
  }
}