class Solution {
  int maxNumberOfBalloons(String text) {
    int count = 0;
    if(!text.contains("b") || !text.contains("a") || !text.contains("o") || !text.contains("n") || !text.contains("l")){
        return count;
    }

    List<String> split = text.split("");
    split = List.from(split.where((e) => e == "b" || e == "a" || e == "l" || e == "o" || e == "n").toList());
    split.sort();

    Map<String, int> map = {};

    for(String elem in split){
        map[elem] = (map[elem] ?? 0) + 1;
    }

    int countB = map["b"]!;
    
    for(int i = 0; i < countB; i++){
        if(map["b"]! > 0 && map["a"]! > 0 && map["o"]! > 1 && map["n"]! > 0 && map["l"]! > 1){
            count++;
            map["b"] = map["b"]! - 1;
            map["a"] = map["a"]! - 1;
            map["l"] = map["l"]! - 2;
            map["o"] = map["o"]! - 2;
            map["n"] = map["n"]! - 1;
        }else{
            return count;
        }
    }

    return count;
  }
}