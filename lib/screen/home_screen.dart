import 'package:flutter/material.dart';

//widgets
import '../widget/AppBarCustom.dart';
import '../widget/SwipeToNavigate.dart';

import '../widget/ListItem.dart';

import '../screen/history_screen.dart';
import '../screen/check_info.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return;
        },
        child: SwipeToNavigate(
          handleToBottom: () {
            Navigator.of(context).pushNamed(HistoryScreen.id);
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AppBarCustom(
                  title: 'Home',
                ),
              ),
              SliverToBoxAdapter(
                child: ListView.builder(
                    controller: ScrollController(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return ListItem(
                          handleTap: () {
                            Navigator.of(context).pushNamed(CheckInfoScreen.id);
                          },
                          title: 'HomeScreen $index'.toString());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
