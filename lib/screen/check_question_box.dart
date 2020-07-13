import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'check_question.dart';
import '../bloc/check_question_bloc.dart';

class CheckQuestionBoxScreen extends StatelessWidget {
  static String id = 'CheckQuestionBoxScreen';
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckQuestionBLoc>(
        builder: (context, checkQuestionBLoc, child) {
      return StreamBuilder(
          stream: checkQuestionBLoc.stream,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return SizedBox.shrink();
            }
            return PageView.builder(
              controller: PageController(initialPage: snapshot.data['index']),
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data["value"].length,
              itemBuilder: (context, index) {
                return CheckQuestionScreen(index: snapshot.data['index']);
              },
            );
          });
    });
  }
}
