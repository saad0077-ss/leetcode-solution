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

    int diameter = 0;
  int diameterOfBinaryTree(TreeNode? root) {
    
    height(root);
    return diameter;
  }

  int height(TreeNode? node){
    if(node == null)return 0;

    int left = height(node.left);
    int right = height(node.right);

    diameter = diameter > left + right 
        ? diameter
        : left + right;

        return 1 + (left > right ? left : right);
  }
}