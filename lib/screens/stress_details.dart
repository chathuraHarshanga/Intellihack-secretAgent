import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_rp/utils/const.dart';
import 'package:heart_rp/widgets/custom_clipper.dart';
import 'package:heart_rp/widgets/card_items.dart';
import 'package:heart_rp/widgets/grid_item.dart';
import 'package:heart_rp/widgets/progress_vertical.dart';

class Stressdetails extends StatelessWidget {

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
                            Text("Mental",
                              style: TextStyle(
                                  fontSize: 40,
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
                                Text("Status",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white
                                  ),
                                ),

                                SizedBox(width: 10),

                                // Text("bpm",
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
                        image: AssetImage('assets/icons/stress.png'),
                        height: 83,
                        width: 90,
                        color: Colors.white.withOpacity(1)
                    ),
                  ],
                ),
                SizedBox(height: 30),

                //chart
                Material(
                  shadowColor: Colors.grey.withOpacity(0.01), // added
                  type: MaterialType.card,
                  elevation: 10, borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    height: 430,
                    child: Column(
                      children: <Widget>[
                        // Rest Active Legend
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10.0),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Constants.lightBlue,
                                  shape: BoxShape.circle
                              ),
                            ),
                            Text("Rest"),
                            Container(
                              margin: EdgeInsets.only(left: 10.0, right: 10.0),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Constants.darkBlue,
                                  shape: BoxShape.circle
                              ),
                            ),
                            Text("Active"),

                          ],
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 220.0,
                          width: 220.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/icons/dialnew.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        // Main Cards - Heartbeat and Blood Pressure
                        SizedBox(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const <Widget>[
                              ProgressVertical(
                                value: 50,
                                date: "N",
                                isShowDate: true,
                              ),
                              ProgressVertical(
                                value: 50,
                                date: "M",
                                isShowDate: false,
                              ),
                              ProgressVertical(
                                value: 45,
                                date: "M",
                                isShowDate: false,
                              ),
                              ProgressVertical(
                                value: 30,
                                date: "M",
                                isShowDate: true,
                              ),
                              ProgressVertical(
                                value: 50,
                                date: "5/15",
                                isShowDate: false,
                              ),
                              ProgressVertical(
                                value: 20,
                                date: "5/16",
                                isShowDate: false,
                              ),
                              ProgressVertical(
                                value: 45,
                                date: "N",
                                isShowDate: true,
                              ),
                              ProgressVertical(
                                value: 67,
                                date: "5/18",
                                isShowDate: false,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        // Line Graph
                        // Expanded(
                        //   child: Container(
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        //         shape: BoxShape.rectangle,
                        //         color: Constants.darkGreen,
                        //       ),
                        //       child: ClipPath(
                        //         clipper: MyCustomClipper(clipType: ClipType.multiple),
                        //         child: Container(
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        //               shape: BoxShape.rectangle,
                        //               color: Constants.lightGreen,
                        //             )
                        //         ),
                        //       )
                        //   ),
                        // ),
                      ],
                    ),
                  ), // added
                ),

                SizedBox(height: 30),

                Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      CardItems(
                        image: Image.asset(
                          'assets/icons/smile-imo.png',
                        ),
                        title: "Facial Expressions",
                        value: "",
                        unit: "",
                        color: Constants.lightBlue,
                        progress: 75,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/icons/png-sleep.png',
                        ),
                        title: "Sleep hours details",
                        value: "",
                        unit: "",
                        color: Constants.lightBlue,
                        progress: 60,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/icons/heartbeat.png',
                        ),
                        title: "Heart Rate Analysis",
                        value: "",
                        unit: "",
                        color: Constants.lightBlue,
                        progress: 80,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/icons/social.png',
                        ),
                        title: "Social Activities",
                        value: "",
                        unit: "",
                        color: Constants.lightBlue,
                        progress: 50,
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
