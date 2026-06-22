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
  List<int> postorderTraversal(TreeNode? root) {
    List<int> result = [];

    dfs(root,result);
    return result;
  }

  void dfs(TreeNode? node,List<int> result){
    if(node == null)return;

    dfs(node.left,result);
    dfs(node.right,result);
    result.add(node.val);
  }
}