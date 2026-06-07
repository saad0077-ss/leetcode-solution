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
  bool isValidBST(TreeNode? root) {
    return validate(root,null,null);
  }
  
  bool validate(TreeNode? node , int? min,int? max){
    if(node == null)return true;

    if(min != null && node.val <= min)return false;
    if(max != null && node.val >= max)return false;

     return validate(node.left, min, node.val) &&
           validate(node.right, node.val, max);
  }
}