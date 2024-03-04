import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:xuberance2021/ui/Events.dart';
import 'package:xuberance2021/ui/schedule.dart';
import 'package:xuberance2021/ui/sponsor.dart';
import 'package:xuberance2021/ui/teams.dart';

import 'AboutUs.dart';
import 'login.dart';

class MenuPage extends StatefulWidget {
  late final FirebaseFirestore firestoreInstance;
  late final FirebaseAuth authInstance;

  MenuPage({
    required this.firestoreInstance,
    required this.authInstance,
  });

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final int spc = 0;

  Schedule x = new Schedule();

  Future<void> navigateToLogin(context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _multipleProvidersWithChild(LogInPage()),
      ),
    );
  }

  Future<void> navigateToTeams(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Teams()));
  }

  Future<void> navigateToSponsors(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Sponsors()));
  }

  Future<void> navigateToSchedule(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Schedule()));
  }

  Future<void> navigateToAboutUs(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
  }

  Future<void> navigateToEvents(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Events()));
  }

  Widget _TeamsButton() {
    return Stack(children: [
      Row(children: [
        SizedBox(width: 0.112.sw),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 0.01.sw),
                  Image.asset(
                    "images/lines2Menu.png",
                    width: 0.29.sw,
                    height: 0.2.sh,
                  ),
                ],
              ),
              Image.asset(
                "images/lines2Revert.png",
                width: 0.4.sw,
                height: 0.16.sh,
              ),
            ],
          ),
        ),
      ]),
      Column(
        children: [
          SizedBox(height: 0.16.sh),
          Row(
            children: [
              SizedBox(width: 0.05.sw),
              Container(
                child: TextButton(
                  onPressed: () {
                    navigateToTeams(context);
                  },
                  child: Text("TEAM",
                      style: TextStyle(
                          fontSize: 0.075.sw,
                          color: Colors.white,
                          fontFamily: "tesla")),
                ),
              ),
            ],
          ),
        ],
      ),
    ]);
  }

  Widget _LoginButton() {
    return Stack(children: [
      Row(children: [
        SizedBox(width: 0.39.sw),
        Flexible(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("images/linesMenu.png",
                      width: 0.73.sw, height: 0.2.sh),
                ],
              ),
              Image.asset("images/linesRevert.png",
                  width: 0.4.sw, height: 0.16.sh),
            ],
          ),
        ),
      ]),
      Column(
        children: [
          SizedBox(height: 0.16.sh),
          Row(
            children: [
              SizedBox(width: 0.65.sw),
              Container(
                child: TextButton(
                  onPressed: () {
                    navigateToLogin(context);
                  },
                  child: Text("LOGIN",
                      style: TextStyle(
                          fontSize: 0.075.sw,
                          color: Colors.white,
                          fontFamily: "tesla")),
                ),
              ),
            ],
          ),
        ],
      ),
    ]);
  }

  Widget _EventButton() {
    return Stack(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Flexible(child: Image.asset("images/eventLines.png", height: 0.25.sh)),
        Flexible(child: Image.asset("images/eventLines2.png", height: 0.25.sh)),
      ]),
      Column(
        children: [
          SizedBox(height: 0.125.sh),
          Center(
            child: TextButton(
              onPressed: () {
                navigateToEvents(context);
              },
              child: Text(
                "EVENTS",
                style: TextStyle(
                    fontFamily: "tesla",
                    fontSize: 0.085.sw,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ]);
  }

  Widget _MiddleButtonsRow() {
    return Stack(children: [
      Column(
        children: [
          Center(
              child: Image.asset("images/card_logo.png",
                  height: 0.28.sh, width: 0.6.sw)),
        ],
      ),
      Stack(
        children: [
          _TeamsButton(),
          _LoginButton(),
        ],
      ),
      Column(children: [
        SizedBox(height: 0.34.sh),
        Stack(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.asset("images/lines.png", width: 0.4.sw, height: 0.2.sh),
            Image.asset("images/lines2.png", width: 0.4.sw, height: 0.2.sh),
          ]),
          Column(
            children: [
              SizedBox(height: 0.07.sh),
              Stack(children: [
                Center(
                    child: Image.asset("images/TriSection_1.png",
                        height: 0.17.sh)),
                Center(
                  child: Image.asset("images/TriSection.png", height: 320.h),
                )
              ])
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SizedBox(height: 0.14.sh),
                  TextButton(
                      onPressed: () {
                        navigateToSchedule(context);
                      },
                      child: Container(
                        child: Text(
                          "SCHEDULE",
                          style: TextStyle(
                              fontFamily: "tesla",
                              fontSize:
                                  0.06 * MediaQuery.of(context).size.width,
                              color: Colors.white),
                        ),
                      )),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 0.14.sh),
                  TextButton(
                      onPressed: () {
                        navigateToSponsors(context);
                      },
                      child: Container(
                        child: Text(
                          "SPONSOR",
                          style: TextStyle(
                            fontFamily: "tesla",
                            fontSize: 0.06 * MediaQuery.of(context).size.width,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 0.32.sh),
              Center(
                child: TextButton(
                    onPressed: () {
                      navigateToAboutUs(context);
                    },
                    child: Container(
                      child: Text(
                        "ABOUT US",
                        style: TextStyle(
                            fontFamily: "tesla",
                            fontSize: 0.085.sw,
                            color: Colors.white),
                      ),
                    )),
              ),
            ],
          )
        ]),
      ])
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/sponsors_background.png"),
              fit: BoxFit.cover,
            )),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Column(
                children: [
                  _EventButton(),
                  _MiddleButtonsRow(),
                  //_LastButtonsRow()
                ],
              ),
            )));
  }

  Widget _multipleProvidersWithChild(Widget child) {
    return MultiProvider(
      providers: [
        Provider<FirebaseFirestore>.value(value: widget.firestoreInstance),
        Provider<FirebaseAuth>.value(value: widget.authInstance),
      ],
      child: child,
    );
  }
}
