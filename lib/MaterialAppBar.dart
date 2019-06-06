import 'package:flutter/material.dart';

class MaterialAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Menu',
          onPressed: null,
        ),
        title: Text('Material'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
      body: Center(
        child: Text('Hello World'),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add',
          child: IconButton(
              icon: Icon(Icons.add),
              onPressed: null
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          }
      ),
    );
  }
}