import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Dart:math';
import 'package:flutter/widgets.dart';

void main() {
  return runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text('Dicee', textAlign: TextAlign.center),
        backgroundColor: Colors.redAccent,
      ),
      body: DiceArea(),
      bottomNavigationBar: BottomBar(),
    ));
  }
}

class DiceArea extends StatefulWidget {
  @override
  createState() => DiceAreaState();
}

class DiceAreaState extends State<DiceArea> {
  int n1 = 1;
  int n2 = 5;
  int comScore = 0;
  int playerScore = 0;

    castDice() {
        setState(() {
        var rand = Random();
        n1 = rand.nextInt(6) + 1;
        n2 = rand.nextInt(6) + 1;
        if (n1 == n2 || n1 + n2 < 7) {
            comScore += 10;
        } else {
            playerScore += 10;
        }
        });
    }

FlatButton flatButton(){
        return FlatButton(
              child: Icon(
                Icons.clear,
                color: Colors.white70,
                size: 30.0,
              ),
              onPressed: () {
                   resetGame();
              });
    }
  resetGame() {
      print('sdfjdfshjjhjds');
    setState(() {
      comScore = 0;
      playerScore = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: Row(
              //crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/dice$n1.png', width: 80.0),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/dice$n2.png', width: 80.0),
                ),
              ]),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: Row(
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/avatar/avatar3.jpg',
                  width: 60.0,
                ),
              ),
              Container(
                width: 40.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white70,
                ),
                child: Center(
                  child: Text(
                    '$comScore',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Image.asset(
                'assets/avatar/avatar7.jpg',
                width: 60.0,
              ),
              Container(
                width: 40.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white70,
                ),
                child: Center(
                  child: Text(
                    '$playerScore',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: FlatButton(
            onPressed: () {
              castDice();
            },
            child: Icon(
              Icons.crop_rotate,
              size: 60.0,
              color: Colors.white30,
            ),
            //color: Colors.white70,
          ),
        ),
      ],
    );
  }
}

class BottomBar extends StatefulWidget {
  @override
  createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.redAccent,
      elevation: 20.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              child: Icon(
                Icons.view_carousel,
                size: 30.0,
              ),
              onPressed: () {},
              color: Colors.white30,
            ),
            FlatButton(
              child: Icon(
                Icons.play_circle_filled,
                size: 30.0,
              ),
              onPressed: () {},
              color: Colors.white30,
            ),
            new DiceAreaState().flatButton()
          ],
        ),
      ),
    );
  }
}
