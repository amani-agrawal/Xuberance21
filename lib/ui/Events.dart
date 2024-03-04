import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xuberance2021/model/event.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:xuberance2021/model/school.dart';

import 'eventRules.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
// To be filled.
// Using dummy value to get it to compile.
  List<Event> eventfield = [NAME_TO_EVENT_MAP['x_meme']!];

  final PageController _pageController = PageController(initialPage: 2);

  Widget _background() {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/sponsors_background.png'),
        fit: BoxFit.cover,
      )),
    );
  }

  Widget _title() {
    return Container(
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Text(
          "Events",
          style: TextStyle(
            fontFamily: "tesla",
            fontSize: 50,
            color: Colors.white,
          ),
        ));
  }

  Widget _card(title, AssetImage logo) {
    return Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade700,
              width: 0.02 * MediaQuery.of(context).size.width,
            ),
            image: DecorationImage(
                image: AssetImage("images/card_background.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
                child: Padding(
                    padding: EdgeInsets.all(8), child: Image(image: logo))),
            Text("$title",
                textAlign: TextAlign.center,
                style: TextStyle(
                    wordSpacing: 100,
                    fontSize: (100 - title.toString().length) *
                        0.00035 *
                        MediaQuery.of(context).size.width,
                    color: Colors.white,
                    fontFamily: "heading")),
            SizedBox(height: 0.03 * MediaQuery.of(context).size.width)
          ],
        ));
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontFamily: "heading",
      color: Colors.white);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Live',
      style: optionStyle,
    ),
    Text(
      'Recorded',
      style: optionStyle,
    ),
    Text(
      'Streaming',
      style: optionStyle,
    ),
    Text(
      'Gaming',
      style: optionStyle,
    ),
  ];

  Widget _cardevent(Event _field) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EventRules(_field)));
      },
      child: Hero(
        tag: "event",
        child: Card(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 40),
          child: _card("X-Uberance", AssetImage("images/card_logo.png")),
        ),
      ),
    );
  }

  Widget _card_menu() {
    return Flexible(
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          for (int i = 0; i < eventfield.length; i++) _cardevent(eventfield[i])
        ],
      ),
    );
  }

  Widget _page1() {
    return Stack(
      children: [
        _background(),
        Column(
          children: [
            _title(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                  onPressed: () {},
                  child: Text(
                    "4-5",
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                  onPressed: () {
                    _pageController.jumpToPage(1);
                  },
                  child: Text(
                    "6-8",
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                  onPressed: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Text(
                    "9-12",
                  ),
                ),
              ),
            ]),
            _card_menu(),
          ],
        )
      ],
    );
  }

  Widget _page2() {
    return Stack(
      children: [
        _background(),
        Column(
          children: [
            _title(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                  onPressed: () {
                    _pageController.jumpToPage(0);
                  },
                  child: Text(
                    "4-5",
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                  onPressed: () {},
                  child: Text(
                    "6-8",
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                  onPressed: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Text(
                    "9-12",
                  ),
                ),
              ),
            ]),
            _card_menu(),
          ],
        )
      ],
    );
  }

  Widget _page3() {
    return Scaffold(
        bottomNavigationBar: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Flexible(
                  child: Image.asset("images/lines.png"),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: FloatingNavbar(
                      currentIndex: _selectedIndex,
                      backgroundColor: Colors.lightBlueAccent,
                      width: 250,
                      borderRadius: 100.0,
                      fontSize: 10,
                      items: [
                        FloatingNavbarItem(
                          icon: Icons.camera,
                          title: "Live",
                        ),
                        FloatingNavbarItem(
                          icon: Icons.radio_button_checked,
                          title: "Recorded",
                        ),
                        FloatingNavbarItem(
                          icon: Icons.stream,
                          title: "Streaming",
                        ),
                        FloatingNavbarItem(
                          icon: Icons.videogame_asset,
                          title: "Gaming",
                        ),
                      ],
                      onTap: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                Flexible(
                  child: Image.asset("images/lines2.png"),
                ),
              ],
            ),
          ],
        ),
        extendBody: true,
        body: Stack(
          children: [
            _background(),
            Column(children: [
              _title(),
              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent),
                            onPressed: () {
                              _pageController.jumpToPage(0);
                            },
                            child: Text(
                              "4-5",
                            ),
                          ),
                        ),
                        Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent),
                            onPressed: () {
                              _pageController.jumpToPage(1);
                            },
                            child: Text(
                              "6-8",
                            ),
                          ),
                        ),
                        Container(
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.grey),
                            onPressed: () {},
                            child: Text(
                              "9-12",
                            ),
                          ),
                        ),
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: _widgetOptions[_selectedIndex],
                  ),
                ],
              ),
              _card_menu()
            ]),
          ],
        ));
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
        children: [_page1(), _page2(), _page3()],
      ),
    );
  }
}
