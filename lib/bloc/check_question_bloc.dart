import 'dart:async';
import 'package:rxdart/rxdart.dart';

class CheckQuestionBLoc {
  var _controller = BehaviorSubject();

  Stream get stream => _controller.stream;

  void getQuestions(data) {
    _controller.add(data);
  }

  void dispose() {
    _controller.close();
  }
}
