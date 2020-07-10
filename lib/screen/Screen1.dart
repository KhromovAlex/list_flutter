import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/ListBLoc1.dart';
import '../bloc/ListBLoc2.dart';
import '../widget/ListItem.dart';
import 'Screen2.dart';

import '../model/CheckList.dart';

class Screen1 extends StatelessWidget {
  static String id = 'Screen1';
  const Screen1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Screen 1'),
            ),
          ),
          Consumer<ListBLoc1>(
            builder: (context, _listBLoc1, child) {
              return StreamBuilder<List<CheckList>>(
                initialData: [],
                stream: _listBLoc1.stream,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return SizedBox.shrink();
                  }
                  List<CheckList> value = snapshot.data;
                  return SliverToBoxAdapter(
                    child: ListView.builder(
                        shrinkWrap: true,
                        controller: ScrollController(),
                        itemCount: value.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListItem(
                              title: value[index].name,
                              count: value[index].questions.length,
                              handleTap: () {
                                Provider.of<ListBLoc2>(context, listen: false)
                                    .getQuestions(value[index].questions);
                                Navigator.of(context).pushNamed(Screen2.id);
                              });
                        }),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
