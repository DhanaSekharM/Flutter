import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print('Button tapped');
        },
        child: Center(
          child: Container(
            height: 50.0,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(5.0)),
            child: Center(
              child: Text('Click', style: TextStyle(fontSize: 10.0)),
            ),
          ),
        ));
  }
}
