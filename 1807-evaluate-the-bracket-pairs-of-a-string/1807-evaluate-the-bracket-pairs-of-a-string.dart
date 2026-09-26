class Solution {
  String evaluate(String s, List<List<String>> knowledge) {
    Map<String, String> map = {
    for (var item in knowledge) item[0]: item[1]
  };

    final buffer = StringBuffer();

    bool isKeyText = false;
    final keyTextBuffer = StringBuffer();
    for(int i = 0; i < s.length; i++) {
        if(s[i] == '(') {
            isKeyText = true;
        } else if(s[i] == ')') {
            isKeyText = false;
            final keyText = keyTextBuffer.toString();
            if(map.containsKey(keyText)){
               buffer.write(map[keyText]); 
            } else {
                buffer.write('?');
            }
            keyTextBuffer.clear();
        } else if(isKeyText) {
            keyTextBuffer.write(s[i]);
        } else {
            buffer.write(s[i]);
        }
    }
    return buffer.toString();
  }
}