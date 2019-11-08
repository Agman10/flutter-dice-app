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
  List<int> _dice = [0, 0, 0, 0, 0];
  String _name = "You";
  //final TextEditingController controller = new TextEditingController();
  //TextEditingController _name = new TextEditingController();

  void _randomizeAll() {
    setState(() {
      for (int i = 0; i < _dice.length; i++) _diceRoll(i);
    });
  }

  void _diceRoll(int id) {
    setState(() {
      _dice[id] = rng(1, 7);
    });
  }

  String _getDices() {
    String str = "";
    for (int dice in _dice) str += '${dice}, ';
    return str.substring(0, str.length - 2);
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
              _getDices(),
              style: TextStyle(fontSize: 75, color: Colors.deepPurple[300]),
              //style: Theme.of(context).textTheme.display1, textScaleFactor: 2,
            ),
            //dice buttons
            new ButtonTheme.bar(
              child: new ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                    onPressed: () => {_diceRoll(0)},
                    color: Colors.deepPurple,
                    child: Icon(
                      Icons.casino,
                      color: Colors.white,
                    ),
                  ),
                  new RaisedButton(
                    onPressed: () => {_diceRoll(1)},
                    color: Colors.deepPurple,
                    child: Icon(
                      Icons.casino,
                      color: Colors.white,
                    ),
                  ),
                  new RaisedButton(
                    onPressed: () => {_diceRoll(2)},
                    color: Colors.deepPurple,
                    child: Icon(
                      Icons.casino,
                      color: Colors.white,
                    ),
                  ),
                  new RaisedButton(
                    onPressed: () => {_diceRoll(3)},
                    color: Colors.deepPurple,
                    child: Icon(
                      Icons.casino,
                      color: Colors.white,
                    ),
                  ),
                  new RaisedButton(
                    onPressed: () => {_diceRoll(4)},
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
