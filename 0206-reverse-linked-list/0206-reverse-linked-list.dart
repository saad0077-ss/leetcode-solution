/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? reverseList(ListNode? head) {
    // Initialize pointers: prev starts null, current starts at head
    ListNode? prev = null;
    ListNode? current = head;
    
    // Traverse the list, reversing links as we go
    while (current != null) {
      ListNode? nextNode = current.next;  // Save next node before breaking link
      current.next = prev;                // Reverse the pointer
      prev = current;                      // Move prev forward
      current = nextNode;                  // Move current forward
    }
    
    // prev is now the new head (original tail)
    return prev; 
  }
}