import 'dart:math';

import 'package:draggable_pictures/Drag.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  generateRandomNumber() {
    Random random = new Random();
   // print(random.nextInt(10));
      var number = random.nextInt(10);
      print(number);
      return number;
  }


  void ButtonClicked() async {

    Duration time = Duration(seconds: 15);

    setState(() {
      isButtonClickable = false;                     //make the button disable to making variable false.

      Future.delayed(time,(){
        setState(() {
          isButtonClickable = true;                    //future delayed to change the button back to clickable
        });

      });
    });
  }

  bool _isDropped = false;
  bool isButtonClickable = true;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Colors.limeAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Drag Pictures',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            side: BorderSide(color: Colors.black, width: 4),
                          ),
                      onPressed: () {
                        if (isButtonClickable) {
                          ButtonClicked();
                        }
                      },
                      child: Text(
                        isButtonClickable?"Start Game":generateRandomNumber().toString(),
                        style: TextStyle(
                          fontSize: 25,fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 450,
                  width: 380,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(flex: 1,
                          child: Drag()
                          ),
                          Expanded(flex: 1,
                              child: Drag()
                          ),
                          Expanded(flex: 1,
                              child: Drag()
                          ),
                          Expanded(flex: 1,
                              child: Drag()
                          )

                        ],
                      ),

                      Row(
                        children: [
                          Expanded(flex: 1,
                              child: Drag()
                          ),
                          Expanded(flex: 1,
                              child: Drag()
                          ),
                          Expanded(flex: 1,
                              child: Drag()
                          ),
                          Expanded(flex: 1,
                              child: Drag()
                          )
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(flex: 1,
                              child: Container()
                          ),
                          Expanded(flex: 1,
                              child: Drag()
                          ),
                          Expanded(flex: 1,
                              child: Drag()
                          ),
                          Expanded(flex: 1,
                              child: Container()
                          )
                        ],
                      ),
                      DragTarget<String>(
                        builder: (
                            BuildContext context,
                            List<dynamic> accepted,
                            List<dynamic> rejected,
                            ) {
                          return Container(
                            height: 200,
                            width: 200,
                            child: Center(
                              child: Image.asset(_isDropped
                                  ? 'images/win.png'
                                  : 'images/bowl.png'),
                            ),
                          );
                        },
                        onWillAccept: (data) {
                          return data == 'red';
                        },
                        onAccept: (data) {
                          setState(() {
                            _isDropped = true;
                          });
                        },
                      )
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      side: BorderSide(color: Colors.black, width: 4),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => super.widget));
                    },
                    child: Text('Play Again',
                      style: TextStyle(
                        fontSize: 30,fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
