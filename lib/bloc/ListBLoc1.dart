import 'dart:async';
import 'package:rxdart/rxdart.dart';

import '../model/CheckListModel.dart';

class ListBLoc1 {
  BehaviorSubject _controller = BehaviorSubject<List<CheckListModel>>();

  ListBLoc1() {
    _controller.add([
      CheckListModel(name: "Test 1", questions: [
        "Question 1",
        "Question 2",
        "Question 3",
        "Question 4",
        "Question 5",
        "Question 6",
        "Question 7",
        "Question 8",
        "Question 9",
        "Question 10",
        "Question 11",
        "Question 12",
        "Question 13",
        "Question 14",
        "Question 15",
        "Question 16",
        "Question 17",
        "Question 18",
        "Question 19",
        "Question 20",
        "Question 21",
        "Question 22",
        "Question 23",
        "Question 24"
      ]),
      CheckListModel(name: "Test 2", questions: [
        "Question 1",
        "Question 2",
        "Question 3",
      ]),
    ]);
  }

  Stream get stream => _controller.stream;

  void dispose() {
    _controller.close();
  }
}
