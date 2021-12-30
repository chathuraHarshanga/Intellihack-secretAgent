import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_rp/utils/const.dart';
import 'package:heart_rp/widgets/card_items.dart';
import 'package:heart_rp/widgets/custom_clipper.dart';
import 'package:heart_rp/widgets/grid_item.dart';
import 'package:heart_rp/widgets/card_stress.dart';
import 'package:heart_rp/widgets/progress_vertical.dart';

class SleepScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    // For Grid Layout
    double _crossAxisSpacing = 16, _mainAxisSpacing = 16, _cellHeight = 150.0;
    int _crossAxisCount = 2;

    double _width = (MediaQuery.of(context).size.width -
        ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    double _aspectRatio =
        _width / (_cellHeight + _mainAxisSpacing + (_crossAxisCount + 1));

    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper(clipType: ClipType.bottom),
            child: Container(
              color: Theme.of(context).accentColor,
              height: Constants.headerHeight + statusBarHeight,
            ),
          ),

          Positioned(
            right: -45,
            top: -30,
            child: ClipOval(
              child: Container(
                color: Colors.black.withOpacity(0.05),
                height: 220,
                width: 220,
              ),
            ),
          ),

          // BODY
          Padding(
            padding: EdgeInsets.all(Constants.paddingSide),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // Back Button
                        SizedBox(
                          width: 34,
                          child:RawMaterialButton(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                                Icons.arrow_back_ios,
                                size: 15.0,
                                color: Colors.white
                            ),
                            shape: CircleBorder(
                              side: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                  style: BorderStyle.solid
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text("Sleep Pattern",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              mainAxisAlignment: MainAxisAlignment.start,
                              textBaseline: TextBaseline.alphabetic,
                              children: const <Widget>[
                                Text("Sleep pattern analyse",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white
                                  ),
                                ),

                                SizedBox(width: 10),

                                // Text("aaa",
                                //   style: TextStyle(
                                //       fontSize: 20,
                                //       color: Colors.white
                                //   ),
                                // ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              mainAxisAlignment: MainAxisAlignment.start,
                              textBaseline: TextBaseline.alphabetic,
                              children: const <Widget>[
                                Text("healthy hours 6-8",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white
                                  ),
                                ),

                                SizedBox(width: 10),

                                // Text("aaa",
                                //   style: TextStyle(
                                //       fontSize: 20,
                                //       color: Colors.white
                                //   ),
                                // ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/icons/capsule.png'),
                        height: 73,
                        width: 80,
                        color: Colors.white.withOpacity(1)
                    ),
                  ],
                ),
                SizedBox(height: 30),
                // Chart

                Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      CardItems(
                        image: Image.asset(
                          'assets/icons/sleep.png',
                        ),
                        title: "Monday",
                        value: "6.4",
                        unit: "hours",
                        color: Constants.lightBlue,
                        progress: 80,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/icons/sleep.png',
                        ),
                        title: "Tuesday",
                        value: "4.8",
                        unit: "hours",
                        color: Constants.lightBlue,
                        progress: 60,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/icons/sleep.png',
                        ),
                        title: "Wednesday",
                        value: "5.6",
                        unit: "hours",
                        color: Constants.lightBlue,
                        progress: 70,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/icons/sleep.png',
                        ),
                        title: "Thursday",
                        value: "5.6",
                        unit: "hours",
                        color: Constants.lightBlue,
                        progress: 70,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/icons/sleep.png',
                        ),
                        title: "Friday",
                        value: "6.4",
                        unit: "hours",
                        color: Constants.lightBlue,
                        progress: 80,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/icons/sleep.png',
                        ),
                        title: "Saturday",
                        value: "8",
                        unit: "hours",
                        color: Constants.lightBlue,
                        progress: 100,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/icons/sleep.png',
                        ),
                        title: "Sunday",
                        value: "7.2",
                        unit: "hours",
                        color: Constants.lightBlue,
                        progress: 90,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CardStress(
                        image: AssetImage('assets/icons/stress.png'),
                        title: "",
                        value: "Calculate Status",
                        unit: "",
                        color: Constants.lightGreen,
                      ),
                      // CardStress(
                      //     image: AssetImage('assets/icons/blooddrop.png'),
                      //     title: "Blood Pressure",
                      //     value: "66/123",
                      //     unit: "mmHg",
                      //     color: Constants.lightYellow
                      // )
                    ],
                  ),
                ),



                SizedBox(height: 30),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
