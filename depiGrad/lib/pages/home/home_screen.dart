import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../controller/HomeController.dart';
import '../../widget/MyCard.dart';
import '../../widget/MyChart.dart';
import '../../widget/MyList.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<HomeController>(
        builder: (controller) => SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: MyCard(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text(
                        'OTHER CITY',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16,
                          fontFamily: 'flutterfonts',
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      MyList(),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 100), // Adjust this value to move the forecast section down
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'FORECAST NEXT 5 DAYS',
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
                      SizedBox(height: 10),
                      MyChart(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}