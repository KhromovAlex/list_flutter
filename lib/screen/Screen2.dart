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
  // ScrollController _scrollController = ScrollController();
  bool isTopScroll;
  var phiz;

  // void _scrollListener() {
  //   print(_scrollController);
  //   if (_scrollController.position.atEdge) {
  //     if (_scrollController.offset >=
  //             _scrollController.position.maxScrollExtent &&
  //         !_scrollController.position.outOfRange) {
  //       print('Низ');
  //     }
  //   }
  //   if (_scrollController.offset <=
  //           _scrollController.position.minScrollExtent &&
  //       !_scrollController.position.outOfRange) {
  //     print('Верх');
  //     // setState(() {
  //     //   isTopScroll = true;
  //     // });
  //   }
  // }

  bool handleNotificationListener(ScrollNotification scrollNotification) {
    if (scrollNotification is OverscrollNotification) {
      print('OverScroll');
    }
    if (scrollNotification is ScrollStartNotification) {
      // print(scrollNotification.metrics.axisDirection);
      // print(scrollNotification.metrics);
      if (scrollNotification.metrics.extentAfter ==
          scrollNotification.metrics.extentBefore) {
        // Navigator.of(context).pop();
        // print('ololo');
        setState(() {
          phiz = new NeverScrollableScrollPhysics();
        });
        // print(phiz);
      }
      //   setState(() {
      //     if (isTopScroll == true) {
      //       phiz = new NeverScrollableScrollPhysics();
      //     }
      //   });
    }
    if (scrollNotification is ScrollUpdateNotification) {
      if (isTopScroll == true && scrollNotification.metrics.pixels == 0.0) {
        // Navigator.of(context).pop();
      }
      if (scrollNotification.metrics.pixels == 0.0) {
      } else {
        setState(() {
          isTopScroll = false;
        });
      }
    }
    if (scrollNotification is ScrollEndNotification) {
      // print(scrollNotification);
      if (scrollNotification.metrics.extentAfter != 0.0 &&
          scrollNotification.metrics.pixels == 0.0 &&
          isTopScroll == true) {
        // Navigator.of(context).pop();
      }
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
    phiz = new ClampingScrollPhysics();
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
                return GestureDetector(
                  onVerticalDragUpdate: (dragUpdateDetails) {
                    // print(dragUpdateDetails);
                    if (dragUpdateDetails.delta.dy > 0) {
                      // Navigator.of(context).pop();
                    }
                  },
                  child: NotificationListener(
                    onNotification: handleNotificationListener,
                    child: ListView.builder(
                        // physics: new ClampingScrollPhysics(),
                        itemCount: value.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return ListItem2(title: value[index].toString());
                        }),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
