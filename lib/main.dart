import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// bloc
import 'bloc/CheckGroupBLoc.dart';
import 'bloc/CheckListBLoc.dart';
import 'bloc/check_question_bloc.dart';

// screeens
import 'screen/home_screen.dart';
import 'screen/check_info.dart';
import 'screen/check_group.dart';
import 'screen/check_list.dart';
import 'screen/history_screen.dart';
import 'screen/check_question_box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CheckGroupBLoc>(
          create: (_) => CheckGroupBLoc(),
        ),
        Provider<CheckListBLoc>(
          create: (_) => CheckListBLoc(),
        ),
        Provider<CheckQuestionBLoc>(
          create: (_) => CheckQuestionBLoc(),
        ),
      ],
      child: MaterialApp(
        title: 'List',
        home: HomeScreen(),
        routes: <String, WidgetBuilder>{
          HomeScreen.id: (BuildContext context) => HomeScreen(),
          HistoryScreen.id: (BuildContext context) => HistoryScreen(),
          CheckGroupScreen.id: (BuildContext context) => CheckGroupScreen(),
          CheckListScreen.id: (BuildContext context) => CheckListScreen(),
          CheckInfoScreen.id: (BuildContext context) => CheckInfoScreen(),
          CheckQuestionBoxScreen.id: (BuildContext context) => CheckQuestionBoxScreen(),
        },
      ),
    );
  }
}
