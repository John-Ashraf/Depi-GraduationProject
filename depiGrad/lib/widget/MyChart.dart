import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controller/HomeController.dart';
import '../model/five_days_data.dart';

class MyChart extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            labelStyle: TextStyle(fontSize: 10),
          ),
          primaryYAxis: NumericAxis(
            labelStyle: TextStyle(fontSize: 10),
          ),
          series: <ChartSeries<FiveDaysData, String>>[
            SplineSeries<FiveDaysData, String>(
              dataSource: controller.fiveDayData,
              xValueMapper: (FiveDaysData f, _) => f.dateTime,
              yValueMapper: (FiveDaysData f, _) => f.temp,
            ),
          ],
        ),
      ),
    );
  }
}