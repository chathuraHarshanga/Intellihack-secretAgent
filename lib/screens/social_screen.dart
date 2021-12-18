import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_rp/utils/const.dart';
import 'package:heart_rp/widgets/custom_clipper.dart';
import 'package:heart_rp/widgets/grid_item.dart';
import 'package:heart_rp/widgets/card_stress.dart';
import 'package:heart_rp/widgets/progress_vertical.dart';
import 'package:heart_rp/widgets/card_items.dart';

class SocialScreen extends StatelessWidget {

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
              color: Constants.darkGreen,
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
                            Text("Social Activites",
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
                                Text("Tweet",
                                  style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.blueGrey
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
                        image: AssetImage('assets/icons/social.png'),
                        height: 73,
                        width: 80,
                        color: Colors.white.withOpacity(1)
                    ),
                  ],
                ),
                SizedBox(height: 90),

                TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Twitter acoount name: '
                  ),
                ),

                SizedBox(height: 45),
                Container(
                  margin: EdgeInsets.all(25),
                  child: FlatButton(
                    child: Text('Last Activities', style: TextStyle(fontSize: 20.0),),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ),

                SizedBox(height: 45),

                Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      CardItems(
                        image: Image.asset(
                          'assets/icons/happy.png',


                        ),
                        title: "Positive ",
                        value: "",
                        unit: "",
                        color: Constants.lightYellow,
                        progress: 0,
                      ),

                      CardItems(
                        image: Image.asset(
                          'assets/icons/smile-imo.png',
                        ),
                        title: "Neutral",
                        value: "",
                        unit: "",
                        color: Constants.lightBlue,
                        progress: 0,
                      ),

                      CardItems(
                        image: Image.asset(
                          'assets/icons/sad.png',
                        ),
                        title: "Negative",
                        value: "",
                        unit: "",
                        color: Constants.lightYellow,
                        progress: 0,
                      ),

                    ],
                  ),
                ),


                SizedBox(height: 30),

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

              ],
            ),
          ),
        ],
      ),
    );
  }
}
