import 'package:animal_crossing_completion/pages/board_pages/tutorial.dart';
import 'package:animal_crossing_completion/user.dart';
import 'package:flutter/material.dart';

bool card1 = false;
bool card2 = false;

class BoardHemisphere extends StatefulWidget {
  static const routeName = "/hemisphereInput";

  @override
  _BoardHemisphereState createState() => _BoardHemisphereState();
}

class _BoardHemisphereState extends State<BoardHemisphere> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: new EdgeInsets.only(top: 24.0),
      decoration: BoxDecoration(
          color: Colors.brown,
          image: DecorationImage(
              fit: BoxFit.cover, image: new AssetImage('res/fond.png'))),
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset('res/hemisphere.jpg'),
                new Container(
                  margin: new EdgeInsets.only(
                      left: 24.0, right: 24.0, bottom: 20.0, top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "Hello ${User.name}",
                        style: new TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w600),
                      ),
                      new Text("Nice to meet you",
                          style: new TextStyle(fontSize: 24.0)),
                      new Text(
                        "\nSelect in which part of the world you are living.",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin:
                      new EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
                  child: new Material(
                      elevation: 5.0,
                      color: card1 ? Colors.blue : Colors.white,
                      child: new Material(
                        color: Colors.transparent,
                        child: new InkWell(
                            onTap: () {
                              setState(() => card1 = !card1);
                              setState(() => card2 = false);
                            },
                            child: new Container(
                              padding: new EdgeInsets.all(16.0),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      /// Task description
                                      new Flexible(
                                        child: new Text("North hemisphere",
                                            style: new TextStyle(
                                                color: card1
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      new Checkbox(
                                        onChanged: (bool newState) {
                                          setState(() => card1 = newState);
                                          setState(() => card2 = false);
                                        },
                                        activeColor: Colors.blue,
                                        value: card1,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      )),
                ),
                new Container(
                  margin:
                      new EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
                  child: new Material(
                      elevation: 5.0,
                      color: card2 ? Colors.blue : Colors.white,
                      child: new Material(
                        color: Colors.transparent,
                        child: new InkWell(
                            onTap: () {
                              setState(() => card2 = !card2);
                              setState(() => card1 = false);
                            },
                            child: new Container(
                              padding: new EdgeInsets.all(16.0),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      /// Task description
                                      new Flexible(
                                        child: new Text("South hemisphere",
                                            style: new TextStyle(
                                                color: card2
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      new Checkbox(
                                        onChanged: (bool newState) {
                                          setState(() => card2 = newState);
                                          setState(() => card1 = false);
                                        },
                                        activeColor: Colors.blue,
                                        value: card2,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      )),
                ),
                card1 || card2
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Text(''),
                            new Expanded(
                              child: Align(
                                  alignment: FractionalOffset.bottomRight,
                                  child: new Container(
                                      margin: new EdgeInsets.only(
                                          left: 16.0, right: 16.0, top: 24.0),
                                      child: new RaisedButton(
                                        onPressed: () {
                                          saveHemisphere();
                                        },
                                        color: Colors.black,
                                        child: new ListTile(
                                          title: new Text('Next',
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600)),
                                          trailing: new Icon(Icons.arrow_forward,
                                              color: Colors.white),
                                        ),
                                      ))),
                            )
                          ],
                        ),
                      )
                    : new Container()
              ],
            ),
          ),
        ],
      ),
    ));
  }

  saveHemisphere() async {
    if (card1) {
      User.prefs.setBool('hemisphere', true);
      await User.prefs.commit();
      setState(() => User.hemisphere = true);
    } else {
      User.prefs.setBool('hemisphere', false);
      await User.prefs.commit();
      setState(() => User.hemisphere = false);
    }

    Navigator.of(context).pushReplacementNamed(BoardTutorial.routeName);
  }
}
