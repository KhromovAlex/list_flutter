import 'package:flutter/material.dart';
import 'package:list/screen/home_screen.dart';

import '../widget/AppBarCustom.dart';
import '../widget/SwipeToNavigate.dart';
import '../widget/ListItem2.dart';

class HistoryScreen extends StatelessWidget {
  static String id = 'History';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeToNavigate.vertical(
        handleToTop: () {
          Navigator.of(context).pushNamed(HomeScreen.id);
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AppBarCustom(
                title: 'History',
              ),
            ),
            SliverToBoxAdapter(
              child: ListView.builder(
                  controller: ScrollController(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return ListItem2(title: 'HistoryScreen $index'.toString());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
