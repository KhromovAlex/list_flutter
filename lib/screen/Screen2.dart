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
      if (isTopScroll == true && scrollNotification.overscroll < -5) {
        Navigator.of(context).pop();
      }
    }
    if (scrollNotification is ScrollUpdateNotification && scrollNotification.metrics.pixels != 0.0) {
        setState(() {
          isTopScroll = false;
        });
    }
    if (scrollNotification is ScrollEndNotification) {
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
      body: NotificationListener(
        onNotification: handleNotificationListener,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Screen 2'),
              ),
            ),
            Consumer<ListBLoc2>(
              builder: (context, _listBLoc2, child) {
                return StreamBuilder(
                  initialData: [],
                  stream: _listBLoc2.stream,
                  builder: (context, snapshot) {
                    var value = snapshot.data;
                    return SliverToBoxAdapter(
                      child: ListView.builder(
                          controller: ScrollController(),
                          shrinkWrap: true,
                          itemCount: value.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return ListItem2(title: value[index].toString());
                          }),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
