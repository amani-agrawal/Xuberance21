import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final PageController _cardController = PageController();
  final PageController _pageController = PageController();
  late double count= 0.0;

  Widget _header(){
    return Stack(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Image.asset("images/lines2.png",
                      width: 0.25*MediaQuery.of (context).size.width,
                      height: 0.13*MediaQuery.of (context).size.height,),
                    Image.asset("images/lines2Revert.png",
                      width:0.25*MediaQuery.of (context).size.width,
                      height: 0.13*MediaQuery.of (context).size.height,),
                  ],
                ),
              ]
          ),
          Column(
            children: [
              SizedBox(height:0.095*MediaQuery.of (context).size.height),
              Center(
                child: Text(
                    "SCHEDULE",
                    style: TextStyle(
                        fontSize: 0.11*MediaQuery.of (context).size.width,
                        color: Colors.white,
                        fontFamily: "tesla"
                    )
                ),
              ),
            ],
          ),]
    );

  }

  Widget _cardList(event, time){
    return ListTile(
      title: Text(
          "$event",
          style: TextStyle(
              fontFamily: "heading",
              fontSize: 0.06*MediaQuery.of (context).size.width
          )
      ),
      subtitle: Text(
          "Subtitle",
          style: TextStyle(
              fontFamily: "heading",
              fontSize: 0.04*MediaQuery.of (context).size.width
          )
      ),
      trailing: Text(
          "$time",
          style: TextStyle(
              fontFamily: "heading",
              fontSize: 0.045*MediaQuery.of (context).size.width
          )
      ),
    );
  }

  Widget _card(title){
    return Column(
      children: [
        SizedBox(height: 0.01*MediaQuery.of (context).size.height),
        Text(
          "$title",
          style: TextStyle(
            fontFamily: "heading",
            fontSize: 30,
          )
        ),
        SizedBox(height: 0.01*MediaQuery.of (context).size.height),
        for(int i=0; i<6; i++)
          Flexible(child: _cardList("X-Bet", "10:30-12:30")),
        SizedBox(height: 25)
      ]
    );
  }

  void _update() {
    setState(() {
      count = _cardController.page!;
    });
  }

  Widget _verticalCardCarousel(){
    return Stack(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0.48*MediaQuery.of(context).size.height),
              child: Center(
                child: Icon(Icons.keyboard_arrow_up,
                    color: Colors.white,
                    size: 0.07*MediaQuery.of (context).size.height),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 0.55*MediaQuery.of(context).size.height),
                child: DotsIndicator(
                  axis: Axis.horizontal,
                  dotsCount: 3,
                  position: count,
                  decorator: DotsDecorator(//me coming wait
                      spacing: EdgeInsets.all(2.5),
                      color: Colors.white,
                      activeColor: Colors.white,
                      activeShape: const Border(),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      size: Size.square(10)
                  ),
                 ),
              ),
              ),
          ],
        ),
     StackedCardCarousel(
       onPageChanged: (pageIndex) => _update(),
     pageController: _cardController,
     spaceBetweenItems: 600,
       initialOffset: -10,
       items: [
         Center(
           child: Column(
           children: [
             Container(
               height: 0.53*MediaQuery.of (context).size.height,
               width: 0.95*MediaQuery.of (context).size.width,
               child:Card(
                   shape: _cardShape(),
                   margin: EdgeInsets.all(10),
                   color: Colors.blue[400],
                   child: _card("Morning")
               ),
             ),
           ],
           ),
     ),
         Center(
           child: Container(
             height: 0.53*MediaQuery.of (context).size.height,
             width: 0.90*MediaQuery.of (context).size.width,
             child:Padding(
               padding: EdgeInsets.only(top: 30),
               child: Card(
                   shape: _cardShape(),
                   margin: EdgeInsets.all(10),
                   color: Colors.blue[600],
                   child: _card("Afternoon")
               ),
             )
           ),
         ),
         Center(
           child: Container(
               height: 0.53*MediaQuery.of (context).size.height,
               width: 0.83*MediaQuery.of (context).size.width,
               child:Padding(
                 padding: EdgeInsets.only(top: 65),
                 child: Card(
                     shape: _cardShape(),
                     color: Colors.blue[800],
                     child:_card("Evening")
                 ),
               )
           ),
         )
       ]
       ),
      ],
    );
  }

  Widget _date(date){
    return Column(
        children: [
          Text(
              "$date",
              style: TextStyle(
                  fontSize: 80,
                  fontFamily: "heading",
                  color: Colors.white
              )
          ),
          Text(
              "october",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "heading",
                  color: Colors.white
              )
          ),
        ]
    );
  }

  Decoration _backgroundImage(){
    return BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/sponsors_background.png"),
            fit: BoxFit.cover
        )
    );
  }

  ShapeBorder _cardShape(){
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50)
    );
  }

  Widget _page1(){
    return Column(
        children: [
          _header(),
          Flexible(
              child: _verticalCardCarousel()),
          Row(
            children: [
              SizedBox(width: 0.33*MediaQuery.of (context).size.width),
              _date("08"),
              IconButton(
                  onPressed: () {
                    _pageController.jumpToPage(1);
                },
                icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 50
                    ),
                ),
                SizedBox(width: 0.02*MediaQuery.of (context).size.width),
                ],
            ),
            SizedBox(height: 0.03*MediaQuery.of (context).size.width)
      ]
    );
  }

  Widget _page2(){
    return Column(
        children: [
          _header(),
          Flexible(child: _verticalCardCarousel()),
          Row(
            children: [
              SizedBox(width: 0.16*MediaQuery.of (context).size.width),
              IconButton(
                onPressed: () {
                  _pageController.jumpToPage(0);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 50
                ),
              ),
              SizedBox(width: 0.05*MediaQuery.of (context).size.width),
              Center(child: _date("09")),
            ],
          ),
          SizedBox(height: 0.03*MediaQuery.of (context).size.width)
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: [
          Container(
          constraints: BoxConstraints.expand(),
          decoration: _backgroundImage(),
          child: Container(color: Colors.black.withOpacity(0.3), child: _page1())
          ),
          Container(
              constraints: BoxConstraints.expand(),
              decoration: _backgroundImage(),
              child: Container(color: Colors.black.withOpacity(0.3),child: _page2())
          ),
      ]
      )
    );
  }
}
