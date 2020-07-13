import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  final String title;
  final String subtitle;
  final int currentCount;
  final int allCount;
  const AppBarCustom(
      {this.title, this.subtitle, this.currentCount, this.allCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Row(children: <Widget>[
        Column(
          children: <Widget>[
            Text(title.toUpperCase() ?? '', style: TextStyle(fontSize: 30),),
            Text(subtitle ?? ''),
          ],
        ),
        Text(allCount == null ? '' : allCount.toString()),
      ],),
    );
  }
}
