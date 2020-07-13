import 'package:flutter/material.dart';

import '../widget/ListItem2.dart';
import '../widget/AppBarCustom.dart';
import '../widget/SwipeToNavigate.dart';

import '../screen/check_group.dart';

class CheckInfoScreen extends StatelessWidget {
  static String id = 'CheckInfoScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeToNavigate.vertical(
        handleToBottom: () {
          Navigator.of(context).pushNamed(CheckGroupScreen.id);
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AppBarCustom(
                title: 'Info',
              ),
            ),
            SliverToBoxAdapter(
              child: ListView.builder(
                  controller: ScrollController(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return ListItem2(title: 'CheckInfo $index'.toString());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
