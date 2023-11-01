import 'package:cookbook/core/util/constant.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({
    required this.calorieValue,
    required this.onChangeCalorie,
    required this.timeValue,
    required this.onChangeTime,
    required this.levelValue,
    required this.onChangeLevel,
    required this.state,
    super.key,
  });

  final RangeValues calorieValue;
  final Function(RangeValues) onChangeCalorie;
  final RangeValues timeValue;
  final Function(RangeValues) onChangeTime;
  final String levelValue;
  final Function(String) onChangeLevel;
  final void Function(void Function()) state;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "난이도",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: levelValue.isEmpty
                        ? Colors.grey[800]
                        : Colors.grey[500],
                  ),
                  child: Text("전체"),
                  onPressed: () {
                    state(() {
                      onChangeLevel("");
                    });
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: levelValue == "초보환영"
                        ? Colors.grey[800]
                        : Colors.grey[500],
                  ),
                  child: Text("초보환영"),
                  onPressed: () {
                    state(() {
                      onChangeLevel("초보환영");
                    });
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: levelValue == "보통"
                        ? Colors.grey[800]
                        : Colors.grey[500],
                  ),
                  child: Text("보통"),
                  onPressed: () {
                    state(() {
                      onChangeLevel("보통");
                    });
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: levelValue == "어려움"
                        ? Colors.grey[800]
                        : Colors.grey[500],
                  ),
                  child: Text("어려움"),
                  onPressed: () {
                    state(() {
                      onChangeLevel("어려움");
                    });
                  },
                ),
              ],
            ),
            Text(
              "칼로리 ${calorieValue.start.toInt()}Kcal ~ ${calorieValue.end.toInt()}Kcal",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            RangeSlider(
              values: calorieValue,
              divisions: calorieDivision,
              min: 0,
              max: calorieMax,
              onChanged: (calorieValue) {
                state(() {
                  onChangeCalorie(calorieValue);
                });
              },
            ),
            Text(
              "시간 ${timeValue.start.toInt()}분 ~ ${timeValue.end.toInt()}분",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            RangeSlider(
              values: timeValue,
              divisions: timeDivision,
              min: 0,
              max: timeMax,
              onChanged: (timeValue) {
                state(() {
                  onChangeTime(timeValue);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
