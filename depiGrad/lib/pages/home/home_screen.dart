import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../controller/HomeController.dart';
import '../../widget/MyCard.dart';
import '../../widget/MyChart.dart';
import '../../widget/MyList.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<HomeController>(
        builder: (controller) => Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: MyCard(),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'other city'.toUpperCase(),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 16,
                              fontFamily: 'flutterfonts',
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        MyList(),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Forecast next 5 days'.toUpperCase(),
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                ),
                              ),
                              Icon(
                                Icons.next_plan_outlined,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        ),
                        MyChart(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
