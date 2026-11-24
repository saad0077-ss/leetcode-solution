class Solution {
  int furthestDistanceFromOrigin(String moves) {
    int position = 0;
    int uderscroe= 0;
    for(int i=0;i<moves.length;i++){
        if(moves[i]== "L"){
           position --; 
        }else if(moves[i] == "R"){
            position ++ ;
        }else if(moves[i] == "_"){
           uderscroe ++;
        }
    }
    return position.abs()+uderscroe;
  }
}