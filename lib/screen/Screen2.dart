import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/ListBLoc2.dart';
import '../widget/ListItem2.dart';

class Screen2 extends StatefulWidget {
  static String id = 'Screen2';

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool isTopScroll;

  bool handleNotificationListener(ScrollNotification scrollNotification) {
    if (scrollNotification is OverscrollNotification) {
      print(scrollNotification.overscroll);
      if (isTopScroll == true && scrollNotification.overscroll < -5) {
        // print(scrollNotification.overscroll);
        Navigator.of(context).pop();
      }
    }
    if (scrollNotification is ScrollStartNotification) {
      if (scrollNotification.metrics.extentAfter ==
          scrollNotification.metrics.extentBefore) {
        setState(() {});
      }
    }
    if (scrollNotification is ScrollUpdateNotification) {
      if (isTopScroll == true && scrollNotification.metrics.pixels == 0.0) {}
      if (scrollNotification.metrics.pixels == 0.0) {
      } else {
        setState(() {
          isTopScroll = false;
        });
      }
    }
    if (scrollNotification is ScrollEndNotification) {
      if (scrollNotification.metrics.extentAfter != 0.0 &&
          scrollNotification.metrics.pixels == 0.0 &&
          isTopScroll == true) {}
      if (scrollNotification.metrics.extentAfter == 0.0 &&
          isTopScroll == true) {}
      if (scrollNotification.metrics.pixels == 0.0) {
        setState(() {
          isTopScroll = true;
        });
      }
    }
  }

  @override
  void initState() {
    isTopScroll = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
        backgroundColor: Color(0xFF3D9098),
      ),
      body: Center(
        child: Consumer<ListBLoc2>(
          builder: (context, _listBLoc2, child) {
            return StreamBuilder(
              initialData: [],
              stream: _listBLoc2.stream,
              builder: (context, snapshot) {
                var value = snapshot.data;
                return NotificationListener(
                  onNotification: handleNotificationListener,
                  child: ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return ListItem2(title: value[index].toString());
                      }),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
