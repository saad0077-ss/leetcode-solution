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
  List<List<int>> levelOrder(TreeNode? root) {
    if(root == null)return [];

    List<List<int>> result = [];
    List<TreeNode> queue = [root];

    while(queue.isNotEmpty){
        int size = queue.length;
        List<int> level =[];

        for(int i=0;i<size;i++){
            TreeNode node = queue.removeAt(0);

            level.add(node.val);

            if(node.left != null){
                queue.add(node.left!);
            }

            if(node.right != null){
                queue.add(node.right!);
            }
        }

        result.add(level);
    }

    return result;
  }
} 