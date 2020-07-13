import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/ListBLoc1.dart';
import '../bloc/ListBLoc2.dart';
import '../widget/ListItem.dart';
import 'check_list.dart';

import '../model/CheckListModel.dart';

class CheckGroupScreen extends StatelessWidget {
  static String id = 'CheckGroupScreen';
  const CheckGroupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('CheckGroupScreen'),
            ),
          ),
          Consumer<ListBLoc1>(
            builder: (context, _listBLoc1, child) {
              return StreamBuilder<List<CheckListModel>>(
                initialData: [],
                stream: _listBLoc1.stream,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return SizedBox.shrink();
                  }
                  List<CheckListModel> value = snapshot.data;
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
                                Navigator.of(context)
                                    .pushNamed(CheckListScreen.id);
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
