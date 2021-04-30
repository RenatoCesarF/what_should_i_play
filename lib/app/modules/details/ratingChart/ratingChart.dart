import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../details_controller.dart';

class RatingChart extends StatefulWidget {
  DetailsController controller;
  RatingChart(this.controller);

  @override
  _RatingChartState createState() => _RatingChartState();
}

class _RatingChartState extends State<RatingChart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PieChart(
          PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (pieTouchResponse) {},
                enabled: true,
              ),
              startDegreeOffset: 40,
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: [
                PieChartSectionData(
                  color: Theme.of(context).cardColor,
                  value: 100 - widget.controller.gameInfo.totalRating,
                  title: '',
                  radius: 15,
                  titleStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff044d7c)),
                  titlePositionPercentageOffset: 0.55,
                ),
                PieChartSectionData(
                  color: getCorrespondingColor(
                      widget.controller.gameInfo.totalRating),
                  value: widget.controller.gameInfo.totalRating,
                  title: '',
                  radius: 15,
                  titleStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff044d7c)),
                  titlePositionPercentageOffset: 0.55,
                )
              ]),
          swapAnimationDuration: Duration(minutes: 80),
        ),
        Positioned(
            child: Center(
          child: Text(
            "${widget.controller.gameInfo.totalRating.floor()}",
            style: TextStyle(
              color: Theme.of(context).canvasColor,
              fontSize: 30,
              fontWeight: FontWeight.w900,
              shadows: [
                Shadow(
                    // bottomLeft
                    offset: Offset(-1.5, -1.5),
                    color: Colors.black12),
                Shadow(
                    // bottomRight
                    offset: Offset(1.5, -1.5),
                    color: Colors.black12),
                Shadow(
                    // topRight
                    offset: Offset(1.5, 1.5),
                    color: Colors.black12),
                Shadow(
                    // topLeft
                    offset: Offset(-1.5, 1.5),
                    color: Colors.black12),
              ],
            ),
          ),
        ))
      ],
    );
  }
}

Color getCorrespondingColor(double rating) {
  if (rating <= 30) {
    return Color(0xffD15441);
  } else if (rating <= 60) {
    return Color(0xffD1C256);
  } else {
    return Color(0xff388536);
  }
}
