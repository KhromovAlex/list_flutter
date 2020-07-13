import 'package:flutter/material.dart';

class ListItem2 extends StatelessWidget {
  final String title;
  ListItem2({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 5)
        ],
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: ListTile(
        title: Text('$title'),
      ),
    );
  }
}
