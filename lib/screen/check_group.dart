import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/CheckGroupBLoc.dart';
import '../bloc/CheckListBLoc.dart';
import '../widget/ListItem.dart';
import 'check_list.dart';
import 'check_info.dart';
import '../widget/AppBarCustom.dart';
import '../widget/SwipeToNavigate.dart';

import '../model/CheckListModel.dart';

class CheckGroupScreen extends StatelessWidget {
  static String id = 'CheckGroupScreen';
  const CheckGroupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeToNavigate(
        handleToTop: () {
          Navigator.of(context).pushNamed(CheckInfoScreen.id);
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AppBarCustom(
                title: 'Group',
              ),
            ),
            Consumer<CheckGroupBLoc>(
              builder: (context, checkGroupBLoc, child) {
                return StreamBuilder<List<CheckListModel>>(
                  initialData: [],
                  stream: checkGroupBLoc.stream,
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
                                  Provider.of<CheckListBLoc>(context,
                                          listen: false)
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
      ),
    );
  }
}
