class Solution {
  String reverseParentheses(String s) {
    List<int>st=[];
    for (int i=0; i<s.length; i++)
    {
        if (s[i]=='(') st.add(i);
        else if (s[i]==')') {
            int l=st.removeLast();
            List<String>r=['1'];
            r.addAll(s.substring(l+1, i).split(''));
            r.add('1');  
            r=r.reversed.toList();
           s=s.replaceRange(l, i+1, r.join());
        } 
    }
    
    return s.replaceAll('1','');
  }
}