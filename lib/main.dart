import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/ListBLoc1.dart';
import 'bloc/ListBLoc2.dart';

import 'screen/check_group.dart';
import 'screen/check_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ListBLoc1>(
          create: (_) => ListBLoc1(),
        ),
        Provider<ListBLoc2>(
          create: (_) => ListBLoc2(),
        ),
      ],
      child: MaterialApp(
        title: 'List',
        home: CheckGroupScreen(),
        routes: <String, WidgetBuilder>{
          CheckGroupScreen.id: (BuildContext context) => CheckGroupScreen(),
          CheckListScreen.id: (BuildContext context) => CheckListScreen(),
        },
      ),
    );
  }
}
