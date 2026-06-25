/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    List<int> list1 = [];
    List<int> list2 = [];

    while(l1 != null){
        list1.add(l1.val);
        l1 = l1.next;
    }

     while(l2 != null){
        list2.add(l2.val);
        l2 = l2.next;
    }

    list1 = List.from(list1.reversed.toList());
    list2 = List.from(list2.reversed.toList());
    

    BigInt numberResult = (BigInt.parse(list1.map((a) => a.toString()).toList().join())) + (BigInt.parse(list2.map((a) => a.toString()).toList().join()));


    List<String> list = numberResult.toString().split("");


    ListNode? result = null;

    while(list.isNotEmpty){
        result = ListNode(int.parse(list.first), result);
        list.removeAt(0);
    }

    return result;
  }
}