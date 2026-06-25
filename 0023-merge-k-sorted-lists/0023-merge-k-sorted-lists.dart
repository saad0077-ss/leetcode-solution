/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? mergeKLists(List<ListNode?> lists) {

    // convert to non-nullable list
    lists = lists.where((node) => node != null)
                 .map((node) => node as ListNode)
                 .toList();

    if(lists.length == 0) return null;
    if(lists.length == 1) return lists.single;

    ListNode smallest = lists.reduce((a, b) => (a!.val < b!.val) ? a : b) as ListNode;
    lists.remove(smallest);
    if(smallest.next != null) lists.add(smallest.next);

    ListNode ret = new ListNode(smallest.val);
    ListNode pointer = ret;

    while(lists.length > 1) {
      smallest = lists.reduce((a, b) => (a!.val < b!.val) ? a : b) as ListNode;
      lists.remove(smallest);
      if(smallest.next != null) lists.add(smallest.next);
      pointer.next = new ListNode(smallest.val);
      pointer = pointer.next as ListNode;
    }

    pointer.next = lists.single;

    return ret;
  }
}