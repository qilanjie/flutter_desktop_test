import 'package:flutter/material.dart';


import 'samples/line_chart_sample2.dart';

class LineChartPage extends StatelessWidget {
  const LineChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff262545),
      child: ListView(
        children: const <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 36.0,
                top: 24,
              ),
              child: Text(
                'Line Chart',
                style: TextStyle(
                    color: Colors.white

                    ,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),


          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16),
            child: LineChartSample2(),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}