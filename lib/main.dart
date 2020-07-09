import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/ListBLoc1.dart';
import 'bloc/ListBLoc2.dart';

import 'screen/Screen1.dart';
import 'screen/Screen2.dart';

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
        home: Screen1(),
        routes: <String, WidgetBuilder>{
          Screen1.id: (BuildContext context) => Screen1(),
          Screen2.id: (BuildContext context) => Screen2(),
        },
      ),
    );
  }
}
