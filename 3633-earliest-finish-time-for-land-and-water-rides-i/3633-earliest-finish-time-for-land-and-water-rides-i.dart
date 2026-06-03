class Solution {
  int earliestFinishTime(
    List<int> landStartTime,   
    List<int> landDuration,
    List<int> waterStartTime,
    List<int> waterDuration,
  ) {
    int answer = 1 << 30;

    for (int i = 0; i < landStartTime.length; i++) {
      for (int j = 0; j < waterStartTime.length; j++) {

        // Land -> Water
        int landFinish =
            landStartTime[i] + landDuration[i];

        int finish1 =
            (landFinish > waterStartTime[j]
                    ? landFinish
                    : waterStartTime[j]) +
                waterDuration[j];

        answer =
            answer < finish1 ? answer : finish1;

        // Water -> Land
        int waterFinish =
            waterStartTime[j] + waterDuration[j];

        int finish2 =
            (waterFinish > landStartTime[i]
                    ? waterFinish
                    : landStartTime[i]) +
                landDuration[i];

        answer =
            answer < finish2 ? answer : finish2;
      }
    }

    return answer;
  }
}