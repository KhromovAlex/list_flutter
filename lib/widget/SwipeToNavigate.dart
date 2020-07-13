import 'package:flutter/material.dart';

class SwipeToNavigate extends StatefulWidget {
  final Function handleToTop;
  final Function handleToBottom;
  final Widget child;

  SwipeToNavigate({this.handleToTop, this.handleToBottom, this.child});

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
    _vertical();
  }

  void _vertical() {
    _handleSwipe = (scrollNotification) {
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
          if ((_isBottomScroll == true ||
                  scrollNotification.metrics.minScrollExtent ==
                      scrollNotification.metrics.maxScrollExtent) &&
              scrollNotification.overscroll > 7) {
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
    return NotificationListener(
        onNotification: _handleSwipe, child: widget.child);
  }
}
