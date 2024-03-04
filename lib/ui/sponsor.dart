import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sponsors extends StatefulWidget {

  @override
  _SponsorsState createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  List<AssetImage>  sponsor_logo = const [AssetImage("images/card_logo.png"),
    AssetImage("images/abc_logo.jfif"), AssetImage("images/insta_logo.jfif"),
    AssetImage("images/starbuck_logo.jfif"), AssetImage("images/car_logo.jfif"),
    AssetImage("images/news_logo.jfif")];
  List<String> sponsor_title = ["Title Sponsor", "Event Sponsor", "Education Consultancy Partner", "Web Development Partner", "Travel Sponsor", "Media Sponsor"];

  Widget _Card(title, AssetImage logo){
    return Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade700,
              width: 0.02*MediaQuery.of (context).size.width,
            ),
            image: DecorationImage(
                image: AssetImage("images/card_background.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(child: Padding(padding: EdgeInsets.all(8),
                child: Image(
                    image: logo))),
            Text(
                "$title",
                textAlign: TextAlign.center,
                style: TextStyle(
                    wordSpacing: 100,
                    fontSize: (100-title.toString().length)*0.00037*MediaQuery.of (context).size.width,
                    color: Colors.white,
                    fontFamily: "heading")
            ),
            SizedBox(height: 0.03*MediaQuery.of (context).size.width)
          ],
        )
    );
  }

  Widget _header(){
    return Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Image.asset("images/lines.png",
                  width: 0.25*MediaQuery.of (context).size.width,
                  height: 0.13*MediaQuery.of (context).size.height),
              Image.asset("images/linesRevert.png",
                width: 0.25*MediaQuery.of (context).size.width,
                height: 0.13*MediaQuery.of (context).size.height,),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 0.13*MediaQuery.of (context).size.height),
              Center(
                child: Text(
                    " SPONSORS",
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

  Widget _CardMenu() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                for(int i=0; i<sponsor_title.length; i++)
                  Card(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 40),
                    child: _Card(sponsor_title[i], sponsor_logo[i]),
                  ),
              ],
            ),
          ),
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
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/sponsors_background.png"),
                fit: BoxFit.cover,
              )
          ),
          child: Container(color: Colors.black.withOpacity(0.3),child: _CardMenu()),
        )
    );
  }
}
