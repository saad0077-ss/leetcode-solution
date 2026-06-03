class Solution {
  int earliestFinishTime(
    List<int> landStartTime,
    List<int> landDuration,
    List<int> waterStartTime,
    List<int> waterDuration,
  ) {
    int landThenWater = calc(
      landStartTime,
      landDuration,
      waterStartTime,
      waterDuration,
    );

    int waterThenLand = calc(
      waterStartTime,
      waterDuration,
      landStartTime,
      landDuration,
    );

    return landThenWater < waterThenLand
        ? landThenWater
        : waterThenLand;
  }

  int calc(
    List<int> firstStart,
    List<int> firstDuration,
    List<int> secondStart,
    List<int> secondDuration,
  ) {
    int minFinish = 1 << 30;

    for (int i = 0; i < firstStart.length; i++) {
      minFinish = minFinish <
              firstStart[i] + firstDuration[i]
          ? minFinish
          : firstStart[i] + firstDuration[i];
    }

    int answer = 1 << 30;

    for (int i = 0; i < secondStart.length; i++) {
      int finish =
          (minFinish > secondStart[i]
                  ? minFinish
                  : secondStart[i]) +
              secondDuration[i];

      answer = answer < finish
          ? answer
          : finish;     
    }

    return answer;
  }
}