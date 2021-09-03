import 'package:flutter/material.dart';

class Drag extends StatefulWidget {

  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Draggable(
          child: Container(
            margin: EdgeInsets.all(5),
            height: 70,
            width: 70,
            child: Image.asset('images/app.png'),
          ),
          feedback:Container(
            margin: EdgeInsets.all(5),
            height: 70,
            width: 70,
            child: Image.asset('images/app.png'),
          ),
          childWhenDragging: Container(),

        ),
      ],
    );
  }
}



