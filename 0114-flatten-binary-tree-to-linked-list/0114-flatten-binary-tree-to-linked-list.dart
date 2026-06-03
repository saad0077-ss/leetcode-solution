/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Solution {
  void flatten(TreeNode? root) {
    if(root == null)return ;

    flatten(root.left);
    flatten(root.right);

    TreeNode? leftSubtree = root.left;
    TreeNode? rightSubtree = root.right;

    root.left = null;
    root.right = leftSubtree;

    TreeNode? current = root;

    while(current?.right != null){
        current = current!.right;
    }

    current?.right = rightSubtree;
  }
}