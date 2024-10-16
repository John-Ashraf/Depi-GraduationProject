import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/HomeController.dart';
import '../model/current_weather_data.dart';

class MyList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: controller.datalist.length,
        itemBuilder: (context, index) {
          CurrentWeatherData? data = controller.datalist[index];
          return Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data.name ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  '${kelvinToCelsius(data.main?.temp ?? 273.15).round()}°C',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  data.weather?.first.description ?? '',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }
}