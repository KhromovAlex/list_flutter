import 'package:flutter/material.dart';

class SwipeToNavigate extends StatefulWidget {
  final Function action;
  final Widget child;
  String direction;
  SwipeToNavigate({this.action, this.child, this.direction});
  SwipeToNavigate.left({this.action, this.child}) {
    direction = 'left';
  }
  SwipeToNavigate.right({this.action, this.child}) {
    direction = 'right';
  }
  SwipeToNavigate.bottom({this.action, this.child}) {
    direction = 'bottom';
  }
  SwipeToNavigate.top({this.action, this.child}) {
    direction = 'top';
  }
  @override
  _SwipeToNavigateState createState() => _SwipeToNavigateState();
}

class _SwipeToNavigateState extends State<SwipeToNavigate> {
  bool _isTopScroll;
  bool _isBottomScroll;
  var _handleSwipe;

  @override
  void initState() {
    super.initState();
    _isTopScroll = true;
    _isBottomScroll = false;
    switch (widget.direction) {
      case 'top':
        top();
        break;
      case 'bottom':
        bottom();
        break;
      case 'left':
        left();
        break;
      case 'right':
        right();
        break;
    }
  }

  void left() {
    _handleSwipe = (scrollNotification) {};
  }

  void top() {
    _handleSwipe = (scrollNotification) {
      if (scrollNotification is OverscrollNotification) {
        if (_isTopScroll == true && scrollNotification.overscroll < -5) {
          widget.action();
        }
      }
      if (scrollNotification is ScrollUpdateNotification &&
          scrollNotification.metrics.pixels != 0.0) {
        setState(() {
          _isTopScroll = false;
        });
      }
      if (scrollNotification is ScrollEndNotification) {
        if (scrollNotification.metrics.pixels == 0.0) {
          setState(() {
            _isTopScroll = true;
          });
        }
      }
      return false;
    };
  }

  void right() {
    _handleSwipe = (scrollNotification) {};
  }

  void bottom() {
    _handleSwipe = (scrollNotification) {
      if (scrollNotification is OverscrollNotification) {
        if (_isBottomScroll == true && scrollNotification.overscroll > 7) {
          widget.action();
        }
      }
      if (scrollNotification is ScrollUpdateNotification &&
          scrollNotification.metrics.maxScrollExtent !=
              scrollNotification.metrics.pixels) {
        setState(() {
          _isBottomScroll = false;
        });
      }
      if (scrollNotification is ScrollEndNotification) {
        if (scrollNotification.metrics.maxScrollExtent ==
            scrollNotification.metrics.pixels) {
          setState(() {
            _isBottomScroll = true;
          });
        }
      }
      return false;
    };
  }

  @override
  Widget build(BuildContext context) {
    return widget.direction == 'top' || widget.direction == 'bottom'
        ? NotificationListener(
            onNotification: _handleSwipe, child: widget.child)
        : GestureDetector(onPanUpdate: _handleSwipe, child: widget.child);
  }
}
