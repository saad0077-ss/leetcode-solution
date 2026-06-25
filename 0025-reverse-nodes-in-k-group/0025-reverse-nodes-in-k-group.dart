class Solution {
  ListNode? reverseKGroup(ListNode? head, int k) {
    List<int> list = [];

    while(head != null){
        list.add(head.val);
        head = head.next;
    }

    List<int> newList = [];
    List<int> calcList = [];
    for(int i = 0; i < list.length; i++){
        calcList.add(list[i]);  
        if(calcList.length == k){
            newList.addAll(calcList.reversed.toList());
            calcList.clear();
        }
    }

    for(int i = newList.length; i < list.length; i++){
        newList.add(list[i]);
    }

    for(int i = newList.length-1; i >= 0; i--){
        head = ListNode(newList[i], head);
    }

    return head;
  }
}