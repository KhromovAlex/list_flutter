import 'dart:async';
import 'package:rxdart/rxdart.dart';

import '../model/CheckList.dart';

class ListBLoc1 {

  var _controller = BehaviorSubject<List<CheckList>>.seeded([
  CheckList(
      name: "Test 1", questions: ["Question 1", "Question 2", "Question 3"]),
  CheckList(
      name: "Test 2", questions: ["Question 1", "Question 2", "Question 3", "Question 4"])
]);

  Stream get stream => _controller.stream;

  void dispose() {
    _controller.close();
  }
}
