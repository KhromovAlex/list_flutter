import 'dart:async';
import 'package:rxdart/rxdart.dart';

class ListBLoc2 {
  var _controller = BehaviorSubject<List>();

  Stream get stream => _controller.stream;

  void getQuestions(data) {
    _controller.add(data);
  }

  void dispose() {
    _controller.close();
  }
}
