import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_rp/utils/const.dart';
import 'package:heart_rp/widgets/card_facial.dart';
import 'package:heart_rp/widgets/card_items.dart';
import 'package:heart_rp/widgets/card_main.dart';
import 'package:heart_rp/widgets/card_stress.dart';
import 'package:heart_rp/widgets/card_sleep.dart';
import 'package:heart_rp/widgets/card_social.dart';
import 'package:heart_rp/widgets/custom_clipper.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

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
              children: <Widget>[
                // Header - Greetings and Avatar
                Row(
                  children: const <Widget>[
                    Expanded(
                      child: Text("Hello Dananjaya,\n   Have a Good Day",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Colors.white
                        ),
                      ),
                    ),
                    CircleAvatar(
                        radius: 38.0,
                        backgroundImage: AssetImage('assets/icons/profile.png')
                    )
                  ],
                ),

                SizedBox(height: 50),

                // Main Cards - Heartbeat and Blood Pressure
                SizedBox(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CardMain(
                        image: AssetImage('assets/icons/heartbeat.png'),
                        title: "Hearbeat",
                        value: "66",
                        unit: "bpm",
                        color: Constants.lightGreen,
                      ),
                      // CardMain(
                      //     image: AssetImage('assets/icons/blooddrop.png'),
                      //     title: "Blood Pressure",
                      //     value: "66/123",
                      //     unit: "mmHg",
                      //     color: Constants.lightYellow
                      // ),
                      CardFacial(
                          image: AssetImage('assets/icons/Smile_Image.png'),
                          title: "Facial Expression",
                          value: "0.6",
                          unit: "Happy",
                          color: Constants.lightYellow
                      ),
                      CardSleep(
                          image: AssetImage('assets/icons/png-sleep.png'),
                          title: "Sleep",
                          value: "6-8",
                          unit: "hours",
                          color: Constants.lightBlue
                      ),
                      CardSocial(
                          image: AssetImage('assets/icons/social.png'),
                          title: "Social Activities",
                          value: "5-9",
                          unit: "tweets",
                          color: Constants.lightGreen
                      )
                    ],
                  ),
                ),

                // Section Cards - Daily Medication
                // SizedBox(height: 50),

                // Text("YOUR DAILY MEDICATIONS",
                //   style: TextStyle(
                //     color: Constants.textPrimary,
                //     fontSize: 13,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                // SizedBox(height: 20),

                // SizedBox(
                //     height: 125,
                //     child: ListView(
                //       scrollDirection: Axis.horizontal,
                //       children: <Widget>[
                //         CardSection(
                //           image: AssetImage('assets/icons/capsule.png'),
                //           title: "Metforminv",
                //           value: "2",
                //           unit: "pills",
                //           time: "6-7AM",
                //           isDone: false,
                //         ),
                //         CardSection(
                //           image: AssetImage('assets/icons/syringe.png'),
                //           title: "Trulicity",
                //           value: "1",
                //           unit: "shot",
                //           time: "8-9AM",
                //           isDone: true,
                //         )
                //       ],
                //     )),

                SizedBox(height: 35),

                SizedBox(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CardStress(
                        image: AssetImage('assets/icons/stress.png'),
                        title: "",
                        value: "Calculate Mental Status",
                        unit: "",
                        color: Constants.lightBlue,
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

                SizedBox(height: 40),

                // Scheduled Activities
                Text("Daily Hints & Tips ",
                  style: TextStyle(
                      color: Constants.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 20),

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
                        title: "Get plenty of sleep",
                        value: "",
                        unit: "",
                        color: Constants.lightYellow,
                        progress: 0,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/icons/Swimming.png',
                        ),
                        title: "Swimming",
                        value: "30",
                        unit: "mins",
                        color: Constants.lightBlue,
                        progress: 0,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/icons/Walking.png',
                        ),
                        title: "Activity and exercise",
                        value: "",
                        unit: "",
                        color: Constants.lightYellow,
                        progress: 0,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/icons/eating.png',
                        ),
                        title: "Eat well",
                        value: "",
                        unit: "",
                        color: Constants.lightBlue,
                        progress: 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
