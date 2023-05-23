import 'package:flutter/material.dart';

class FadePageRoute<T> extends PageRoute<T> {
  final Widget child;
  FadePageRoute(this.child);

  @override
  Color? get barrierColor => Colors.black;

  @override
  String? get barrierLabel => "barrier label";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      FadeTransition(
        opacity: animation,
        child: child,
      );

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
}
