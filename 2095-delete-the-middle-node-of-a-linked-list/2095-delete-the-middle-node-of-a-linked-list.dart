/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */

class Solution {
  ListNode? deleteMiddle(ListNode? head) {
    if (head == null || head.next == null) {
      return null;
    }

    ListNode? slow = head;
    ListNode? fast = head;
    ListNode? prev;

    while (fast != null && fast.next != null) {
      prev = slow;
      slow = slow!.next;
      fast = fast.next!.next;
    }

    prev!.next = slow!.next;

    return head;
  }
}