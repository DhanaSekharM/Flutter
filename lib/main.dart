

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.only(top: 24.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue),
      child: Row(
        children: <Widget>[
          IconButton(
            icon:Icon(Icons.menu),
            tooltip: 'Navigation Menu',
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
    );
  }

}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Title',
              style: Theme.of(context).primaryTextTheme.title,
            )
          ),
          Expanded(
            child: Center(
              child: Text(
                'Hello World'
              ),
            ),
          )
        ],
      ),
    );
  }

}


void main() {
  runApp(MaterialApp(
    title: 'Hello World',
    home: MyScaffold(),
  ));
}