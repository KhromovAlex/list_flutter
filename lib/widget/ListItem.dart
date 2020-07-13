import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final int count;
  final Function handleTap;
  ListItem({this.title, this.count, this.handleTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(2, 2), blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: ListTile(
          title: Text('$title'),
          trailing: Text(
            '${count ?? ""}',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
