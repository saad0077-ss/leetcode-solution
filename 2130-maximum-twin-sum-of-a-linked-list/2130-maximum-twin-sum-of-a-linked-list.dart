/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  int pairSum(ListNode? head) {
    ListNode? slow = head;
    ListNode? fast = head;

    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }

    ListNode? prev = null;

    while (slow != null) {
      ListNode? nextNode = slow.next;
      slow.next = prev;
      prev = slow;
      slow = nextNode;
    }

    int maxSum = 0;
    ListNode? first = head;
    ListNode? second = prev;

    while (first != null && second != null) {
      int sum = first.val + second.val;

      if (sum > maxSum) {
        maxSum = sum;
      }

      first = first.next;
      second = second.next;
    }

    return maxSum;
  }
}