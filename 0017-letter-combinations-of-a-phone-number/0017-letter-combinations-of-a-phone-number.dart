class Solution {
  List<String> letterCombinations(String digits) {
    if(digits.length==0) return [];
    Map<int, List<String>> map = {
        2: ['a', 'b', 'c'],
        3: ['d', 'e', 'f'],
        4: ['g', 'h', 'i'],
        5: ['j', 'k', 'l'],
        6: ['m', 'n', 'o'],
        7: ['p', 'q', 'r', 's'],
        8: ['t', 'u', 'v'],
        9: ['w', 'x', 'y', 'z'],
    };
    List<String> res=[];
    void backTracking(String digit, int index){
        if(digit.length == digits.length){
            res.add(digit);
            return;
        }
        for(String char in map[int.parse(digits[index])]!){
            backTracking(digit+char,index+1);
        }
    }
    backTracking('',0);
    return res;
  }
}