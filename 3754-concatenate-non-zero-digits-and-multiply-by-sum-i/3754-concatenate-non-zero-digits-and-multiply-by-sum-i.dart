class Solution {
  int sumAndMultiply(int n) {
    List<int> list = [];
    while(n>0){
        if(n%10!=0) list.add(n%10);
        n=(n/10).toInt();
    }
    int sum = 0, x=0;
    for(int i=0;i<list.length;i++){
        sum+=list[i];
        x+=pow(10,i).toInt()*list[i];
    }
    return x*sum;
  }
}