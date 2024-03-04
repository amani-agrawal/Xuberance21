import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Teams extends StatefulWidget {

  @override
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {

  Decoration _backgroundImage(){
    return  BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/sponsors_background.png"),
            fit: BoxFit.cover
        )
    );
  }

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
              SizedBox(height:0.085*MediaQuery.of (context).size.height),
              Center(
                child: Text(
                    "TEAM",
                    style: TextStyle(
                        fontSize: 0.19*MediaQuery.of (context).size.width,
                        color: Colors.white,
                        fontFamily: "tesla"
                    )
                ),
              ),
            ],
          ),]
    );
  }

  Widget _Card(){
    return Container(
        width: 160.w,
        height: 160.w,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade700,
              width: 0.02.sw,
            ),
            image: DecorationImage(
                image: AssetImage("images/card_background.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
                child: Image.asset("images/card_logo.png")),
            Text(
                "xuberance 21",
                textAlign: TextAlign.center,
                style: TextStyle(
                    wordSpacing: 1,
                    fontSize: 0.035*MediaQuery.of(context).size.width,//(100-title.toString().length)*0.00037*MediaQuery.of (context).size.width,
                    color: Colors.white,
                    fontFamily: "heading")
            ),
            SizedBox(height: 0.03.sw)
          ],
        )
    );
  }

  Widget _TeachersCard(){
    return Card(
        margin: EdgeInsets.only(top: 20),
        child: _Card()
    );
  }

  Widget _CoreCard(){
    return Card(
        margin: EdgeInsets.fromLTRB(
            0.02.sh,
            0.03.sh, 0,
            0.04.sh),
        child: _Card()
    );
  }

  Widget _Techlist(name){
    return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(width: 0.04.sw),
          Icon(
            Icons.adjust,
            color: Colors.white,
          ),
          Text(
              " $name",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 0.05*MediaQuery.of(context).size.width,
                  fontFamily: "heading"
              )
          ),
          SizedBox(height: 0.055.sh),
        ]
    );
  }

  Widget _Eventlist(name){
    return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(width: 0.04.sw),
          Icon(
            Icons.adjust,
            color: Colors.white,
          ),
          Text(
              " $name",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 0.05*MediaQuery.of(context).size.width,
                  fontFamily: "heading"
              )
          ),
          SizedBox(height: 0.055.sh),
        ]
    );
  }

  Widget Page1(){
    return Column(
            children: [
              Text(
                "TEACHERS INCHARGE",
                style: TextStyle(
                    fontFamily: "heading",
                    color: Colors.white,
                    fontSize: 0.06*MediaQuery.of(context).size.width
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _TeachersCard(),
                  _TeachersCard()
                ],
              ),
              SizedBox(height: 0.02.sh),
              _header(),
              SizedBox(height: 0.02.sh),
              Text(
                "CORE COMMITTEE",
                style: TextStyle(
                  fontFamily: "heading",
                  fontSize: 0.065*MediaQuery.of(context).size.width,
                  color: Colors.white,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  _CoreCard(),
                  _CoreCard(),
                  _CoreCard(),
                  _CoreCard(),
                  _CoreCard()
                ],
                )
              )
            ]
    );
  }

  Widget Page2(){
    return Column(
            children: [
              Text(
                  "TECH TEAM",
                  style: TextStyle(
                      fontSize: 0.075*MediaQuery.of (context).size.width,
                      fontFamily: "heading",
                      color: Colors.white
                  )
              ),
              SizedBox(height: 0.02*MediaQuery.of (context).size.height),
              for(int i=0; i<6; i++)
                _Techlist("MemberName"),
              SizedBox(height: 0.08*MediaQuery.of (context).size.height),
              Center(
                child:Text(
                    "EVENT MANAGEMENT",
                    style: TextStyle(
                        fontSize: 0.06*MediaQuery.of (context).size.width,
                        fontFamily: "heading",
                        color: Colors.white
                    )
                ),
              ),
              SizedBox(height: 0.02*MediaQuery.of (context).size.height),
              for(int i=0; i<6; i++)
                _Eventlist("MemberName"),
              SizedBox(height: 0.1*MediaQuery.of (context).size.height),
            ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: () =>Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: _backgroundImage(),
          child: Container(
              color: Colors.black.withOpacity(0.3),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Page1(),
                  Page2(),
                ]
              )
        )
    )
    )
    );
  }
}
