import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({Key? key}) : super(key: key);

  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    Colors.red,
    Colors.green,
  ];

  List<FlSpot>? mySpots=[];
int i=0;
  @override
  void initState() {
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {

if(mySpots!.length>25){
  mySpots!.removeAt(0);
}
         mySpots!.add(
             FlSpot((i++).toDouble(), ((Random().nextDouble() * 70).toInt() - 20)));


      });


    });

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 2.5,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft:
                  Radius.circular(18),topRight: Radius.circular(18)
                ),
                color: Color(0xfff6faf6)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff95f195),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff95f195),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xfff61661),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {

            return value.toInt().toString();
            // switch (value.toInt()) {
            //   case 0:
            //     return '一月';
            //   case 1:
            //     return '二月';
            //   case 2:
            //     return '三月';
            //   case 3:
            //     return '四月';
            //   case 4:
            //     return '五月';
            //
            //   case 5:
            //     return '六月';
            //   case 6:
            //     return '七月';
            //   case 7:
            //     return '八月';
            //   case 8:
            //     return '九月';
            //   case 9:
            //     return '十月';
            //   case 10:
            //     return '十一月';
            //   case 11:
            //     return '十二月';
            // }
            // return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xffa640ee),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {

            switch (value.toInt()) {
              case -20:
                return '-20';
              case -15:
                return '-15';
              case -10:
                return '-10';
              case -5:
                return '-5';
              case 0:
                return '0';
              case 5:
                return '5';
              case 10:
                return '10';
              case 15:
                return '15';
              case 20:
                return '20';
              case 25:
                return '25';
              case 30:
                return '30';
              case 35:
                return '35';
              case 40:
                return '40';
              case 45:
                return '45';
              case 50:
                return '50';
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xfff543bc), width: 1)),
      // minX: 0,
      // maxX: 11,
      minY: -20,
      maxY: 50,
      lineBarsData: [
        LineChartBarData(
          spots: mySpots ,
          isCurved: true,
          colors: gradientColors,
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
        ),
      ],
    );
  }
}
