import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flare_flutter/flare_actor.dart';

final _random = new Random();
//random number
int rng(int min, int max) => min + _random.nextInt(max - min);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _dice1 = 0;
  int _dice2 = 0;
  int _dice3 = 0;
  String _name = "You";
  //final TextEditingController controller = new TextEditingController();
  //TextEditingController _name = new TextEditingController();

  void _randomizeAll() {
    setState(() {
      _dice1 = rng(1, 7);
      _dice2 = rng(1, 7);
      _dice3 = rng(1, 7);
    });
  }

  void _diceRoll1() {
    setState(() {
      _dice1 = rng(1, 7);
    });
  }

  void _diceRoll2() {
    setState(() {
      _dice2 = rng(1, 7);
    });
  }

  void _diceRoll3() {
    setState(() {
      _dice3 = rng(1, 7);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              maxLength: 20,
              //controller: _name,
              decoration: InputDecoration(hintText: 'Enter your name here'),
              onChanged: (str) {
                setState(() {
                  _name = str;
                });
              },
            ),
            Text(
              '$_name rolled:',
              style: TextStyle(fontSize: 25, color: Colors.deepPurple[900]),
            ),
            Text(
              '$_dice1, $_dice2, $_dice3',
              style: TextStyle(fontSize: 75, color: Colors.deepPurple[300]),
              //style: Theme.of(context).textTheme.display1, textScaleFactor: 2,
            ),
            //dice buttons
            new ButtonTheme.bar(
              child: new ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                    onPressed: _diceRoll1,
                    color: Colors.deepPurple,
                    child: Icon(
                      Icons.casino,
                      color: Colors.white,
                    ),
                  ),
                  new RaisedButton(
                    onPressed: _diceRoll2,
                    color: Colors.deepPurple,
                    child: Icon(
                      Icons.casino,
                      color: Colors.white,
                    ),
                  ),
                  new RaisedButton(
                    onPressed: _diceRoll3,
                    color: Colors.deepPurple,
                    child: Icon(
                      Icons.casino,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            //end dice buttons
            new RaisedButton(
              onPressed: _randomizeAll,
              color: Colors.deepPurple,
              child: Text(
                'Randomize all',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              child: FlareActor("assets/circles.flr", animation: "loading"),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.

      /* FloatingActionButton(
        onPressed: _diceCount2,
        tooltip: 'Dice2',
        child: Icon(Icons.casino),
      ), */
    );
  }
}
