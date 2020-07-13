import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/ListBLoc2.dart';
import '../widget/ListItem2.dart';
import '../widget/SwipeToNavigate.dart';

class CheckListScreen extends StatefulWidget {
  static String id = 'CheckList';

  @override
  _CheckListScreenState createState() => _CheckListScreenState();
}

class _CheckListScreenState extends State<CheckListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeToNavigate.top(
        action: () {
          Navigator.of(context).pop();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('CheckListScreen'),
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
