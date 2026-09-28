class Solution {
  int maxDepth(String s) {
    int res=0;
    List<int>st=[];
    for (int i=0; i<s.length; i++)
    {
        if (s[i]=='(') st.add(i);
        else if (s[i]==')') {
            res=max(st.length, res);
            st.removeLast();
        }
    }
    return res;
  }
}