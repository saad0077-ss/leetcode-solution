/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * } /00
 */
class Solution {
  TreeNode? createBinaryTree(List<List<int>> descriptions) {
    Map<int, TreeNode> nodes = {};
    Set<int> children = {};

    for (var desc in descriptions) {
      int parentVal = desc[0];
      int childVal = desc[1];
      int isLeft = desc[2];

      nodes[parentVal] ??= TreeNode(parentVal);
      nodes[childVal] ??= TreeNode(childVal);

      TreeNode parent = nodes[parentVal]!;
      TreeNode child = nodes[childVal]!;

      if (isLeft == 1) {
        parent.left = child;
      } else {
        parent.right = child;
      }

      children.add(childVal);
    }

    for (var desc in descriptions) {
      int parentVal = desc[0];

      if (!children.contains(parentVal)) {
        return nodes[parentVal];
      }
    }

    return null;
  }
}