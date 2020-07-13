import 'package:flutter/material.dart';

class SwipeToNavigate extends StatefulWidget {
  Function handleToLeft;
  Function handleToRight;
  Function handleToTop;
  Function handleToBottom;
  final Widget child;
  String direction;

  SwipeToNavigate(
      {this.handleToLeft,
      this.handleToRight,
      this.handleToTop,
      this.handleToBottom,
      this.child,
      this.direction = 'all'});

  SwipeToNavigate.vertical(
      {this.handleToTop, this.handleToBottom, this.child}) {
    direction = 'vertical';
  }
  SwipeToNavigate.horizontal(
      {this.handleToLeft, this.handleToRight, this.child}) {
    direction = 'horizontal';
  }

  @override
  _SwipeToNavigateState createState() => _SwipeToNavigateState();
}

class _SwipeToNavigateState extends State<SwipeToNavigate> {
  bool _isTopScroll;
  bool _isBottomScroll;
  var _handleSwipeHorizontal;
  var _handleSwipeVertical;

  @override
  void initState() {
    super.initState();
    _isTopScroll = true;
    _isBottomScroll = false;
    initDirection();
  }

  void initDirection() {
    switch (widget.direction) {
      case 'horizontal':
        _horizontal();
        break;
      case 'vertical':
        _vertical();
        break;
      case 'all':
        _horizontal();
        _vertical();
        break;
    }
    return;
  }

  void _horizontal() {
    _handleSwipeHorizontal = (DragUpdateDetails details) {
      print(details.delta.dx);
      if (widget.handleToLeft != null) {
        if (details.delta.dx < -5) {
          widget.handleToLeft();
        }
      }

      if (widget.handleToRight != null) {
        if (details.delta.dx > 5) {
          widget.handleToRight();
        }
      }
    };
  }

  void _vertical() {
    _handleSwipeVertical = (scrollNotification) {
      if (widget.handleToTop != null) {
        if (scrollNotification is OverscrollNotification) {
          if (_isTopScroll == true && scrollNotification.overscroll < -5) {
            widget.handleToTop();
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
      }

      if (widget.handleToBottom != null) {
        if (scrollNotification is OverscrollNotification) {
          if (_isBottomScroll == true && scrollNotification.overscroll > 7) {
            widget.handleToBottom();
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
      }
      return false;
    };
  }

  @override
  Widget build(BuildContext context) {
    return widget.direction == 'all'
        ? NotificationListener(
            onNotification: _handleSwipeVertical,
            child: GestureDetector(
              child: widget.child,
              onPanUpdate: _handleSwipeHorizontal,
            ),
          )
        : widget.direction == 'vertical'
            ? NotificationListener(
                onNotification: _handleSwipeVertical, child: widget.child)
            : GestureDetector(
                child: widget.child,
                onPanUpdate: _handleSwipeHorizontal,
              );
  }
}
