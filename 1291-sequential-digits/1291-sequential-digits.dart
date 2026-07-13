class Solution {
  List<int> sequentialDigits(int low, int high) {
    final options = "123456789";
    final List<int> res = [];
    for (int i = 0; i < options.length; i++) {
        for (int j = i + 1; j < options.length; j++) {
            final sub = options.substring(i, j + 1);
            if (sub.length != 0) {
                final subInt = int.parse(sub);
                if (subInt >= low && subInt <= high) {
                    res.add(subInt);
                }
            }
        }
    }

    res.sort();
    return res;
  }
}