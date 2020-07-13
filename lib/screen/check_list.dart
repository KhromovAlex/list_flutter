import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/CheckListBLoc.dart';
import '../bloc/check_question_bloc.dart';
import '../widget/ListItem.dart';
import '../widget/SwipeToNavigate.dart';
import 'check_question_box.dart';
import '../widget/AppBarCustom.dart';

class CheckListScreen extends StatefulWidget {
  static String id = 'CheckListScreen';

  @override
  _CheckListScreenState createState() => _CheckListScreenState();
}

class _CheckListScreenState extends State<CheckListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeToNavigate(
        handleToTop: () {
          Navigator.of(context).pop();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AppBarCustom(
                title: 'List',
              ),
            ),
            Consumer<CheckListBLoc>(
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
                          itemBuilder: (BuildContext context, int index) {
                            return ListItem(
                              title: value[index].toString(),
                              handleTap: () {
                                Provider.of<CheckQuestionBLoc>(context,
                                          listen: false)
                                      .getQuestions({'value': value, 'index': index});
                                Navigator.of(context)
                                    .pushNamed(CheckQuestionBoxScreen.id);
                              },
                            );
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
