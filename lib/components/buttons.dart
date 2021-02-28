import 'dart:ui';

import 'package:calculator/components/texts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class _ButtonBase extends StatelessWidget {
  final String title;
  final Color color;
  var shape;
  var listener;

  _ButtonBase({this.title, this.color, this.shape, this.listener});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
        color: color,
        onPressed: this.listener,
        shape: shape,
        child: TextButtonsDefault(this.title));
  }
}

// ignore: must_be_immutable
class ButtonRounded extends _ButtonBase {
  ButtonRounded(String text, Color color, var listener)
      : super(
            title: text,
            color: color,
            shape: CircleBorder(),
            listener: listener);
}
