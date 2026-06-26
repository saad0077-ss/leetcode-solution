class FenwickTree {
  late List<int> tree;
  int n;

  FenwickTree(this.n) {
    tree = List.filled(n + 1, 0);
  }

  void update(int index, int delta) {
    while (index <= n) {
      tree[index] += delta;
      index += index & -index;
    }
  }

  int query(int index) {
    int sum = 0;
    while (index > 0) {
      sum += tree[index];
      index -= index & -index;
    }
    return sum;
  }
}

class Solution {
  int countMajoritySubarrays(List<int> nums, int target) {
    int n = nums.length;

    FenwickTree bit = FenwickTree(2 * n + 2);

    // Shift prefix sums to always stay positive.
    int prefix = n + 1;

    bit.update(prefix, 1);

    int ans = 0;

    for (int x in nums) {
      if (x == target) {
        prefix++;
      } else {
        prefix--;
      }

      ans += bit.query(prefix - 1);

      bit.update(prefix, 1);
    }

    return ans;
  }
}