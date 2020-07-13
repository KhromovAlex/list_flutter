import 'package:flutter/material.dart';

import '../widget/AppBarCustom.dart';
import '../widget/ListItem2.dart';
import '../widget/SwipeToNavigate.dart';

class CheckQuestionScreen extends StatelessWidget {
  final int index;
  CheckQuestionScreen({this.index});
  static String id = 'CheckQuestionScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SwipeToNavigate(
            handleToTop: () {
              Navigator.of(context).pop();
            },
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: AppBarCustom(
                    title: 'Question',
                  ),
                ),
                SliverToBoxAdapter(
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return ListItem2(
                          title: 'CheckQuestionScreen $index',
                        );
                      }),
                ),
              ],
            )));
  }
}
