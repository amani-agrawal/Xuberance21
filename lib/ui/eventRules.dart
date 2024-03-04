import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:xuberance2021/model/event.dart';

late String event, eventDesc, generalDes, phrase;
late EventCategory category;
late int participants;
late DateTime start, end;
late Grade grade;

class EventRules extends StatefulWidget {
  EventRules(Event _data) {
    event = _data.name;
    eventDesc = _data.description;
    generalDes = _data.rules;
    category = _data.category;
    phrase = _data.phrase;
    participants = _data.numberOfParticipants;
    start = _data.start;
    end = _data.end;
    grade = _data.grade;
  }

  @override
  _EventRulesState createState() => _EventRulesState();
}

class _EventRulesState extends State<EventRules> {
  final PanelController _panelController1 = PanelController();
  final PageController _pageController2 = PageController();

  Widget _eventRules() {
    return Column(
      children: [
        SizedBox(height: 5),
        Text(
          "event",
          style: TextStyle(fontFamily: "texts", color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            _panelController1.close();
          },
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
        ),
        Text(
          "Event Rules",
          style: TextStyle(
              fontFamily: "heading",
              fontSize: 0.07 * MediaQuery.of(context).size.width,
              color: Colors.white),
        ),
        Row(
          children: [
            SizedBox(width: 0.05 * MediaQuery.of(context).size.width),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                  child: Text(
                    "$eventDesc",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "texts",
                        fontSize: 11.24,
                        wordSpacing: 1.2,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _pageController2.jumpToPage(1);
              },
              icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
            )
          ],
        ),
      ],
    );
  }

  Widget _generalRules() {
    return Column(
      children: [
        SizedBox(height: 5),
        Text(
          "event",
          style: TextStyle(fontFamily: "texts", color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            _panelController1.close();
          },
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
        ),
        Text(
          "General Rules",
          style: TextStyle(
              fontFamily: "heading",
              fontSize: 0.07 * MediaQuery.of(context).size.width,
              color: Colors.white),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                _pageController2.jumpToPage(0);
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 8, 8),
                  child: Text(
                    "$generalDes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "texts",
                        fontSize: 11.24,
                        wordSpacing: 1.2,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(width: 0.05 * MediaQuery.of(context).size.width),
          ],
        ),
      ],
    );
  }

  Widget _Page2() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/sponsors_background.png"),
          fit: BoxFit.cover,
        )),
        child: Container(
            color: Colors.black.withOpacity(0.3),
            child: Column(children: [
              Flexible(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Card(
                        color: Colors.lightBlueAccent.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(70),
                                topRight: Radius.circular(70))),
                        child: PageView(
                            controller: _pageController2,
                            scrollDirection: Axis.horizontal,
                            children: [_eventRules(), _generalRules()]),
                      )))
            ])));
  }

  Widget _Page1() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/sponsors_background.png"),
          fit: BoxFit.cover,
        )),
        child: Container(
            color: Colors.black.withOpacity(0.3),
            child: Stack(children: [
              Column(
                children: [
                  SizedBox(height: 0.4.sh),
                  BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Card(
                          color: Colors.lightBlueAccent.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(70),
                                  topRight: Radius.circular(70))),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(height: 50.h),
                                Center(
                                  child: Text("$event",
                                      style: TextStyle(
                                          fontFamily: "tesla",
                                          fontSize: 0.085 *
                                              MediaQuery.of(context).size.width,
                                          color: Colors.white)),
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("08-Oct",
                                        style: TextStyle(
                                            fontFamily: "heading",
                                            fontSize: 0.095 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            color: Colors.white)),
                                    SizedBox(width: 20.w)
                                  ],
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("$start-$end",
                                        style: TextStyle(
                                            fontFamily: "heading",
                                            fontSize: 0.07 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            color: Colors.white)),
                                    SizedBox(width: 20.w)
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 20.w),
                                    Text("$category",
                                        style: TextStyle(
                                            fontFamily: "heading",
                                            fontSize: 0.075 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            color: Colors.white)),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 25.w),
                                    Text("$participants participants",
                                        style: TextStyle(
                                            fontFamily: "heading",
                                            fontSize: 0.065 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            color: Colors.white)),
                                  ],
                                ),
                                SizedBox(height: 30.h),
                                Center(
                                    child: Image.asset(
                                        "images/eventRules.line.png",
                                        width: 0.85.sw)),
                                Center(
                                  child: Text("$phrase",
                                      style: TextStyle(
                                          fontFamily: "heading",
                                          fontSize: 0.045 *
                                              MediaQuery.of(context).size.width,
                                          color: Colors.white)),
                                ),
                                SizedBox(height: 40.h),
                                Column(
                                  children: [
                                    Center(
                                      child: IconButton(
                                        onPressed: () {
                                          _panelController1.open();
                                        },
                                        icon: Icon(Icons.keyboard_arrow_up,
                                            color: Colors.white, size: 25.h),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "Rules",
                                        style: TextStyle(
                                            fontFamily: "heading",
                                            fontSize: 15.sp,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 100.h)
                              ]))),
                ],
              ),
              Column(children: [
                SizedBox(height: 20),
                Center(
                  child: Image.asset("images/dance.png", height: 0.4.sh),
                ),
              ]),
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: true,
                elevation: 0,
              ),
              extendBodyBehindAppBar: true,
              body: Container(
                child: SlidingUpPanel(
                  controller: _panelController1,
                  body: GestureDetector(
                      child: _Page1(),
                      onVerticalDragUpdate: (DragUpdateDetails) {
                        _panelController1.open();
                      }),
                  panel: _Page2(),
                  minHeight: 0,
                  maxHeight: 0.9 * MediaQuery.of(context).size.height,
                ),
              ),
            ));
  }
}
