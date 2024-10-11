import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../controller/HomeController.dart';

class MyCard extends GetView<HomeController> {
  double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
          image: AssetImage('assets/images/cloud-in-blue-sky.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) => controller.city = value,

              onSubmitted:(value)=> controller.updateWeather(),
              textInputAction:TextInputAction.search,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.white),
                hintText: 'SEARCH',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 1.0),
            child: SizedBox(
              height: 250,
              width: 250,
              child: OverflowBox(
                minWidth: 0.0,
                maxWidth: MediaQuery.of(context).size.width,
                minHeight: 0.0,
                maxHeight: (MediaQuery.of(context).size.height / 4),
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      height: double.infinity,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 3, left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      (controller.currentWeatherData!=null)?'${controller.currentWeatherData.name}'.toUpperCase():"cairo",
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: Colors.black45,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'flutterfonts',
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      DateFormat().add_MMMMEEEEd().format(DateTime.now()),
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: Colors.black45,
                                        fontSize: 16,
                                        fontFamily: 'flutterfonts',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        controller.currentWeatherData?.weather?.first.description ?? '',
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          color: Colors.black45,
                                          fontSize: 15,
                                          fontFamily: 'flutterfonts',
                                        ),
                                      ),
                                      Text(
                                        '${kelvinToCelsius(controller.currentWeatherData?.main?.temp ?? 273.15).round().toString()}\u2103',
                                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                          color: Colors.black45,
                                          fontFamily: 'flutterfonts',
                                        ),
                                      ),
                                      Text(
                                        'min: ${kelvinToCelsius(controller.currentWeatherData?.main?.tempMin ?? 273.15).round().toString()}\u2103 / max: ${kelvinToCelsius(controller.currentWeatherData?.main?.tempMax ?? 273.15).round().toString()}\u2103',
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          color: Colors.black45,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'flutterfonts',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: LottieBuilder.asset('assets/anims/cloudy.json'),
                                      ),
                                      Container(
                                        child: Text(
                                          'wind ${controller.currentWeatherData?.wind?.speed ?? 0} m/s',
                                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            color: Colors.black45,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'flutterfonts',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
